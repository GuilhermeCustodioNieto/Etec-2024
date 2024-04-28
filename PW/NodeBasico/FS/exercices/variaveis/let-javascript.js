import inquirer from "inquirer";
import chalk from "chalk";

//Faça um programa para ler dois valores inteiros A + B e imprima o resultado da expressão (A + B)
console.log(chalk.italic(`Exercício de Variáveis`));

await inquirer
  .prompt([
    {
      message: `Enter the A value: `,
      name: "a",
    },
    {
      message: "Enter the B value: ",
      name: "b",
    },
  ])
  .then((answers) => {
    let a = Number(answers.a);
    let b = Number(answers.b);
    console.log(`Result of A + B: ` + chalk.blue(a + b));
  })
  .catch((error) => {
    console.log(error);
  });

console.log(chalk.italic(`Exercício de Constantes`));
