import inquirer from "inquirer";

//Faça um programa para ler dois valores inteiros A + B e imprima o resultado da expressão (A + B)
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
    console.log(`Result of A + B: ${a + b}`);
  })
  .catch((error) => {
    console.log(error);
  });
