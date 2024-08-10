const express = require("express");
const handlebars = require("express-handlebars");
const mongoose = require("mongoose");
const admin = require("./controllers/admin");
const path = require("path");
const session = require("express-session");
const flash = require("connect-flash");
const { log } = require("console");
const usuarios = require("./controllers/usuarios");
require("./models/Noticia");
require("./models/Categoria");
const passport = require("passport");
require("./config/auth")(passport);

const Categoria = mongoose.model("Categorias");
const noticia = mongoose.model("Noticias");

// configs
// Flash

// Resto
const app = express();

app.use(
  session({
    secret: "blogapp",
    resave: true,
    saveUnitialized: true,
  })
);

app.use(passport.initialize());
app.use(passport.session());
app.use(flash());

//middleware
app.use((req, res, next) => {
  res.locals.success_msg = req.flash("success_msg");
  res.locals.error_msg = req.flash("error_msg");
  res.locals.error = req.flash("error");
  res.locals.user = req.user || null;
  next();
});

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.engine("handlebars", handlebars.engine({ default: true }));
app.set("view engine", "handlebars");

app.use(express.static(path.join(__dirname, "/views/public")));

mongoose.Promise = global.Promise;
mongoose
  .connect("mongodb://localhost/noticiasapp")
  .then(() => {
    console.log(`Conectado ao mongo`);
  })
  .catch((err) => {
    console.log(`Erro ao coectar, erro foi: ${err}`);
  });

// rotas
app.get("/", (req, res) => {
  noticia
    .find()
    .lean()
    .populate("categoria")
    .sort({ data: "desc" })
    .then((noticias) => {
      res.render("index", { noticias: noticias });
    })
    .catch((err) => {
      req.flash("error_msg", "Houve um erro interno");
      res.redirect("/404");
    });
});

app.get("/noticia/:slug", (req, res) => {
  noticia
    .findOne({ slug: req.params.slug })
    .lean()
    .then((noticia) => {
      if (noticia) {
        res.render("noticia/index", { noticia: noticia });
      } else {
        req.flash("error_msg", "Esta noticia não existe");
        res.redirect("/");
      }
    })
    .catch((err) => {
      req.flash("error_msg", "Houve um erro interno");
      res.redirect("/");
    });
});

app.get("/categorias", (req, res) => {
  Categoria.find()
    .lean()
    .then((categorias) => {
      res.render("categorias/index", { categorias: categorias });
    })
    .catch((err) => {
      req.flash("error_msg", "Houve um erro interno ao listar as categorias");
      res.redirect("/");
    });
});

app.get("/404", (req, res) => {
  res.send("Erro 404!");
});

app.get("/categorias/:slug", (req, res) => {
  Categoria.findOne({ slug: req.params.slug })
    .lean()
    .then((categoria) => {
      if (categoria) {
        noticia
          .find({ categoria: categoria._id })
          .lean()
          .then((noticias) => {
            res.render("categorias/noticias", {
              noticias: noticias,
              categoria: categoria,
            });
          })
          .catch((err) => {
            req.flash("error_msg", "Houve um erro ao listar os posts");
            res.redirect("/");
          });
      } else {
        req.flash("error_msg", "Esta categoria não existe");
        res.redirect("/");
      }
    })
    .catch((err) => {
      req.flash(
        "error_msg",
        "Houve um erro interno ao carregar a página desta categoria"
      );
      res.redirect("/");
    });
});

app.use("/admin", admin);

app.use("/usuarios", usuarios);

// Outros
const port = 3000;
app.listen(port, () => {
  console.log(`Servidor rodando em http://localhost:${port}`);
});
