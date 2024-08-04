use db_EscolaIdiomas;

-- Exercício 1
CREATE VIEW Preco_Baixo AS
	SELECT codCurso, nomeCurso, cargaHorariaCurso, valorCurso FROM tbl_curso
		WHERE  valorCurso < (SELECT AVG(valorCurso) FROM tbl_curso)

-- Exercício 2
SELECT nomeCurso FROM Preco_Baixo
ORDER BY cargaHorariaCurso 

-- Exercício 3
CREATE VIEW Alunos_Turma AS
	SELECT nomeCurso AS nome_curso, nomeTurma, COUNT(codMatricula) AS quantidade_alunos FROM tbl_curso
		INNER JOIN tbl_turma ON tbl_turma.codCurso = tbl_curso.codCurso
			INNER JOIN tbl_matricula ON tbl_matricula.codTurma = tbl_turma.codTurma
				
	GROUP BY tbl_curso.nomeCurso, tbl_turma.nomeTurma, tbl_turma.codTurma
	
-- Exercício 4
SELECT nomeTurma FROM Alunos_Turma
	WHERE quantidade_alunos = (SELECT MAX(quantidade_alunos) FROM Alunos_Turma)

-- Exercício 5
CREATE VIEW Turma_Curso AS
	SELECT tbl_curso.nomeCurso, COUNT(tbl_turma.codCurso) as quantidade_turmas FROM tbl_curso
		INNER JOIN tbl_turma ON tbl_turma.codCurso = tbl_curso.codCurso


	GROUP BY tbl_curso.nomeCurso

-- Exercício 6
SELECT nomeCurso FROM Turma_Curso	
	WHERE quantidade_turmas = (SELECT MIN(quantidade_turmas) FROM Turma_Curso)

