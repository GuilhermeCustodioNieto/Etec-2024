/* Exercicio 1 */
SELECT descricaoProduto, nomeFabricante
FROM tblProduto
    INNER JOIN tblFabricante
        ON tblProduto.codFabricante = tblFabricante.codFabricante

	/* Exercicio 2 */
SELECT descricaoProduto, nomeFornecedor
	FROM tblProduto
		INNER JOIN tblFornecedor
			ON tblProduto.codFornecedor = tblFornecedor.codFornecedor

	/*  Exercicio 3 */
SElECT SUM(quantidadeProduto) as Valor_Produtos, nomeFabricante  
	FROM tblProduto 
		INNER JOIN tblFabricante
			ON tblProduto.codFabricante = tblFabricante.codFabricante

	GROUP BY nomeFabricante
	ORDER BY Valor_Produtos DESC	

	/* Exercicio 4 */

SElECT SUM(valorTotalVenda) as Valor_Total, nomeCliente 
FROM tblVenda
	INNER JOIN tblCliente
		ON tblVenda.codCliente = tblCliente.codCliente

	GROUP BY nomeCliente		
	ORDER BY Valor_Total DESC

	/* Exercicio 5 */ 

SElECT	AVG(valorProduto) as Valor_Media, nomeFornecedor 
	FROM tblProduto
		INNER JOIN tblFornecedor
			ON tblProduto.codFornecedor = tblFornecedor.codFornecedor

	GROUP BY nomeFornecedor		
	ORDER BY Valor_Media DESC

/* Exercicio 6 */ 

SElECT	SUM(valorTotalVenda) as Valor_Total_Venda, (nomeCliente) as nomes_Cliente
	FROM tblVenda
		INNER JOIN tblCliente
			ON tblVenda.codCliente = tblCliente.codCliente

	GROUP BY nomeCliente
	ORDER BY nomes_Cliente ASC
	


