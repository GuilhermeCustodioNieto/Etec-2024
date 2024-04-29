const http = require("http") // Iportando a biblioteca http
const fs = require("fs") // Biblioteca para manipulação de arquivos do JS
const port = 3000 // Porta do nosso servidor

const server = http.createServer((req, res)=>{ // Criação do servidor HTTP
    fs.readFile('mensagem.html', (err, data)=> { // Leitura do arquivo html, passando uma arrow function como parametro
        if(err == null){ // Verificando se a leitura foi sucedida, ou seja, se não existe nenhum erro
            res.writeHead(200, {"Contenty-Type":"text/html"}) // Imprimindo o cabeçalho falando que deu tudo certo e que o documento é um HTML
            res.write(data) // Escrita dos dados do mensagem.html no nosso site
            
        } else { // Caso exista um erro
            res.write('Arquivo não localizado') // Imprimimos no site que o arquivo não foi localizado
        }
        
        return res.end() // Finaliza o site e avisa que ee está pronto para ser entregue ao cliente
        
    })
})

server.listen(port, ()=> { // Inicia o servidor HTTP
    console.log(`Servidor rodando na porta: ${port}`)
})