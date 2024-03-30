const http = require("http");
const url = require("url");

// Switch-Case

/*
2- Criar um programa que leia um número correspondente a um mês qualquer (de 1 a 12) e 
devolva se o referido mês tem 28, 30 ou 31 dias (desconsiderar anos bissextos).
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

const server = http.createServer((req, res) => {
  setup(req, res);
  const urlInfo = url.parse(req.url, true);

  let mes = urlInfo.query.mes;

  if (!mes) {
    res.end(
      '<form action="" method="get">' +
        '<label for="mes">Entre com o mês</label>' +
        '<input type="number" name="mes" id="mes" />' +
        '<input type="submit" value="Enviar" />' +
        "</form>"
    );
  } else {
    mes = Number(mes);

    switch (mes) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        res.end("Tem 31 dias");
        break;
      case 4:
      case 6:
      case 9:
      case 11:
        res.end("Tem 30 dias");
        break;
      case 2:
        res.end("Tem 28 dias");
        break;

      default:
        res.end("Tem 31 dias");
    }
  }
});

server.listen(3000, () => {
  console.log("Servidor rodando na porta 3000");
});
