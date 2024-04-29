const http = require("http") // Importa a biblioteca HTTP
const fs = require("fs") // Importa a biblioteca FS
const url = require("url") // Importa a biblioteca URL

const port = 3000 // Avisa qual aporta do servidor

const server = http.createServer((req, res)=>{ // Cria o servidor
    
    const urlInfo = url.parse(req.url, true) // Cria o URL com base no nosso site
    const name = urlInfo.query.name // Tenta pegar a query chamada nome

    if(!name){ // Se o usuário não escreveu o nome ainda
        fs.readFile('index.html', (err, data)=> { // Vamos abrir o index.html com o fs
            res.writeHead(200, {"Contenty-Type":"text/html"}) // Escrever os cabeçalhos informando sobre o arquivo e falando que o código é 200, ou seja, tudo certo
            res.write(data) // Escrevendo o conteúdo do HTML lido pelo FS
            return res.end() // Finalizando o site e avisando que já pode servir ao cliente
        })
    } else { // Se o usuário digitou o nome dele1
        fs.writeFile("arquivo.txt", name, (err, data)=>{ // Vamos criar um arquivo.txt caso não exista, ou sobreescrever ele, passando o nome do usuário como valor
            res.writeHead(302, { // Vai falar de umr relacionamenteo temporário com a página
                location: "/", // Redireciona o usuário para a raiz da página, ou seja, para o inicio novamente
            })
            res.end() // Serve a página ao cliente
        })
    }
    
    
})

server.listen(port, ()=> { // Inicia o servidor HTTP
    console.log(`Servidor rodando na porta: ${port}`)
})