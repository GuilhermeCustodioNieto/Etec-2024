import inquirer from "inquirer";
import chalk from "chalk";

// Faça um rpograma com um módulo externo que calcule a área, o perimetro e a diagonal de um retângulo.
import { area, perimetro, diagonal } from "./rectangle.js";

console.log(chalk.italic(`Exercício de Modularização`));

await inquirer
  .prompt([
    {
      message: "Largura: ",
      name: "largura",
    },
    {
      message: "Altura: ",
      name: "altura",
    },
  ])
  .then((answers) => {
    let largura = Number(answers.largura);
    let altura = Number(answers.altura);

    console.log(`Area = ` + chalk.green(`${area(largura, altura)}`));
    console.log(`Perimetro =` + chalk.green(` ${perimetro(largura, altura)}`));
    console.log(`Diagonal = ` + chalk.green(`${diagonal(largura, altura)}`));
  });

console.log(`Fim do Programa`);
