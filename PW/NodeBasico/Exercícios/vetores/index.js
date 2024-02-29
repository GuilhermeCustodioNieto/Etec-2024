import inquirer from "inquirer";
import chalk from "chalk";

// Criar um programa que leia um vetor A com 10 posições de inteiro e imprima na tela um vetor b sendo que cada elemento de B seja o quadrado de A
console.log(chalk.italic(`Exercício de Vetores`));

let vetorA = new Array();

for (let i = 0; i < 10; i++) {
  await inquirer
    .prompt([
      {
        message: `entre com o número da posição ${i + 1}: `,
        name: "atual",
      },
    ])
    .then((answers) => {
      vetorA.push(Number(answers.atual));
    });
}
let vetorB = new Array();

vetorA.forEach((atual) => {
  let atualCalculado = atual ** 2;
  vetorB.push(atualCalculado);
});

console.log(chalk.bgGray("Numeros atualizados: "));
vetorB.forEach((atual) => {
  console.log(chalk.blue(atual));
});

console.log("Fim do programa");
