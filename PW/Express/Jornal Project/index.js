import express from "express";
import exphns from "express-handlebars";
import router from "./controll.js";

let app = express();
let port = 3000;

app.use("/", router);
app.use(express.static("public"));

app.engine("handlebars", exphns.engine());
app.set("view engine", "handlebars");

app.listen(port, console.log("Rodando na porta 3000"));
