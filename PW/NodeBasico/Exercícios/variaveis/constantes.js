import inquirer from "inquirer";
import chalk from "chalk";

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
