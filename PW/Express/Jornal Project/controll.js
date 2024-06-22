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
  res.render("index");
});

router.get(`/energia-eolica`, (req, res) => {
  res.render("pg1");
});

router.get(`/real-madrid`, (req, res) => {
  res.render("pg2");
});

router.get(`/mudancas-leis-trabalhistas`, (req, res) => {
  res.render("pg3");
});

router.get(`/cotas-de-faculdades`, (req, res) => {
  res.render("pg4");
});

router.get(`/coreia-do-norte`, (req, res) => {
  res.render("pg5");
});

export default router;
