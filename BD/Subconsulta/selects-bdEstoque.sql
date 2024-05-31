--dbEstoque - Ex 001

SELECT codProduto, descricaoProduto, nomeFabricante FROM tblProduto
INNER JOIN tblFabricante
	ON tblFabricante.codFabricante = tblProduto.codFabricante

WHERE valorProduto = (SELECT MAX(valorProduto) FROM tblProduto)

--dbEstoque - Ex 002
SELECT descricaoProduto, nomeFabricante, valorProduto FROM tblProduto
INNER JOIN tblFabricante 
	ON tblProduto.codFabricante = tblFabricante.codFabricante

	WHERE valorProduto > (SELECT AVG(valorProduto) FROM tblProduto)

--dbEstoque - Ex 003
SELECT nomeCliente FROM tblCliente
	INNER JOIN tblVenda
		ON tblVenda.codCliente = tblCliente.codCliente

	WHERE valorTotalVenda > (SELECT AVG(valorTotalVenda) FROM tblVenda)

--dbEstoque - Ex 004
SELECT descricaoProduto, valorProduto FROM tblProduto
	ORDER BY valorProduto DESC

--dbEstoque - Ex 005
SELECT descricaoProduto, valorProduto FROM tblProduto
	WHERE valorProduto = (SELECT MAX(valorProduto) FROM tblProduto)