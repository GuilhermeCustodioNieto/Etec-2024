import express from "express";
import path from "path";

let router = express.Router();

router.use(
  express.urlencoded({
    extended: true,
  })
);

router.use(express.json());

app.get(`/`, (req, res) => {
  let index = path.resolve("./view/index.html");
  res.sendFile(index);
});

app.get(`/energia-eolica`, (req, res) => {
  let index = path.resolve("./view/html/pg1.html");
  res.sendFile(index);
});

app.get(`/real-madrid`, (req, res) => {
  let index = path.resolve("./view/html/pg2.html");
  res.sendFile(index);
});

app.get(`/mudancas-leis-trabalhistas`, (req, res) => {
  let index = path.resolve("./view/html/pg3.html");
  res.sendFile(index);
});

app.get(`/cotas-de-faculdades`, (req, res) => {
  let index = path.resolve("./view/html/pg4.html");
  res.sendFile(index);
});

app.get(`/coreia-do-norte`, (req, res) => {
  let index = path.resolve("./view/html/pg5.html");
  res.sendFile(index);
});

export default router;
