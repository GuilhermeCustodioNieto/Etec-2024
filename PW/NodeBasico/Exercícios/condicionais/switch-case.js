import inquirer from "inquirer";
import chalk from "chalk";

// Switch-Case

/*
2- Criar um programa que leia um número correspondente a um mês qualquer (de 1 a 12) e 
devolva se o referido mês tem 28, 30 ou 31 dias (desconsiderar anos bissextos).
 */

console.log(chalk.italic(`Exercício de Switch-case`));
await inquirer
  .prompt([
    {
      message: "Entre com o mês:",
      name: "mes",
    },
  ])
  .then((answers) => {
    let mes = Number(answers.mes);

    switch (mes) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        console.log(chalk.blue("Tem 31 dias"));
        break;

      case 4:
      case 6:
      case 9:
      case 11:
        console.log(chalk.blue("Tem 30 dias"));
        break;
      case 2:
        console.log(chalk.blue("Tem 28 dias"));
        break;

      default:
        console.log(chalk.blue("Tem 31 dias"));
    }

    console.log("Fim do programa");
  });
