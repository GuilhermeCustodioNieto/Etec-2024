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

    res.write(`<h2>ÁREA: ${calculos.area(largura, altura)} </h2>`);
    res.write(`<h2>PERIMETRO: ${calculos.perimetro(largura, altura)} </h2>`);
    res.write(
      `<h2>DIAGONAL: ${calculos.diagonal(largura, altura).toFixed(2)}</h2>`
    );
  }
});

server.listen(3000, () => {
  console.log(`Servidor rodando na porta 3000`);
});
