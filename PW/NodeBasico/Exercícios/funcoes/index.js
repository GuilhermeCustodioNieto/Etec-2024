// Funções

import inquirer from "inquirer";

/*
2) Criar um programa que leia o sexo (f ou m) e o peso de um usuário. 
Calcule e apresente seu peso ideal com as fórmulas:
Masculino: PesoIdeal = 52 + (0.75 × (altura - 152.4)
Feminino: PesoIdeal = 52 + (0.67 × (altura - 152.4)
Repita esse programa até que o usuário responda Não para a seguinte 
pergunta:
Deseja continuar a execução? (1-para SIM ou 2-para NÃO
*/

function pesoIdeal(altura, sexo) {
  if (sexo === "masculino") {
    return 52 + 0.75 * (altura - 152.4);
  } else if (sexo === "feminino") {
    return 52 + 0.67 * (altura - 152.4);
  }
  return 0;
}

let continuar = "";

do {
  await inquirer
    .prompt([
      {
        message: "Entre com seu sexo: ",
      },
    ])

    .prompt([
      {
        message: "Deseja perguntar? (SIM/NÃO)",
        name: "continuar",
      },
    ])
    .then((answers) => {
      continuar = answers.continuar;
    });
} while (continuar != "NÃO");
