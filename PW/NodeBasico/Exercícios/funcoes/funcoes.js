// Funções

import inquirer from "inquirer";
import chalk from "chalk";

/*
Faça um programa que tenha uma função chamada área(), que receba as dimensões de um terreno retangular (largura e comprimento) e mostre a área do terreno
*/
console.log(chalk.italic(`Exercício de Função`));

function calcularArea(largura, comprimento) {
  return largura * comprimento;
}

let executar = true;

while (true) {
  await inquirer
    .prompt([
      {
        message: "Deseja calcular área? (SIM/NÃO) ",
        name: "choice",
      },
    ])
    .then((answers) => {
      if (answers.choice == "não") {
        executar = false;
      }
    });

  if (!executar) {
    break;
  }
  await inquirer
    .prompt([
      {
        message: "Entre com a largura do lugar: ",
        name: "largura",
      },
      {
        message: "Entre com o comprimento do lugar: ",
        name: "comprimento",
      },
    ])
    .then((answers) => {
      let largura = Number(answers.largura),
        comprimento = Number(answers.comprimento);

      console.log(
        `O resultado do calculo é: ` +
          chalk.cyan(`${calcularArea(largura, comprimento)}`)
      );
    })
    .catch((error) => {
      console.log(error);
    });
}

console.log("Fim do programa");
