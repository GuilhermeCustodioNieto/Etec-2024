//IF E ELSE:

/*
Flíper é um tipo de jogo onde uma bolinha de metal cai por um labirinto de caminhos até chegar na parte de baixo do labirinto. A quantidade de pontos que o jogador ganha depende do caminho que a bolinha seguir. O jogador pode controlar o percurso da bolinha mudando a posição de algumas portinhas do labirinto. Cada portinha pode estar na posição 0, que significa virada para a esquerda, ou na posição 1 que quer dizer virada para a direita. Considere o flíper da figura abaixo, que tem duas portinhas. A portinha P está na posição 1 e a portinha R, na posição 0. Desse jeito, a bolinha vai cair pelo caminho B.

Você deve escrever um programa que, dadas as posições das portinhas 
P e R, neste flíper da figura, diga por qual dos três caminhos, A, B ou C, a bolinha vai cair!

Entrada
A entrada é composta por apenas uma linha contendo dois números P e R, indicando as posições das duas portinhas do flíper da figura.

Saída
A saída do seu programa deve ser também apenas uma linha, contendo uma letra maiúscula que indica o caminho por onde a bolinha vai cair: 'A', 'B' ou 'C'.

Fonte: tirada do neeps academy numero 87, link https://neps.academy/br/exercise/87
*/

const http = require("http");
const url = require("url");

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

http
  .createServer((req, res) => {
    setup(req, res);

    const urlInfo = url.parse(req.url, true);
    let portaP = urlInfo.query.portaP;
    let portaR = urlInfo.query.portaR;

    if (!portaP && !portaR) {
      res.end(
        '<form action="get">' +
          '<label for="portaR">Entre com o número da porta R</label>' +
          '<input type="number" name="portaR" id="portaR" />' +
          `<br>` +
          '<label for="portaP">Entre com o número da porta P</label>' +
          '<input type="number" name="portaP" id="portaP" />' +
          `<br>` +
          '<input type="submit" value="ENVIAR" />' +
          "</form>"
      );
    } else {
      if (portaP == 0) {
        res.end(`PORTA C`);
      } else if (portaR == 0) {
        res.end(`PORTA B`);
      } else {
        res.end(`PORTA A`);
      }
    }
  })
  .listen(3000, () => {
    console.log("Servidor rodando na porta 3000");
  });
