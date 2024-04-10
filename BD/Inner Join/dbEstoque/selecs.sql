/* Exercicio A */
SELECT descricaoProduto, tblFabricante.nomeFabricante
FROM tblProduto
    INNER JOIN tblFabricante
        ON tblProduto.codFabricante = tblFabricante.codFabricante

	ORDER BY tblProduto.descricaoProduto ASC

	/* Exercicio B */
SELECT tblProduto.descricaoProduto, tblFornecedor.nomeFornecedor
	FROM tblProduto
		INNER JOIN tblFornecedor
			ON tblProduto.codFornecedor = tblFornecedor.codFornecedor

	ORDER BY tblFornecedor.nomeFornecedor ASC
	/*  Exercicio C */
SElECT SUM(tblProduto.quantidadeProduto) as Quantidade_Produtos, tblFabricante.nomeFabricante  
	FROM tblProduto 
		INNER JOIN tblFabricante
			ON tblProduto.codFabricante = tblFabricante.codFabricante

	GROUP BY tblFabricante.nomeFabricante
	ORDER BY tblFabricante.nomeFabricante DESC	

	/* Exercicio 4 */

SElECT SUM(tblVenda.valorTotalVenda) as Valor_Total, tblCliente.nomeCliente 
FROM tblVenda
	INNER JOIN tblCliente
		ON tblVenda.codCliente = tblCliente.codCliente

	GROUP BY tblCliente.nomeCliente		
	ORDER BY tblCliente.nomeCliente	 DESC

	/* Exercicio 5 */ 

SElECT	AVG(tblProduto.valorProduto) as Valor_Media, nomeFornecedor 
	FROM tblProduto
		INNER JOIN tblFornecedor
			ON tblProduto.codFornecedor = tblFornecedor.codFornecedor

	GROUP BY tblFornecedor.nomeFornecedor		
	ORDER BY Valor_Media DESC

/* Exercicio 6 */ 

SElECT	SUM(tblVenda.valorTotalVenda) as Valor_Total_Venda, (tblCliente.nomeCliente) as nomes_Cliente
	FROM tblVenda
		INNER JOIN tblCliente
			ON tblVenda.codCliente = tblCliente.codCliente

	GROUP BY tblCliente.nomeCliente
	ORDER BY tblCliente.nomeCliente ASC
	
/* Exec�cio 7 */

SElECT	SUM(tblProduto.valorProduto) as Valor_Total_Produtos, tblFabricante.nomeFabricante as fabricante
	FROM tblProduto
		INNER JOIN tblFabricante
			ON tblProduto.codFabricante = tblFabricante.codFabricante

	GROUP BY tblFabricante.nomeFabricante
	ORDER BY Valor_Total_Produtos DESC

/* Exec�cio 8 */

SElECT	AVG(tblProduto.valorProduto) as Valor_Total_Produtos, tblFornecedor.nomeFornecedor as fornecedor
	FROM tblProduto
		INNER JOIN tblFornecedor
			ON tblProduto.codFornecedor = tblFornecedor.codFornecedor

	GROUP BY tblFornecedor.nomeFornecedor
	ORDER BY Valor_Total_Produtos DESC



/* Listar a soma das vendas agrupadas pelos produtos 9 */
SElECT	tblProduto.descricaoProduto, SUM(tblVenda.valorTotalVenda) as Soma_Venda 
	FROM tblItensVenda 
		INNER JOIN tblVenda
			ON tblItensVenda.codVenda= tblVenda.codVenda
			INNER JOIN  tblProduto
				ON tblProduto.codProduto = tblItensVenda.codProduto

	GROUP BY tblProduto.descricaoProduto
	ORDER BY tblProduto.descricaoProduto ASC



/* Exercício 10 */
SELECT MAX(tblCliente.nomeCliente) AS Nome_Cliente, SUM(tblVenda.valorTotalVenda) as Total_Venda, MAX(tblVenda.dataVenda) AS Data_Venda
FROM tblVenda
	INNER JOIN tblCliente
		ON tblCliente.codCliente = tblVenda.codCliente

	WHERE YEAR(tblVenda.dataVenda) = 2014 AND MONTH(tblVenda.dataVenda) = 02

	GROUP BY tblCliente.nomeCliente
	ORDER BY tblCliente.nomeCliente ASC