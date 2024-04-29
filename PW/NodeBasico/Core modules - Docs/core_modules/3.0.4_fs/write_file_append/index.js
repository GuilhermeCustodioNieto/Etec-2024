const http = require("http") // Importa a biblioteca HTTP
const fs = require("fs") // Importa a biblioteca FS
const url = require("url") // Importa a biblioteca URL

const port = 3000 // Avisa qual aporta do servidor

const server = http.createServer((req, res)=>{ // Cria o servidor
    
    const urlInfo = url.parse(req.url, true) // Cria o URL com base no nosso site
    const name = urlInfo.query.name // Tenta pegar a query chamada nome

    if(!name){ // Se o usuário não escreveu o nome ainda
        fs.readFile('index.html', (err, data)=> { // Vamos abrir o index.html com o fs
            res.writeHead(200, {"Contenty-Type":"text/html"}) // Escrever o cabeçalho informando que está tudo ok
            res.write(data) // Escrevendo o conteúdo do HTML lido pelo FS
            return res.end() // Finalizando o site e avisando que já pode servir ao cliente
        })
    } else { // Se o usuário digitou o nome dele
        const nameNewLine = name + "\r\n" // Criamos o nome com uma quebra de linha junto
        fs.appendFile("arquivo.txt", nameNewLine, (err, data)=>{ // Adicionamos um novo conteúdo ao arquivo.txt, no caso é o nome com quebra de linha da linha acima
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