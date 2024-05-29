USE bdEscolaDeIdiomas

--DB Escola de Idiomas: Ex A
SELECT nomeCurso, valorCurso FROM tbCurso
	WHERE valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)

--DB Escola de Idiomas: Ex B
SELECT nomeAluno, rgAluno FROM tbAluno
	WHERE dataNascAluno =(SELECT MIN(dataNascAluno) FROM tbAluno) 

--DB Escola de Idiomas: Ex C
SELECT nomeAluno FROM tbAluno
	WHERE dataNascAluno = (SELECT MAX(dataNascAluno) FROM tbAluno) 

--DB Escola de Idiomas: Ex D
SELECT nomeCurso, valorCurso FROM tbCurso
	WHERE valorCurso = (SELECT MAX(valorCurso) FROM tbCurso)

--DB Escola de Idiomas: Ex E
SELECT nomeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbCurso
		
	WHERE valorCurso = (SELECT MAX(valorCurso) FROM tbCurso)

DROP DATABASE bdEscolaDeIdiomas
