USE dbEscola

-- Exercício 1: Criar uma stored procedure “Busca_Aluno” que receba o código do aluno e retorne seu nome e data de nascimento.
CREATE PROCEDURE Busca_Aluno
@codigoAluno INT
AS
	SELECT nomeAluno, dataNascAluno	FROM tbAluno
		WHERE codAluno = @codigoAluno

EXEC Busca_Aluno 1

-- Exercício 2: Criar uma stored procedure “Insere_Aluno” que insira um registro na tabela de Alunos.
CREATE PROCEDURE Insere_Aluno 
@nomeAluno VARCHAR(255),
@dataNascAluno DATE,
@rgAluno VARCHAR(50),
@naturalidadeAluno VARCHAR(2)
AS
	INSERT INTO tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno) VALUES
	(@nomeAluno, @dataNascAluno, @rgAluno, @naturalidadeAluno)

EXEC Insere_Aluno 'Paulo Santos', '2000-03-10 00:00:00', '82.282.122-0', 'SP'

-- Exercício 3:  Criar uma stored procedure “Aumenta_Preco” que, dados o nome do curso e um percentual, aumente o valor do curso com a porcentagem informada
CREATE PROCEDURE Aumenta_Preco
@nomeCurso VARCHAR(255),
@percentualAumento FLOAT
AS
	UPDATE tbCurso
		SET valorCurso = valorCurso + (valorCurso / 100 * @percentualAumento)
	WHERE nomeCurso = @nomeCurso

EXEC Aumenta_Preco 'Inglês', 10

SELECT * FROM  tbCurso

-- Exercício 4: 