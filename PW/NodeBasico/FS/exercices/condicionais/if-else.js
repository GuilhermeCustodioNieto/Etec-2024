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

    res.write(`<h1>Portas do Fliper!</h1>`);

    if (!portaP && !portaR) {
      res.write(
        `Imagine o seguinte cenário: Você tem um fliper com 3 portas: A,B e C, cada uma podendo ser 0/1 (0 = fechado / 1 = aberto), digite qual porta está aberta e qual está fechada e vamos ver onde a bolinha vai cair`
      );

      res.write(`<br>`);

      res.write(`<strong>imagem do jogo de forma ilustrativa</strong>`);

      res.write(
        `<img src="https://neps.academy/_ipx/_/https://api.neps.academy/image/667.png">`
      );

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
      res.write(`<h1>A porta que está correta é...</h1>`);

      if (portaP == 0) {
        res.end(`Porta C!`);
      } else if (portaR == 0) {
        res.end(`Porta B!`);
      } else {
        res.end(`Porta  A!`);
      }
    }
  })
  .listen(3000, () => {
    console.log("Servidor rodando na porta 3000");
  });
