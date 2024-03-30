// Funções
const http = require("http");
const url = require("url");

/*
Faça um programa que tenha uma função chamada área(), que receba as dimensões de um terreno retangular (largura e comprimento) e mostre a área do terreno
*/
function setup(req, res) {
  res.setHeader("Content-Type", "text/html");

  res.write(`
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Condicionais</title>
    </head>
  `);
}

function calcularArea(largura, comprimento) {
  return largura * comprimento;
}

let executar = true;

const server = http.createServer((req, res) => {
  setup(req, res);
  const urlInfo = url.parse(req.url, true);

  let largura = urlInfo.query.largura;
  let altura = urlInfo.query.altura;

  if (!largura && !altura) {
    res.end(`
    <form action="" method="get">
      <label for="largura">Entre com a largura</label>
      <input type="text" name="largura" id="largura" />
      <br />
      <label for="altura">Entre com a altura</label>
      <input type="text" name="altura" id="altura" />
      <br />
      <input type="submit" value="Enviar" />
    </form>
  `);
  } else {
    largura = Number(largura);
    altura = Number(altura);

    let area = calcularArea(largura, altura);

    res.end(`<h1> A saida é ${area}`);
  }
});

server.listen(3000, () => {
  console.log("Servidor rodando na porta 3000");
});
