import inquirer from "inquirer";

// Faça um rpograma com um módulo externo que calcule a área, o perimetro e a diagonal de um retângulo.
import area from "./rectangle";
import perimetro from "./rectangle";
import diagonal from "./rectangle";

inquirer
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
    let altura = Numebr(answers.altura);

    console.log(`Area = ${area(largura, altura)}`);
    console.log(`Perimetro = ${perimetro(largura, altura)}`);
    console.log(`Diagonal = ${perimetro(largura, altura)}`);
  });

console.log(`Fim do Programa`);
