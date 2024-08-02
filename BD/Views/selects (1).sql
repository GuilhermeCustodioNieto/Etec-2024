use bdEscolaDeIdiomas;

CREATE VIEW Preco_Baixo AS
SELECT codCurso, nomeCurso, cargaHorariaCurso, valorCurso FROM tbCurso
WHERE  valorCurso < (SELECT AVG(valorCurso) FROM tbCurso)

SELECT * FROM Preco_Baixo
ORDER BY cargaHorariaCurso 

CREATE VIEW Alunos_Turma 
	SELECT nomeCurso, COUNT(codAluno) FROM tbCurso
		INNER JOIN tbTurma ON tbTurma.codCurso = tbCurso.codCurso
			INNER JOIN tbMatricula ON tbMatricula.codTurma = tbTurma.codTurma
				INNER JOIN tbAluno ON tbMatricula.codAluno = tbAluno.codAluno
				
	GROUP BY codTurma
DROP VIEW Preco_Baixo