USE bdEscolaDeIdiomas



-- Exerc�cio 1: Criar uma stored procedure �Busca_Aluno� que receba o c�digo do aluno e retorne seu nome e data de nascimento.
CREATE PROCEDURE Busca_Aluno
@codigoAluno INT
AS
BEGIN
	SELECT nomeAluno, dataNascAluno	FROM tbAluno
		WHERE codAluno = @codigoAluno
END

EXEC Busca_Aluno 1

-- Exerc�cio 2: Criar uma stored procedure �Insere_Aluno� que insira um registro na tabela de Alunos.
CREATE PROCEDURE Insere_Aluno  
    @nomeAluno VARCHAR(70),
    @rgAluno VARCHAR(12),
    @cpfAluno VARCHAR(15),
    @logradouro VARCHAR(70),
    @numero VARCHAR(20),
    @complemento VARCHAR(50) = NULL,
    @cep VARCHAR(9),
    @bairro VARCHAR(50),
    @cidade VARCHAR(50),
    @dataNascAluno SMALLDATETIME
AS
BEGIN
	INSERT INTO tbAluno(nomeAluno, rgAluno, cpfAluno, logradouro, numero, complemento, cep, bairro, cidade, dataNascAluno)
		VALUES (
        @nomeAluno, @rgAluno, @cpfAluno, @logradouro, @numero, @complemento, @cep, @bairro, @cidade, @dataNascAluno
		);
END

EXEC Insere_Aluno 'Patrick Lessa Teixeira', '123456789', '12345678900', 'Rua Faultline', '10A', 'casa', '08121210', 'Silverchair Paulista', 'São Paulo', '03/05/2002'

-- Exerc�cio 3:  Criar uma stored procedure �Aumenta_Preco� que, dados o nome do curso e um percentual, aumente o valor do curso com a porcentagem informada
CREATE PROCEDURE Aumenta_Preco
@nomeCurso VARCHAR(255),
@percentualAumento FLOAT
AS
BEGIN
	UPDATE tbCurso
		SET valorCurso = valorCurso + (valorCurso / 100 * @percentualAumento)
	WHERE nomeCurso = @nomeCurso
END

EXEC Aumenta_Preco 'Inglês', 10

-- Exerc�cio 4: Criar uma stored procedure “Exibe_Turma” que, dado o nome da turma exiba todas as informações dela.
CREATE PROCEDURE Exibe_Turma
@nomeTurma VARCHAR(255)
AS
BEGIN
	SELECT * FROM tbTurma
		WHERE descTurma = @nomeTurma
END

EXEC Exibe_Turma 'Inglês 1A'

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

     WHERE tbTurma.descTurma = @nomeTurma
END

EXEC Exibe_AlunosdaTurma 'Inglês 1A'

-- Exercício 6: Criar uma stored procedure para inserir alunos, verificando pelo cpf se o aluno existe ou não, e informar essa condição via mensagem
CREATE PROCEDURE spInsereAlunos  
    @nomeAluno VARCHAR(70),
    @rgAluno VARCHAR(12),
    @cpfAluno VARCHAR(15),
    @logradouro VARCHAR(70),
    @numero VARCHAR(20),
    @complemento VARCHAR(50) = NULL,
    @cep VARCHAR(9),
    @bairro VARCHAR(50),
    @cidade VARCHAR(50),
    @dataNascAluno SMALLDATETIME
AS
BEGIN 
	DECLARE @idAluno INT
	IF exists(SELECT cpfAluno FROM tbAluno WHERE cpfAluno = @cpfAluno)
	BEGIN
		print('Não foi possível completar o cadastro. Já existe um aluno cadastrado no sistema usando esse CPF.')
	END

	ELSE
	BEGIN

		INSERT INTO tbAluno(nomeAluno, rgAluno, cpfAluno, logradouro, numero, complemento, cep, bairro, cidade, dataNascAluno)
			VALUES (
				@nomeAluno, @rgAluno, @cpfAluno, @logradouro, @numero, @complemento, @cep, @bairro, @cidade, @dataNascAluno
			);
		SET @idAluno = (select MAX(codAluno) FROM tbAluno)
		PRINT('Aluno ' + @nomeAluno + ' foi cadastrado com sucesso, código ' + convert(VARCHAR(5), @idAluno))

	END
END

EXEC spInsereAlunos 'Patrick Lessa Teixeira', '123456789', '12345678900', 'Rua Faultline', '10A', 'casa', '08121210', 'Silverchair Paulista', 'São Paulo', '03/05/2002'

-- Exercício 7:  Criar uma stored procedure que receba o nome do curso e o nome do aluno e matricule o mesmo no curso pretendido
CREATE PROCEDURE spMatriculaAluno 
@nomeCurso VARCHAR(255),
@nomeAluno VARCHAR(255)
AS
BEGIN
	DECLARE @codAluno INT
	DECLARE @codTurma INT

	SET @codAluno = (SELECT codAluno FROM tbAluno WHERE nomeAluno = @nomeAluno)
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

EXEC spMatriculaAluno 'Inglês', 'Patrick Lessa Teixeira'

-- OBS: Devido a ter a possibilidade de existir mais de uma turma que faz determinado tipo de curso (como duas turmas que fazem curso de inglês) eu fiz com que o SQL pegue apenas a primeira turma que aparecer

