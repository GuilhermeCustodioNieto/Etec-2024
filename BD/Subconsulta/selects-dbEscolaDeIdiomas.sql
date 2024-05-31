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
	INNER JOIN tbMatricula
		ON tbMatricula.codAluno = tbAluno.codAluno

		INNER JOIN tbTurma
			ON tbMatricula.codTurma = tbTurma.codTurma

		INNER JOIN tbCurso
			ON tbCurso.codCurso = tbTurma.codCurso


	WHERE tbMatricula.dataMatricula = (SELECT MAX(dataMatricula) FROM tbMatricula)

--DB Escola de Idiomas: Ex F
SELECT nomeAluno FROM tbAluno
	INNER JOIN tbMatricula
		ON tbMatricula.codAluno = tbAluno.codAluno

		INNER JOIN tbTurma
			ON tbMatricula.codTurma = tbTurma.codTurma

		INNER JOIN tbCurso
			ON tbCurso.codCurso = tbTurma.codCurso

	WHERE tbMatricula.dataMatricula = (SELECT MIN(dataMatricula) FROM tbMatricula)

--DB Escola de Idiomas: Ex G
SELECT nomeAluno,rgAluno, dataNascAluno FROM tbAluno
	INNER JOIN tbMatricula
		ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma
		ON tbTurma.codTurma = tbMatricula.codTurma
	INNER JOIN tbCurso
		ON tbCurso.codCurso = tbTurma.codCurso

	WHERE tbCurso.nomeCurso = 'Inglês'


