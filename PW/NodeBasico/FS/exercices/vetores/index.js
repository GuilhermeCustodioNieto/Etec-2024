import http from "http";
import url from "url";

const calcularQuadrado = (numero) => numero * numero;

function setup(req, res) {
  /**
   * Essa função é uma espécie de configuração geral do programa
   */

  res.setHeader("Content-Type", "text/html");

  res.write(`
    <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <title>Vetores</title>
    </head>
  `);
}

function criarForms() {
  /**
   * Essa função cria 10 objetos form, que contem o name e seu respectivo HTML, e depois adiciona a um array
   * Por fim, o array com as informações dos forms é retornado
   */

  let allForms = new Array();

  for (let i = 1; i <= 10; i++) {
    let form = {
      htmlForm: ``,
      name: `name`,
    };

    let html = `
    
      <label for="posicao${i}">Entre com o valor ${i}</label>
      <input type="text" name="posicao${i}" id="posicao${i}" />
      <br />
    
    `;

    let name = `posicao${i}`;

    form.htmlForm = html;
    form.name = name;

    allForms.push(form);
  }

  return allForms;
}

const server = http.createServer((req, res) => {
  setup(req, res);
  const urlInfo = url.parse(req.url, true);
  const formsEnviados = false;

  let allForms = criarForms();

  // Aqui, verificamos se o urlInfo.query (ou seja, se as entradas do usuário) estão vazias

  if (Object.keys(urlInfo.query).length === 0) {
    //Se elas estiverem vazias, vamos gerar o HTML e seus forms
    res.write(`<form action="" method="get">`);

    allForms.forEach((formAtual) => {
      res.write(formAtual.htmlForm);
    });

    res.write(`<input type="submit" value="Enviar" />`);

    res.write(`</form>`);
    res.end();
  } else {
    // Se elas estiverem completas, vamos pegar todos os valores enviados e calcular o quadrado deles, apresentando eles para o usuário
    for (let i = 1; i < allForms.length; i++) {
      let numAtual = Number(urlInfo.query[allForms[i].name]);

      const quadrado = calcularQuadrado(numAtual);
      res.write(`<h1>O quadrado de ${i} é ${quadrado}</h1>`);
    }

    res.end();
  }
});

server.listen(3000, () => {
  console.log("Servidor rodando na porta 3000");
});

// Ideia: criar um vetor que vai guardar todos os forms, depois só pegar os valores desses forms
