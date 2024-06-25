import express from "express";
import path from "path";

let router = express.Router();

router.use(
  express.urlencoded({
    extended: true,
  })
);

router.use(express.json());

router.get(`/`, (req, res) => {
  let pagina = {
    tituloRevista: "Revista GL",
  };

  res.render("index", { pagina: pagina });
});

router.get(`/energia-eolica`, (req, res) => {
  let pagina = {
    tituloRevista: "Página 1",
  };

  res.render("pg1", { pagina: pagina });
});

router.get(`/real-madrid`, (req, res) => {
  let pagina = {
    tituloRevista: "Página 2",
  };

  res.render("pg2", { pagina: pagina });
});

router.get(`/mudancas-leis-trabalhistas`, (req, res) => {
  let pagina = {
    tituloRevista: "Página 3",
  };

  res.render("pg3", { pagina: pagina });
});

router.get(`/cotas-de-faculdades`, (req, res) => {
  let pagina = {
    tituloRevista: "Página 4",
  };

  res.render("pg4", { pagina: pagina });
});

router.get(`/coreia-do-norte`, (req, res) => {
  let pagina = {
    tituloRevista: "Página 5",
  };

  res.render("pg5", { pagina: pagina });
});

export default router;
