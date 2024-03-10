import inquirer from "inquirer";
import chalk from "chalk";

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
console.log(chalk.italic(`Exercicio de IF/Else/Else if`));

await inquirer
  .prompt([
    {
      message: "Entre com a porta P ",
      name: "p",
    },
    {
      message: "Entre com a letra porta R",
      name: "r",
    },
  ])
  .then((answers) => {
    let portaR = Number(answers.r);
    let portaP = Number(answers.p);

    if (portaP == 0) {
      console.log(chalk.cyan("Porta C"));
    } else if (portaR == 0) {
      console.log(chalk.green("Porta B"));
    } else {
      console.log(chalk.red("Porta A"));
    }

    console.log("Fim do Programa");
  })
  .catch((error) => {
    console.error(error);
  });

console.log(chalk.cyan(`---------------------------------`));
