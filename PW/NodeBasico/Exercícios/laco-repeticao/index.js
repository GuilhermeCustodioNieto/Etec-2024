import inquirer from "inquirer";

// Laço for

// Imprimir a tabuada
await inquirer
  .prompt([
    {
      message: "Entre com a tabuada que você quer",
      name: "number",
    },
  ])
  .then((answers) => {
    let number = answers.number;

    for (let i = 0; i <= number; i++) {
      console.log(`${number} x ${i} = ${i * number}`);
    }
  });

// Laço while

/*
Crie um jogo onde o computador "pensa" em um número aleatório entre 1 e 100, e o jogador tem que adivinhar esse número. O computador deve informar se o palpite do jogador está muito alto, muito baixo ou correto. O jogo continua até que o jogador acerte o número.
*/
let number = Math.floor(Math.random() * 100);
let resposta = 0;

console.log(number);

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
        console.log("Acertou");
      } else if (resposta > number) {
        console.log("Errou, o número é menor");
      } else {
        console.log("Errou, o número é maior");
      }
    })
    .catch((error) => {
      console.log(error);
    });
}

// Do While
//Crie um programa que simule um jogo de dados simples. O jogo deve solicitar ao jogador que jogue um dado de 6 lados. Se o jogador tirar um número maior do que 4, ele ganha. Caso contrário, ele perde. O programa deve continuar permitindo que o jogador jogue até que ele decida parar ou até que ele ganhe.

const numberChoiced = Math.floor(Math.random() * 6);
let continuarJogando = true;

do {
  await inquirer
    .prompt([
      {
        message: "Escreva sua senha: ",
        name: "number",
      },
    ])
    .then((answers) => {
      let numberInput = Number(answers.number);
      if (numberInput == numberChoiced) {
        console.log("Acertou!");
        continuarJogando = false;
      } else {
        console.log("Errou");
      }
    })
    .catch((error) => {
      console.log(error);
    });
} while (continuarJogando);
