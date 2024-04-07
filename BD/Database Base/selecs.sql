/* Exercicio A */
SELECT descricaoProduto 'Descrição do Produto', tblFabricante.nomeFabricante 'Nome do Fabricante'
FROM tblProduto
    INNER JOIN tblFabricante
        ON tblProduto.codFabricante = tblFabricante.codFabricante

	ORDER BY tblProduto.descricaoProduto ASC

	/* Exercicio B */
SELECT tblProduto.descricaoProduto 'Descrição do Produto', tblFornecedor.nomeFornecedor 'Nome do Fornecedor'
	FROM tblProduto
		INNER JOIN tblFornecedor
			ON tblProduto.codFornecedor = tblFornecedor.codFornecedor

	ORDER BY tblFornecedor.nomeFornecedor ASC

	/*  Exercicio C */

SElECT SUM(tblProduto.quantidadeProduto) as 'Quantidade de Produtos', tblFabricante.nomeFabricante 'Nome do Fabricante'
	FROM tblProduto 
		INNER JOIN tblFabricante
			ON tblProduto.codFabricante = tblFabricante.codFabricante

	GROUP BY tblFabricante.nomeFabricante
	ORDER BY tblFabricante.nomeFabricante DESC	

	/* Exercicio D */

SElECT SUM(tblVenda.valorTotalVenda) as 'Valor Total', tblCliente.nomeCliente 'Nome do Cliente'
FROM tblVenda
	INNER JOIN tblCliente
		ON tblVenda.codCliente = tblCliente.codCliente

	GROUP BY tblCliente.nomeCliente		
	ORDER BY tblCliente.nomeCliente	 DESC

	/* Exercicio E */ 

SElECT	AVG(tblProduto.valorProduto) as Valor_Media, 'Nome do Fornecedor' 
	FROM tblProduto
		INNER JOIN tblFornecedor
			ON tblProduto.codFornecedor = tblFornecedor.codFornecedor

	GROUP BY tblFornecedor.nomeFornecedor		
	ORDER BY Valor_Media DESC

/* Exercicio F */ 

SElECT	SUM(tblVenda.valorTotalVenda) as 'Valor Total de Venda', (tblCliente.nomeCliente) 'Nome Clientes'
	FROM tblVenda
		INNER JOIN tblCliente
			ON tblVenda.codCliente = tblCliente.codCliente

	GROUP BY tblCliente.nomeCliente
	ORDER BY tblCliente.nomeCliente ASC
	
/* Exec�cio G */

SElECT	SUM(tblProduto.valorProduto) as Valor_Total_Produtos, tblFabricante.nomeFabricante 'Fabricante'
	FROM tblProduto
		INNER JOIN tblFabricante
			ON tblProduto.codFabricante = tblFabricante.codFabricante

	GROUP BY tblFabricante.nomeFabricante
	ORDER BY Valor_Total_Produtos DESC

/* Exec�cio H */

SElECT	AVG(tblProduto.valorProduto) as Valor_Total_Produtos, tblFornecedor.nomeFornecedor 'Fornecedor'
	FROM tblProduto
		INNER JOIN tblFornecedor
			ON tblProduto.codFornecedor = tblFornecedor.codFornecedor

	GROUP BY tblFornecedor.nomeFornecedor
	ORDER BY Valor_Total_Produtos DESC



/* Exercício I */
SElECT	tblProduto.descricaoProduto, SUM(tblVenda.valorTotalVenda) 'Soma Venda'
	FROM tblItensVenda 
		INNER JOIN tblVenda
			ON tblItensVenda.codVenda= tblVenda.codVenda
			INNER JOIN  tblProduto
				ON tblProduto.codProduto = tblItensVenda.codProduto

	GROUP BY tblProduto.descricaoProduto
	ORDER BY tblProduto.descricaoProduto ASC



/* Exercício J */
SELECT SUM(tblVenda.valorTotalVenda) 'Total Venda', MAX(tblCliente.nomeCliente) 'Nome Cliente', MAX(tblVenda.dataVenda) 'Data Venda'
FROM tblVenda
	INNER JOIN tblCliente
		ON tblCliente.codCliente = tblVenda.codCliente

	WHERE YEAR(tblVenda.dataVenda) = 2014 AND MONTH(tblVenda.dataVenda) = 02

	GROUP BY tblCliente.nomeCliente
	ORDER BY tblCliente.nomeCliente ASC