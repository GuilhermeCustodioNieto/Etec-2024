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
// Calcular e apresentar a área de um circulo de acordo com seu raio

const PI = 3.14;

await inquirer
  .prompt([
    {
      message: `Enter the circle radius: `,
      name: `radius`,
    },
  ])
  .then((answers) => {
    let radius = Number(answers.radius);
    let area = PI * (radius * radius);

    console.log(`The area of circle is: ${chalk.bgBlue(area)}`);
  })
  .catch((error) => {
    console.log(error);
  });
//Ler o nome de uma pessoa e apresentar fora do escopo do then
var name = "";
await inquirer
  .prompt([
    {
      message: `Enter your name: `,
      name: `name`,
    },
  ])
  .then((answers) => {
    name = answers.name;
  })
  .catch((error) => {
    console.log(error);
  });

console.log(`Your name is ${chalk.bgBlue(name)}`);
