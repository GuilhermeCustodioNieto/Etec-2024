const http = require("http");
const url = require("url");
const fs = require("fs");

const calculos = require(`./modules/rectangle.js`);

// Faça um rpograma com um módulo externo que calcule a área, o perimetro e a diagonal de um retângulo.

let server = http.createServer((req, res) => {
  res.writeHead(200, {"Content-Type": "text/html"});
  
  const urlInfo = url.parse(req.url, true);


  const index = fs.readFileSync("./index.html", (err, data) => {
    return data;
  });

  let largura = urlInfo.query.largura;
  let altura = urlInfo.query.altura;



  if(!largura & !altura) {
    res.end(index);

    
  }else {
    let output = fs.readFileSync("./output.html", (err, data) => {
      return data;
    });

    output = output.toString()

    output = output.replace('area', calculos.area(largura, altura));
    output = output.replace('perimetro', calculos.perimetro(largura, altura));
    output = output.replace('diagonal', calculos.diagonal(largura, altura).toFixed(2));

    res.end(output);
  }
});

server.listen(3000, () => {
  console.log(`Servidor rodando na porta 3000`);
});
