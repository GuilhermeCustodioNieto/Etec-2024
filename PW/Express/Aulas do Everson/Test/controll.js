import express from "express";
import path from "path";

let router = express.Router();

router.use(
  express.urlencoded({
    extended: true,
  })
);

router.use(express.json());

const interceptador = function (req, res, next) {
  var autenticado = false;

  if (autenticado) {
    next();
  } else {
    let file = path.resolve("./src/pages/error.html");
    res.sendFile(file);
  }
};

router.use(interceptador);

router.get("/", (req, res) => {
  let index = path.resolve("./src/pages/index.html");
  res.sendFile(index);
});

router.get("/error", (req, res) => {
  let file = path.resolve("./src/pages/error.html");
  res.sendFile(file);
});

router.get("/login", (req, res) => {
  let file = path.resolve("./src/pages/login.html");
  res.sendFile(file);
});

router.post("/login", (req, res) => {
  if (
    req.body.name === "Guilherme Custódio Nieto" &&
    req.body.password === "22827496gA#"
  ) {
    res.redirect("/home");
  } else {
    res.redirect("/error");
  }
});

router.get("/home", (req, res) => {
  let file = path.resolve("./src/pages/home.html");
  res.sendFile(file);
});

export default router;
