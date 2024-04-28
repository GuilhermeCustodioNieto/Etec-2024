import inquirer from "inquirer";
import chalk from "chalk";

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
