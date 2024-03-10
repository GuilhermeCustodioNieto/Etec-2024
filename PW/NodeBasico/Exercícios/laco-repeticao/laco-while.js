import inquirer from "inquirer";
import chalk from "chalk";
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
