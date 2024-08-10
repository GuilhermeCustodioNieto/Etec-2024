const express = require("express");
const router = express.Router();
const mongoose = require("mongoose");
require("../models/Categoria");
require("../models/Noticia");
const { eAdmin } = require("../helpers/eAdmin");

const Categoria = mongoose.model("Categorias");
const noticia = mongoose.model("Noticias");

router.get("/", (req, res) => {
  res.render("admin/dashboard");
});

router.get("/posts", eAdmin, (req, res) => {
  res.send(`Página de posts`);
});

router.get(`/categorias`, eAdmin, (req, res) => {
  Categoria.find()
    .lean()
    .sort({ date: "desc" })
    .then((categorias) => {
      res.render("admin/categorias", { categorias: categorias });
    })
    .catch((err) => {
      req.flash("error_msg", "Houve um erro ao listar as categorias");
      res.redirect("/admin");
    });
});

router.get("/categorias/add", eAdmin, (req, res) => {
  res.render("admin/addcategorias");
});

router.post("/categorias/nova", eAdmin, (req, res) => {
  const erros = [];

  if (
    !req.body.name ||
    (typeof req.body.nome == undefined) | (typeof req.body.nome == null)
  ) {
    erros.push({ texto: "Nome inválido" });
  }

  if (
    !req.body.slug ||
    (typeof req.body.slug == undefined) | (typeof req.body.slug == null)
  ) {
    erros.push({ testo: "Slug inválido" });
  }

  if (req.body.nome.length < 2) {
    erros.push({ texto: "Nome da categoria é muito pequeno" });
  }

  if (erros.length < 0) {
    res.render("admin/addCategorias", { erros: erros });
  } else {
    const novaCategoria = {
      nome: req.body.nome,
      slug: req.body.slug,
    };

    new Categoria(novaCategoria)
      .save()
      .then(() => {
        req.flash("success_msg", `Categoria criada com sucesso`);
        res.redirect("/admin/categorias");
      })
      .catch((err) => {
        req.flash(
          "error_msg",
          "ocorreu um erro ao salvar a categoria, tente novamente"
        );
        res.redirect("/admin");
      });
  }
});

router.get("/categorias/edit/:id", eAdmin, (req, res) => {
  Categoria.findOne({ _id: req.params.id })
    .lean()
    .then((categoria) => {
      res.render("admin/editcategorias", { categoria: categoria });
    })
    .catch((err) => {
      req.flash("error_msg", "Esta categoria não existe");
      res.redirect("/admin/categorias");
    });
});

router.post("/categorias/edit", eAdmin, (req, res) => {
  Categoria.findOne({ _id: req.body.id })

    .then((categoria) => {
      categoria.nome = req.body.nome;
      categoria.slug = req.body.slug;

      categoria
        .save()
        .then(() => {
          req.flash("success_msg", "Categoria editada com sucesso");
          res.redirect("/admin/categorias");
        })
        .catch((err) => {
          req.flash(
            "error_msg",
            "Huve um erro ao salvar a ediçao da categoria"
          );
          res.redirect("/admin/categorias");
        });
    })
    .catch((err) => {
      console.log(err);
      req.flash("error_msg", "Houve um erro ao editar a categoria");
      res.redirect("/admin/categorias");
    });
});

router.post("/categorias/deletar", eAdmin, (req, res) => {
  Categoria.findOneAndDelete({ _id: req.body.id })
    .then(() => {
      req.flash("success_msg", "Categoria deletada com sucesso");
      res.redirect("/admin/categorias");
    })
    .catch((err) => {
      req.flash("error_msg", "Houve um erro ao deletar a categoria");
      res.redirect("/admin/categorias");
    });
});

router.get("/noticias", eAdmin, (req, res) => {
  noticia
    .find()
    .lean()
    .populate("categoria")
    .sort({ data: "desc" })
    .then((noticias) => {
      res.render("admin/noticias", { noticias: noticias });
    })
    .catch((err) => {
      console.log(err);
      req.flash("error_msg", "houve um erro ao listar as noticias");
      res.redirect("/admin");
    });
});

router.get("/noticias/add", (req, res) => {
  Categoria.find()
    .lean()
    .then((categorias) => {
      res.render("admin/addnoticia", { categorias: categorias });
    })
    .catch((err) => {
      req.flash("error_msg", "Houve um erro ao carregar o formulário");
      res.redirect("/admin");
    });
});

router.post("/noticias/nova", (req, res) => {
  var erros = [];

  if (req.body.categoria == "0") {
    erros.push({ text: "categoria inválida, registre uma categoria" });
  }

  if (erros.length > 0) {
    res.render("admin/addnoticias", { erros: erros });
  } else {
    const novanoticia = {
      titulo: req.body.titulo,
      slug: req.body.slug,
      descricao: req.body.descricao,
      conteudo: req.body.conteudo,
      categoria: req.body.categoria,
      autor: req.body.autor,
    };
    new noticia(novanoticia)
      .save()
      .then(() => {
        req.flash("success_msg", "noticia criada com sucesso");
        res.redirect("/admin/noticias");
      })
      .catch((err) => {
        req.flash(
          "error_msg",
          "Ocorreu um erro surante o salvamento da noticia"
        );
        res.redirect("/admin/noticias");
      });
  }
});

router.get("/noticias/edit/:id", eAdmin, (req, res) => {
  noticia
    .findOne({ _id: req.params.id })
    .lean()
    .then((noticia) => {
      Categoria.find()
        .lean()
        .then((categorias) => {
          res.render("admin/editnoticias", {
            categorias: categorias,
            noticia: noticia,
          });
        })
        .catch((err) => {
          req.flash("error_msg", "Houve um erro ao listar as categorias");
          res.redirect("/admin/noticias");
        });
    })
    .catch((err) => {
      req.flash(
        "error_msg",
        "houve um erro ao carregar o formulário de edição"
      );
      res.redirect("/admin/noticias");
    });
});

router.post("/noticia/edit", eAdmin, (req, res) => {
  noticia
    .findOne({ _id: req.body.id })
    .then((noticia) => {
      noticia.titulo = req.body.titulo;
      noticia.slug = req.body.slug;
      noticia.descricao = req.body.descricao;
      noticia.conteudo = req.body.conteudo;
      noticia.categoria = req.body.categoria;

      noticia
        .save()
        .then(() => {
          req.flash("success_msg", "noticia editada com sucesso");
          res.redirect("/admin/noticias");
        })
        .catch((err) => {
          req.flash("error_msg", "erro interno");
          res.redirect("/admin/noticias");
        });
    })
    .catch((err) => {
      req.flash("error_msg", "Houve um erro ao salvar a edição");
      res.redirect("/admin/noticias");
    });
});

router.get("/noticias/deletar/:id", eAdmin, (req, res) => {
  noticia
    .deleteOne({ _id: req.params.id })
    .then(() => {
      req.flash("success_msg", "noticia deletada com sucesso");
      res.redirect("/admin/noticias");
    })
    .catch((err) => {
      req.flash("error_msg", "Houve um erro interno");
      req.redirect("/admin/noticias");
    });
});

module.exports = router;
