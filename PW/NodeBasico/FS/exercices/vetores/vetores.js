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

      <style>
      .container{
        height: 101%;
        width: 101%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        background: rgb(6,20,27);
        background: linear-gradient(140deg, rgba(6,20,27,1) 0%, rgba(17,33,45,1) 20%, rgba(37,55,69,1) 40%, rgba(74,92,106,1) 60%, rgba(155,168,171,1) 80%, rgba(204,208,207,1) 100%);
    }
    .sub-container{
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
      width: 300px;
      height: 350px;
      background-color: #00000057;
      border-radius: 10px;
      box-shadow: 0 0 12px #111;
      padding: 10px;
  }
      .text-titulo{
      font-size: 25px;
      padding: 15px;
      margin:10px;
      color: #eee;
    }

    .btn-input{
      border:solid 2px #222;
      background-color: #333;
      color: #eee;
      border-radius: 15px;
      box-shadow: 0 0 10px #222;
      padding: 15px;
  }
    .btn-input:hover{
    border:solid 1.5px #44a0a0;
    background-color: #548383;
    color: #fff;
    text-shadow: 0 0 10px #fff;
    border-radius: 15px;
    box-shadow: 0 0 10px #7da0ca;
    padding: 15px;
    transition:0.8s;
  }
  .input-text{
    border-radius: 5px;
    border: none;
    padding: 10px;
    margin: 5px;
  }
    .input-text:focus{
    background-color: #7da0ca;
    color: #000;
    font-size: 14px;
    border: solid 2px #052659;
  }
    .input-text::selection{
    background-color: #7da0ca;
  }

  .apresentacao{
    color: #eee;
    font-size: 35px;
    text-shadow: 0 0 15px #fff;
}

      </style>

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