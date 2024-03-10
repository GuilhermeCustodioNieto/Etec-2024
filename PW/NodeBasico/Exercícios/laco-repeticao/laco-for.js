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
  })
  .catch((error) => {
    console.log(error);
  });

console.log(chalk.cyan(`---------------------------------`));
