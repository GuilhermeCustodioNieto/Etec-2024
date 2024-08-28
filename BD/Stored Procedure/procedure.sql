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

-- Exerc�cio 4: Criar uma stored procedure “Exibe_Turma” que, dado o nome da turma exiba todas as informações dela.
CREATE PROCEDURE Exibe_Turma
@nomeTurma VARCHAR(255)
AS
BEGIN
	SELECT * FROM tbTurma
		WHERE nomeTurma = @nomeTurma
END

EXEC Exibe_Turma '1|A'

-- Exercício 5: Criar uma stored procedure “Exibe_AlunosdaTurma” que, dado o nome da turma exiba os seus alunos.
CREATE PROCEDURE Exibe_AlunosdaTurma
@nomeTurma VARCHAR(255)
AS
BEGIN
SELECT nomeAluno FROM tbAluno
    INNER JOIN tbMatricula
        ON tbAluno.codAluno = tbMatricula.codAluno
    
        INNER JOIN tbTurma
            ON tbMatricula.codTurma = tbTurma.codTurma

     WHERE tbTurma.nomeTurma = @nomeTurma
END

EXEC Exibe_AlunosdaTurma '1|A'

-- Exercício 6: Criar uma stored procedure para inserir alunos, verificando pelo cpf se o aluno existe ou não, e informar essa condição via mensagem
CREATE PROCEDURE spInsereAlunos  
@nomeAluno VARCHAR(255),
@dataNascAluno DATE,
@rgAluno VARCHAR(50),
@naturalidadeAluno VARCHAR(2)
AS
BEGIN 
	DECLARE @idAluno INT
	IF exists(SELECT rgAluno FROM tbAluno WHERE rgAluno = @rgAluno)
	BEGIN
		print('Não foi possível completar o cadastro. Já existe um aluno cadastrado no sistema usando esse CPF.')
	END

	ELSE
	BEGIN
		INSERT INTO tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno) VALUES
			(@nomeAluno, @dataNascAluno, @rgAluno, @naturalidadeAluno)

		SET @idAluno = (select MAX(codAluno) FROM tbAluno)
		PRINT('Aluno ' + @nomeAluno + ' foi cadastrado com sucesso, código ' + convert(VARCHAR(5), @idAluno))

	END
END

EXEC spInsereAlunos'Paulo Santos', '2000-03-10 00:00:00', '82.282.122-0', 'SP'

-- Exercício 7:  Criar uma stored procedure que receba o nome do curso e o nome do aluno e matricule o mesmo no curso pretendido
CREATE PROCEDURE spMatriculaAluno 
@nomeCurso VARCHAR(255),
@nomeAluno VARCHAR(255)
AS
BEGIN
	DECLARE @codAluno INT
	DECLARE @codTurma INT

	SET @codAluno = (SELECT TOP 1 codAluno FROM tbAluno WHERE nomeAluno = @nomeAluno)
	SET @codTurma = (SELECT TOP 1 codTurma FROM tbTurma 
		INNER JOIN tbCurso ON tbTurma.codCurso = tbCurso.codCurso
		WHERE tbCurso.nomeCurso = @nomeCurso)

	IF @codAluno != NULL AND @codTurma != NULL
	BEGIN
		INSERT INTO tbMatricula(codAluno, codTurma, dataMatricula) VALUES
			(@codAluno, @codTurma, GETDATE())
	END
	ELSE
	BEGIN
		PRINT('Não foi encontrado nenhum aluno ou turma voltada para o curso informado.')
	END
END

EXEC spMatriculaAluno 'Inglês', 'Paulo Santos'

-- OBS: Devido a ter a possibilidade de existir mais de uma turma que faz determinado tipo de curso (como duas turmas que fazem curso de inglês) eu fiz com que o SQL pegue apenas a primeira turma que aparecer