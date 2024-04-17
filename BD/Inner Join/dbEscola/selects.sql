
/*1) Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem;*/

SELECT nomeAluno, nomeCurso FROM tbAluno
    INNER JOIN tbMatricula
        ON tbAluno.codAluno = tbMatricula.codAluno
    
        INNER JOIN tbTurma
            ON tbMatricula.codTurma = tbTurma.codTurma

            INNER JOIN tbCurso
                ON tbCurso.codCurso = tbTurma.codTurma

--2) Apresentar a quantidade de alunos matriculados por nome do curso;

SELECT tbCurso.nomeCurso, COUNT(tbMatricula.codMatrcula) FROM tbCurso
    INNER JOIN tbTurma
        ON tbCurso.codCurso = tbTurma.codCurso
        
    INNER JOIN tbMatricula
        ON tbMatricula.codTurma = tbTurma.codTurma
    
    GROUP BY tbCurso.nomeCurso

--3) Apresentar a quantidade de alunos matriculados por nome da turma

SELECT tbTurma.nomeTurma, COUNT(tbMatricula.codMatrcula) FROM tbTurma     
    INNER JOIN tbMatricula
        ON tbMatricula.codTurma = tbTurma.codTurma
    
    GROUP BY tbTurma.nomeTurma

--4) Apresentar a quantidade de alunos que fizeram matricula em maio de 2016;

SELECT COUNT(codMatrcula) as quantidade_alunos_2016 FROM tbMatricula
	WHERE YEAR(dataMatricula) = 2016 AND MONTH(dataMatricula) = 5

    GROUP BY tbMatricula.dataMatricula

--5) Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas e os nomes dos cursos em que estão matriculados
SELECT nomeAluno, nomeTurma, nomeCurso FROM tbAluno
    INNER JOIN tbMatricula
        ON tbAluno.codAluno = tbMatricula.codAluno
    
        INNER JOIN tbTurma
            ON tbMatricula.codTurma = tbTurma.codTurma

            INNER JOIN tbCurso
                ON tbCurso.codCurso = tbTurma.codCurso

    ORDER BY nomeAluno ASC

--6) Apresentar o nome dos cursos e os horários em que eles são oferecidos

SELECT nomeCurso, horarioTurma FROM tbCurso
	INNER JOIN tbTurma
		ON tbCurso.codCurso = tbTurma.codCurso

	ORDER BY nomeCurso ASC

--7) Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles
SELECT COUNT(naturalidadeAluno) AS Total_Alunos_Ingles FROM tbAluno
    INNER JOIN tbMatricula
        ON tbAluno.codAluno = tbMatricula.codAluno
    
        INNER JOIN tbTurma
            ON tbMatricula.codTurma = tbTurma.codTurma

            INNER JOIN tbCurso
                ON tbCurso.codCurso = tbTurma.codCurso
		WHERE tbTurma.codCurso = 1

/*8) Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa*/
SELECT nomeAluno, FORMAT(dataMatricula, 'dd/MM/yyyy') FROM tbAluno
	INNER JOIN tbMatricula
		ON tbAluno.codAluno = tbMatricula.codAluno

	ORDER BY nomeAluno ASC



--9) Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês
SELECT nomeAluno AS Total_Alunos_Ingles FROM tbAluno
    INNER JOIN tbMatricula
        ON tbAluno.codAluno = tbMatricula.codAluno
    
        INNER JOIN tbTurma
            ON tbMatricula.codTurma = tbTurma.codTurma

            INNER JOIN tbCurso
                ON tbCurso.codCurso = tbTurma.codCurso
	WHERE tbTurma.codCurso = 1 AND SUBSTRING(CAST(nomeAluno AS VARCHAR), 1,1) = 'A'

--9) Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês
SELECT COUNT(dataMatricula) AS Matriculas_2016 FROM tbMatricula
	WHERE YEAR(	dataMatricula) = '2016'

-- 11) Apresentar a quantidade de matriculas por nome do curso
SELECT nomeCurso, COUNT(tbMatricula.codMatrcula) AS Quantidade_Por_Curso FROM tbCurso
    INNER JOIN tbTurma
        ON tbCurso.codCurso = tbTurma.codCurso
        
    INNER JOIN tbMatricula
        ON tbMatricula.codTurma = tbTurma.codTurma

	GROUP BY nomeCurso

-- 12) Apresentar a quantidade de alunos que fazem os cursos que custam mais de R$ 300,00
SELECT COUNT(tbMatricula.codAluno) AS Quantidade_Por_Preco FROM tbMatricula 
        INNER JOIN tbTurma
            ON tbMatricula.codTurma = tbTurma.codTurma

            INNER JOIN tbCurso
                ON tbCurso.codCurso = tbTurma.codCurso
	
	WHERE tbCurso.valorCurso > 300.00

-- 13) Apresentar os nomes dos alunos que fazem o curso de alemão
SELECT nomeAluno FROM tbAluno
	    INNER JOIN tbMatricula
        ON tbAluno.codAluno = tbMatricula.codAluno
    
        INNER JOIN tbTurma
            ON tbMatricula.codTurma = tbTurma.codTurma

            INNER JOIN tbCurso
                ON tbCurso.codCurso = tbTurma.codCurso

		WHERE nomeCurso = 'Alemão'