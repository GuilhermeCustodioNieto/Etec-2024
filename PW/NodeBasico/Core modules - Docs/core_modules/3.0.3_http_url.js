const http = require("http") // Iportando a biblioteca http
const fs = require("fs") // Biblioteca para manipulação de arquivos do JS
const port = 3000 // Porta do nosso servidor

const server = http.createServer((req, res)=>{ // Criação do servidor HTTP

    const urlInfo = url.parse(req.url, true) // Conversão do nosso servidor para a biblioteca URL
    const name = urlInfo.query.name // Pegando o valor name das nossas queries

    res.statusCode = 200 // Aviso ao servidor de que tudo está funcionando normalmente (ou seja, código 200)

   res.setHeader("Contenty-Type", "text/html") // Falando que o conteúdo do site é em formato HTML

    if(!name){ // Se o nome estiver vazio, ou seja, não tiver sido preenchido ainda: 
        res.end("Inclua um nome: ") // Pede para o usuário digitar o nome
    } else { // Se o usuário tiver preenchido seu nome
        res.end(`<H1>Seja bem vindo ${name}</H1>`) // Escrita no site de boas vindas
    }

})

server.listen(port, ()=> { // Inicia o servidor HTTP
    console.log(`Servidor rodando na porta: ${port}`) // Aqui, imprimimos que o servidor está rodando com êxito e em qual porta ele está funcionando
})