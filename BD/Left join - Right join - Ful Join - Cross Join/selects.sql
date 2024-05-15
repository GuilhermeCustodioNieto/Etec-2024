USE dbLivariaBrasileira

/* EXERCÍCIO A */
SELECT COUNT(tbLivro.codLivro) AS quantidateLivros, nomeGenero FROM tbLivro
    LEFT JOIN tbGenero
		ON tbLivro.codGenero = tbGenero.codGenero

	GROUP BY tbLivro.codGenero, nomeGenero

/* EXERCÍCIO B */
SELECT SUM(tbLivro.numPaginas), tbAutor.nomeAutor
	FROM tbLivro

	LEFT JOIN tbAutor 
		ON tbLivro.codAutor = tbAutor.codAutor

	GROUP BY tbAutor.nomeAutor

/* EXERCÍCIO C */
SELECT AVG(tbLivro.numPaginas), tbAutor.nomeAutor
	FROM tbLivro

	LEFT JOIN tbAutor 
		ON tbLivro.codAutor = tbAutor.codAutor

	GROUP BY tbAutor.nomeAutor
	ORDER BY tbAutor.nomeAutor ASC

/* EXERCÍCIO D */
SELECT COUNT(tbLivro.codLivro) AS Quantidade_Livro, tbEditora.nomeEditora
	FROM tbLivro

	RIGHT JOIN tbEditora
		ON tbLivro.codEditora= tbEditora.codEditora

	GROUP BY tbEditora.nomeEditora
	ORDER BY tbEditora.nomeEditora DESC

/* EXERCÍCIO E */
SELECT SUM(tbLivro.numPaginas) AS Soma_Paginas, tbAutor.nomeAutor
	FROM tbLivro

	LEFT JOIN tbAutor 
		ON tbLivro.codAutor = tbAutor.codAutor

	WHERE SUBSTRING(tbAutor.nomeAutor, 1,1) = 'J'

	GROUP BY tbAutor.nomeAutor


/* EXERCÍCIO F */
SELECT SUM(tbLivro.numPaginas) AS Soma_Paginas, tbAutor.nomeAutor
	FROM tbLivro

	LEFT JOIN tbAutor 
		ON tbLivro.codAutor = tbAutor.codAutor

	WHERE tbAutor.nomeAutor = 'Machado de Assis' OR tbAutor.nomeAutor = 'Cora Coralina' OR tbAutor.nomeAutor = 'Graciliano Ramos' OR tbAutor.nomeAutor = 'Clarice Lispector'

	GROUP BY tbAutor.nomeAutor


/* EXERCÍCIO G */
SELECT SUM(tbLivro.numPaginas) AS Soma_Paginas, tbEditora.nomeEditora
	FROM tbLivro

	RIGHT JOIN tbEditora
		ON tbLivro.codEditora= tbEditora.codEditora

	WHERE tbLivro.numPaginas >= 200 AND tbLivro.numPaginas <= 500

	GROUP BY tbEditora.nomeEditora
		

/* EXERCÍCIO H */
SELECT tbLivro.nomeLivro, tbEditora.nomeEditora, tbAutor.nomeAutor FROM tbLivro
    LEFT JOIN tbEditora
		ON tbLivro.codEditora = tbEditora.codEditora

	LEFT JOIN tbAutor
		ON tbLivro.codAutor = tbAutor.codAutor

/* EXERCÍCIO I */
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor FROM tbLivro
    
	LEFT JOIN tbAutor
		ON tbLivro.codAutor = tbAutor.codAutor

	LEFT JOIN tbEditora
		ON tbLivro.codEditora = tbEditora.codEditora

	WHERE tbEditora.nomeEditora = 'Cia das Letras'

/* EXERCÍCIO J */
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor FROM tbLivro
	LEFT JOIN tbAutor
		ON tbLivro.codAutor = tbAutor.codAutor

	WHERE tbAutor.nomeAutor != 'Érico Veríssimo'


/* EXERCÍCIO K */
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro FROM tbAutor
	LEFT JOIN tbLivro
		ON tbLivro.codAutor = tbAutor.codAutor

	
/* EXERCÍCIO L */
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro FROM tbAutor
	RIGHT JOIN tbLivro
		ON tbLivro.codAutor = tbAutor.codAutor

/* EXERCÍCIO M */
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro FROM tbAutor
	FULL JOIN tbLivro
		ON tbLivro.codAutor = tbAutor.codAutor


