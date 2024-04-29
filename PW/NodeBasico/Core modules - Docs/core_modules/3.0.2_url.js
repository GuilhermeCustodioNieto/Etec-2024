const url = require('url') // Biblioteca para manipulação de recursos de páginas web

const address = "https://www.meusite.com.br/catalogo?produtos=cadeira" //Uma string que contem o link de uma página web

const parseUrl = new url.URL(address) // Conversão da página web para um objeto URL

console.log(parseUrl.host) // Retorna o nome do host da página, junto do dominio e a porta dela
console.log(parseUrl.pathname) // O caminho das URLs da página, excluindo o dominio
console.log(parseUrl.search) //Retorna as queries feitas no site
console.log(parseUrl.searchParams) //Imrpime o objeto searchParams, que contém métodos para trabalhar com as searchs da nossa URL
console.log(parseUrl.searchParams.get("produtos")) // Usa o método get do searchParams para pegar o conteúdo da search produtos.