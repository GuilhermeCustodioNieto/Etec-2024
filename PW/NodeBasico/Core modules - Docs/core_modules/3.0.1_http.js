const http = require("http") // Biblioteca do JavaScript que permite trabalhar com o protocolo HTTP (HyperText Transfer Protocol)

const port = 3000 // A porta na qual o nosso servidor vai rodar

const server = http.createServer((req, res)=>{ // Método de criação de servidor HTTP trabalhando em uma ArrowFunction, onde teremos a request e response.
    res.write("<H1>Oi HTTP </H1>") // Escrita de HTML no nosso site 

    res.end() // Finaliza a response e aviss que ela está pronta apra enviar ao cliente
})

server.listen(port, ()=> { // Aqui, fazemos o servidor rodar, passando a porta que deve rodar como parâmetro 
    console.log(`Servidor rodando na porta: ${port}`) // Aqui, imprimimos que o servidor está rodando com êxito e em qual porta ele está funcionando
})