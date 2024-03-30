const http = require("http");
const url = require("url");
// Laço for

// Imprimir a tabuada

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

  let number = urlInfo.query.number;

  if (!number) {
    res.end(
      `<form action="" method="get">
        <label for="number">Entre com a tabuada que você quer</label>
        <input type="number" name="number" id="number" />
        <br />
        <input type="submit" />
      </form>`
    );
  } else {
    number = Number(number);

    for (let i = 0; i < number + 1; i++) {
      res.write(`${number} x ${i} = ${i * number}`);
      res.write(`<br>`);
    }
  }
  res.end();
});

server.listen(3000, () => {
  console.log(`Servidor rodando na porta 3000`);
});
