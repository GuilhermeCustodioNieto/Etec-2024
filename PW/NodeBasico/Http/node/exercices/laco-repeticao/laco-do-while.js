const http = require("http");
const url = require("url");

// Do While
//Crie um programa que simule um jogo de dados simples. O jogo deve solicitar ao jogador que jogue um dado de 6 lados. Se o jogador tirar um número maior do que 4, ele ganha. Caso contrário, ele perde. O programa deve continuar permitindo que o jogador jogue até que ele decida parar ou até que ele ganhe.

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

const numberChoiced = Math.floor(Math.random() * (6 - 1)) + 1;
let continuarJogando = true;

const server = http.createServer((req, res) => {
  setup(req, res);
  const urlInfo = url.parse(req.url, true);

  do {
    if (!urlInfo.query.number) {
      res.write(`
        <form action="" method="get">
          <label for="numberInput">Entre com o número que você quer</label>
          <input type="number" name="number" id="numberInput" />
          <br />
          <input type="submit" value="Enviar" />
        </form>
      `);
      break;
    } else {
      const numberInput = urlInfo.query.number;
      const numberChoiced = Math.floor(Math.random() * 6) + 1;

      if (numberInput == numberChoiced) {
        res.write(`<h1>Acertou! Parabéns</h1>`);
        continuarJogando = false;
      } else {
        res.write(
          `Que pena, você errou. O número correto era ${numberChoiced}. Tente novamente.`
        );
        res.write(`
          <form action="" method="get">
            <label for="numberInput">Entre com o número que você quer</label>
            <input type="number" name="number" id="numberInput" />
            <br/>
            <input type="submit" value="Enviar" />
          </form>
        `);
      }
    }
  } while (continuarJogando);

  res.end();
});

server.listen(3000, () => {
  console.log("Servidor rodando na porta 3000");
});
