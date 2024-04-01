const http = require("http");
const url = require("url");

const calculos = require(`./rectangle.js`);

// Faça um rpograma com um módulo externo que calcule a área, o perimetro e a diagonal de um retângulo.

function setup(req, res) {
  res.setHeader("Content-Type", "text/html");

  res.write(`
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />

      <style>
      .container{
        height: 101%;
        width: 101%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        background: rgb(6,20,27);
        background: linear-gradient(140deg, rgba(6,20,27,1) 0%, rgba(17,33,45,1) 20%, rgba(37,55,69,1) 40%, rgba(74,92,106,1) 60%, rgba(155,168,171,1) 80%, rgba(204,208,207,1) 100%);
    }
    .sub-container{
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      width: 300px;
      height: 350px;
      background-color: #00000057;
      border-radius: 10px;
      box-shadow: 0 0 12px #111;
      padding: 10px;
  }
      .text-titulo{
      font-size: 25px;
      padding: 15px;
      margin:10px;
      color: #eee;
    }

    .btn-input{
      border:solid 2px #222;
      background-color: #333;
      color: #eee;
      border-radius: 15px;
      box-shadow: 0 0 10px #222;
      padding: 15px;
  }
    .btn-input:hover{
    border:solid 1.5px #44a0a0;
    background-color: #548383;
    color: #fff;
    text-shadow: 0 0 10px #fff;
    border-radius: 15px;
    box-shadow: 0 0 10px #7da0ca;
    padding: 15px;
    transition:0.8s;
  }
  .input-text{
    border-radius: 5px;
    border: none;
    padding: 10px;
    margin: 5px;
  }
    .input-text:focus{
    background-color: #7da0ca;
    color: #000;
    font-size: 14px;
    border: solid 2px #052659;
  }
    .input-text::selection{
    background-color: #7da0ca;
  }

  .apresentacao{
    color: #eee;
    font-size: 35px;
    text-shadow: 0 0 15px #fff;
}

      </style>

      <title>Laço de repetição For</title>
    </head>
  `);
}

let server = http.createServer((req, res) => {
  setup(req, res);
  const urlInfo = url.parse(req.url, true);
  let largura = urlInfo.query.largura;
  let altura = urlInfo.query.altura;

  if (!largura && !altura) {
    res.end(`
    <form action="" method="get" class="container">
    <div class="sub-container">
      <label class="text-titulo" for="largura">Entre com a largura</label>
      <input class="input-text" type="text" name="largura" id="largura" />
      <br />
      <label class="text-titulo" for="altura">Entre com a altura</label>
      <input class="input-text" type="text" name="altura" id="altura" />
      <br />
      <input class="btn-input" type="submit" value="Enviar" />
      </div>
    </form>
  `);
  } else {
    largura = Number(largura);
    altura = Number(altura);

    res.write(`<div class="container">
    <h2 class="apresentacao">ÁREA: ${calculos.area(largura, altura)} </h2> <br>
    <h2 class="apresentacao">PERIMETRO: ${calculos.perimetro(largura, altura)} </h2> <br>
    <h2 class="apresentacao">DIAGONAL: ${calculos.diagonal(largura, altura).toFixed(2)}</h2>
    </div>`);
  }
});

server.listen(3000, () => {
  console.log(`Servidor rodando na porta 3000`);
});
