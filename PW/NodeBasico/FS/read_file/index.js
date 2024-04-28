const http = require("http"); // Biblioteca para uso de recursos do protocolo HTTP
const fs = require("fs"); // Biblioteca para manipulação de arquivos em JavaScript
const port = 3000; // A porta na qual nosso servidor HTTP irá trabalhar

const server = http.createServer((req, res) => { // Método de criação de servidor HTTP trabalhando em uma Arrow Function, onde teremos a requisição e resposta.
    res.writeHead(200, {"Content-Type": "text/html"}); // Escrita do cabeçalho do nosso website, dizendo que o conteúdo do site é do tipo HTML

    // Realizar a Leitura
    let inicio = fs.readFileSync('inicio.html', 'utf8'); // Usando a biblioteca FS, fazemos a leitura do HTML que representa o início da nossa página
    let fim = fs.readFileSync('fim.html', 'utf8'); // Utilizando a biblioteca FS, fazemos a leitura do HTML que representa o fim da página

    res.write(inicio); // Escrevemos o conteúdo do HTML de início na nossa página
    res.write(fim); // E escrevemos o conteúdo de fim na nossa página
    res.end("Everson Bacelli"); // Aqui, escrevemos o conteúdo da página, no caso, é o nome do Professor Everson Bacelli
});

server.listen(port, () => { // Aqui, fazemos o servidor rodar, passando a porta que deve rodar como parâmetro
    console.log(`Servidor rodando na porta: ${port}`); // Aqui, imprimimos que o servidor está rodando com êxito e em qual porta ele está funcionando
});
