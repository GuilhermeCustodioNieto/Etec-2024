import inquirer from "inquirer";
import chalk from "chalk";

// Do While
//Crie um programa que simule um jogo de dados simples. O jogo deve solicitar ao jogador que jogue um dado de 6 lados. Se o jogador tirar um número maior do que 4, ele ganha. Caso contrário, ele perde. O programa deve continuar permitindo que o jogador jogue até que ele decida parar ou até que ele ganhe.
console.log(chalk.italic(`Exercício de Do-While`));

const numberChoiced = Math.floor(Math.random() * (6 - 1)) + 1;
let continuarJogando = true;

do {
  await inquirer
    .prompt([
      {
        message: "Um palpite para um dado de 6 faces ",
        name: "number",
      },
    ])
    .then((answers) => {
      let numberInput = Number(answers.number);
      if (numberInput == numberChoiced) {
        console.log(chalk.green("Acertou!"));
        continuarJogando = false;
      } else {
        console.log(chalk.red("Errou"));
      }
    })
    .catch((error) => {
      console.log(error);
    });
} while (continuarJogando);
