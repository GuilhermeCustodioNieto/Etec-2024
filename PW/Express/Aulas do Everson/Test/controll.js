import express from "express";
import path from "path";

let router = express.Router();

router.use(
  express.urlencoded({
    extended: true,
  })
);

router.use(express.json());

var autenticado = true;

const interceptador = function (req, res, next) {
  if (autenticado) {
    next();
  } else {
    res.redirect("/login");
  }
};

router.use(interceptador);

let user = {
  name: "",
  password: "",
};

router.get("/", (req, res) => {
  res.render("index");
});

router.get("/error", (req, res) => {
  res.render("error");
});

router.get("/login", (req, res) => {
  res.render("login");
});

router.post("/login", (req, res) => {
  if (
    req.body.name === "Guilherme Custódio Nieto" &&
    req.body.password === "22827496gA#"
  ) {
    user["name"] = req.body.name;
    user["password"] = req.body.password;
    autenticado = true;
    res.render("home", { user: user });
  } else {
    autenticado = false;
    res.render("error");
  }
});

router.get("/home", (req, res) => {
  res.render("home");
});

export default router;
