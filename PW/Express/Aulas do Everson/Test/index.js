import express from "express";
import router from "./controll.js";

let app = express();
let port = 3000;

app.use("/", router);
app.use(express.static("public"));

app.use(express.json());

app.listen(port, console.log("Rodando na porta 3000"));
