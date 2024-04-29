const path = require("path") // Biblioteca que serve para trabalhar com caminho de arquivos e diretórios

const endereco_doc = "./relatorios/everson/relatorio1.pdf" // Endereço do nosso arquivo .pdf

const nameDir = path.dirname(endereco_doc ) // Método que pega o nome do diretório do nosso arquivo
const name = path.basename(endereco_doc ) // Método que pega o nome do nosso arquivo
const extName = path.extname(endereco_doc ) // Método que pega o nome da extensão do nosso arquivo

console.log(`O nome do Arquivo é ${name}, está localizado em ${nameDir} e possui a seguinte extensão ${extName}`) // Imprimindo os dados do arquivo

// caminho absoluto
console.log(path.resolve("./arquivo.txt")) //Método para pegar o caminho absoluto do arquivo em relação ao diretório passado.

// caminho dinâmico
const midFolder = "relatorios" // Nome da pasta que vai ser concatenada
const fileName = "matheus.txt" //  nome do arquivo que vai ser concatenado

const finalPath = path.join("/", "arquivos", midFolder, fileName) // Junção de diversos nomes de pastam em um só, para formar caminho do arquivo matheus.txt

console.log(finalPath) // Imprimindo o caminho completo do arquivo