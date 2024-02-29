import inquirer from "inquirer";
import chalk from "chalk";
// Laço for

// Imprimir a tabuada
console.log(chalk.italic(`Exercício de Laço For`));

await inquirer
  .prompt([
    {
      message: "Entre com a tabuada que você quer",
      name: "number",
    },
  ])
  .then((answers) => {
    let number = answers.number;

    for (let i = 0; i <= 10; i++) {
      console.log(`${number} x ${i} =` + chalk.blue(` ${i * number}`));
    }
  });

console.log(chalk.cyan(`---------------------------------`));

// Laço while

/*
Crie um jogo onde o computador "pensa" em um número aleatório entre 1 e 100, e o jogador tem que adivinhar esse número. O computador deve informar se o palpite do jogador está muito alto, muito baixo ou correto. O jogo continua até que o jogador acerte o número.
*/
console.log(chalk.italic(`Exercício de While`));

let number = Math.floor(Math.random() * 100);
let resposta = 0;

while (resposta != number) {
  await inquirer
    .prompt([
      {
        message: "Me fale seu palpite: ",
        name: "palpite",
      },
    ])
    .then((answers) => {
      resposta = Number(answers.palpite);
      if (resposta === number) {
        console.log(chalk.green("Acertou!"));
      } else if (resposta > number) {
        console.log(chalk.red("Errou, o número é menor"));
      } else {
        console.log(chalk.red("Errou, o número é maior"));
      }
    })
    .catch((error) => {
      console.log(error);
    });
}

console.log(chalk.cyan(`---------------------------------`));

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
