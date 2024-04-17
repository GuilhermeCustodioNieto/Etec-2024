/*EXERCÍCIO 1*/

SELECT nomeAluno, nomeCurso FROM tbAluno
    INNER JOIN tbMatricula
        ON tbAluno.codAluno = tbMatricula.codAluno
    
        INNER JOIN tbTurma
            ON tbMatricula.codTurma = tbTurma.codTurma

            INNER JOIN tbCurso
                ON tbCurso.codCurso = tbTurma.codTurma

/*EXERCÍCIO 2*/

SELECT tbCurso.nomeCurso, COUNT(tbMatricula.codMatrcula) FROM tbCurso
    INNER JOIN tbTurma
        ON tbCurso.codCurso = tbTurma.codCurso
        
    INNER JOIN tbMatricula
        ON tbMatricula.codTurma = tbTurma.codTurma
    
    GROUP BY tbCurso.nomeCurso

/*EXERCÍCIO 3*/

SELECT tbTurma.nomeTurma, COUNT(tbMatricula.codMatrcula) FROM tbTurma     
    INNER JOIN tbMatricula
        ON tbMatricula.codTurma = tbTurma.codTurma
    
    GROUP BY tbTurma.nomeTurma

/*EXERCÍCIO 4*/

SELECT COUNT(codMatrcula) as quantidade_alunos_2016 FROM tbMatricula
	WHERE YEAR(dataMatricula) = 2016 AND MONTH(dataMatricula) = 5

    GROUP BY tbMatricula.dataMatricula

/*EXERCÍCIO 5*/
SELECT nomeAluno, nomeTurma, nomeCurso FROM tbAluno
    INNER JOIN tbMatricula
        ON tbAluno.codAluno = tbMatricula.codAluno
    
        INNER JOIN tbTurma
            ON tbMatricula.codTurma = tbTurma.codTurma

            INNER JOIN tbCurso
                ON tbCurso.codCurso = tbTurma.codTurma

    ORDER BY nomeAluno ASC