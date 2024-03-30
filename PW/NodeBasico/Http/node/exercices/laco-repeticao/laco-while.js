const http = require("http");
const url = require("url");
// Laço while

/*
Crie um jogo onde o computador "pensa" em um número aleatório entre 1 e 100, e o jogador tem que adivinhar esse número. O computador deve informar se o palpite do jogador está muito alto, muito baixo ou correto. O jogo continua até que o jogador acerte o número.
*/

let number = Math.floor(Math.random() * 100);

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

  let palpite = urlInfo.query.palpite;

  if (!palpite) {
    res.end(
      `<form action="" method="get">
          <label for="palpite">Entre com o seu paplpite</label>
          <input type="number" name="palpite" id="palpite" />
          <br />
          <input type="submit" />
        </form>`
    );
  } else {
    while (palpite != number) {
      palpite = Number(palpite);

      res.write(
        `<form action="" method="get">
          <label for="palpite">Entre com o seu paplpite</label>
          <input type="number" name="palpite" id="palpite" />
          <br />
          <input type="submit" />
        </form>`
      );

      if (palpite === number) {
        res.write(`Acertou!`);
        break;
      } else if (palpite > number) {
        res.write("Errou, o número é menor");
      } else {
        res.write("Errou, o número é maior");
      }

      res.end();
      return;
    }
  }
});

server.listen(3000, () => {
  console.log(`Servidor rodando na porta 3000`);
  console.log(number);
});
