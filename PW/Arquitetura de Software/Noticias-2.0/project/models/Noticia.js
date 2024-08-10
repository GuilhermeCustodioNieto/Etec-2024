const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const Noticia = new Schema({
  titulo: {
    type: String,
    required: true,
  },
  slug: {
    type: String,
    required: true,
  },
  descricao: {
    type: String,
    required: true,
  },
  conteudo: {
    type: String,
    required: true,
  },
  categoria: {
    type: Schema.Types.ObjectId,
    ref: "Categorias",
    required: true,
  },
  data: {
    type: Date,
    default: Date.now(),
  },
  autor: {
    type: String,
    required: true,
  },
});

mongoose.model("Noticias", Noticia);
