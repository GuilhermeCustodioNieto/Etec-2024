USE dbLivariaBrasileira

/* EXERC�CIO A */
SELECT COUNT(tbLivro.codLivro) AS quantidateLivros, nomeGenero FROM tbLivro
    INNER JOIN tbGenero
		ON tbLivro.codGenero = tbGenero.codGenero

	GROUP BY tbLivro.codGenero, nomeGenero

/* EXERC�CIO B */
SELECT SUM(tbLivro.numPaginas), tbAutor.nomeAutor
	FROM tbLivro

	INNER JOIN tbAutor 
		ON tbLivro.codAutor = tbAutor.codAutor

	GROUP BY tbAutor.nomeAutor

/* EXERC�CIO C */
SELECT AVG(tbLivro.numPaginas) AS Media_Paginas, tbAutor.nomeAutor
	FROM tbLivro

	INNER JOIN tbAutor 
		ON tbLivro.codAutor = tbAutor.codAutor

	GROUP BY tbAutor.nomeAutor
	ORDER BY tbAutor.nomeAutor ASC

/* EXERC�CIO D */
SELECT COUNT(tbLivro.codLivro) AS Quantidade_Livro, tbEditora.nomeEditora
	FROM tbLivro

	INNER JOIN tbEditora
		ON tbLivro.codEditora= tbEditora.codEditora

	GROUP BY tbEditora.nomeEditora
	ORDER BY tbEditora.nomeEditora DESC

/* EXERC�CIO E */
SELECT SUM(tbLivro.numPaginas) AS Soma_Paginas, tbAutor.nomeAutor
	FROM tbLivro

	INNER JOIN tbAutor 
		ON tbLivro.codAutor = tbAutor.codAutor

	WHERE SUBSTRING(tbAutor.nomeAutor, 1,1) = 'J'

	GROUP BY tbAutor.nomeAutor


/* EXERC�CIO F */
SELECT SUM(tbLivro.numPaginas) AS Soma_Paginas, tbAutor.nomeAutor
	FROM tbLivro

	INNER JOIN tbAutor 
		ON tbLivro.codAutor = tbAutor.codAutor

	WHERE tbAutor.nomeAutor = 'Machado de Assis' OR tbAutor.nomeAutor = 'Cora Coralina' OR tbAutor.nomeAutor = 'Graciliano Ramos' OR tbAutor.nomeAutor = 'Clarice Lispector'

	GROUP BY tbAutor.nomeAutor


/* EXERC�CIO G */
SELECT SUM(tbLivro.numPaginas) AS Soma_Paginas, tbEditora.nomeEditora
	FROM tbLivro

	INNER JOIN tbEditora
		ON tbLivro.codEditora= tbEditora.codEditora

	WHERE tbLivro.numPaginas >= 200 AND tbLivro.numPaginas <= 500

	GROUP BY tbEditora.nomeEditora
		

/* EXERC�CIO H */
SELECT tbLivro.nomeLivro, tbEditora.nomeEditora, tbAutor.nomeAutor FROM tbLivro
    INNER JOIN tbEditora
		ON tbLivro.codEditora = tbEditora.codEditora

	INNER JOIN tbAutor
		ON tbLivro.codAutor = tbAutor.codAutor

/* EXERC�CIO I */
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor FROM tbLivro
    
	INNER JOIN tbAutor
		ON tbLivro.codAutor = tbAutor.codAutor

	INNER JOIN tbEditora
		ON tbLivro.codEditora = tbEditora.codEditora

	WHERE tbEditora.nomeEditora = 'Companhia das Letras'

/* EXERC�CIO J */
SELECT tbLivro.nomeLivro, tbAutor.nomeAutor FROM tbLivro
	LEFT JOIN tbAutor
		ON tbLivro.codAutor = tbAutor.codAutor

	WHERE tbAutor.nomeAutor != '�rico Ver�ssimo'


/* EXERC�CIO K */
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro FROM tbAutor
	LEFT JOIN tbLivro
		ON tbLivro.codAutor = tbAutor.codAutor

	
/* EXERC�CIO L */
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro FROM tbAutor
	RIGHT JOIN tbLivro
		ON tbLivro.codAutor = tbAutor.codAutor

/* EXERC�CIO M */
SELECT tbAutor.nomeAutor, tbLivro.nomeLivro FROM tbAutor
	FULL JOIN tbLivro
		ON tbLivro.codAutor = tbAutor.codAutor

/* EXERC�CIO N */
SELECT tbEditora.nomeEditora, tbLivro.nomeLivro FROM tbEditora
	CROSS JOIN tbLivro
		
	WHERE tbEditora.nomeEditora = 'Ática'

	
/* EXERC�CIO O */
SELECT nomeAutor FROM tbAutor
	LEFT JOIN tbLivro ON tbAutor.codAutor = tbLivro.codAutor
		WHERE tbLivro.codLivro IS NULL

/* EXERC�CIO P */
SELECT tbGenero.nomeGenero FROM tbGenero
	LEFT JOIN tbLivro
		ON tbGenero.codGenero = tbLivro.codGenero

	WHERE tbLivro.codLivro IS NULL


