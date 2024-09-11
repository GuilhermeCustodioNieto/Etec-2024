USE dbStore
 
-- Exercício 1: A
CREATE PROCEDURE spInsereCategoriaProduto
	@nomeCategoriaProduto VARCHAR(255)
AS
BEGIN
	IF (EXISTS(SELECT TOP 1 codCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto = @nomeCategoriaProduto))
	BEGIN
		PRINT('Já existe uma categoria com esse nome cadastrada')
	END
	ELSE
	BEGIN
		INSERT INTO tbCategoriaProduto(nomeCategoriaProduto) 
		VALUES (@nomeCategoriaProduto)
	END
END


EXEC spInsereCategoriaProduto 'Bolo Festa'
EXEC spInsereCategoriaProduto 'spInsereCategoriaProduto' 
EXEC spInsereCategoriaProduto 'Torta'
EXEC spInsereCategoriaProduto 'Salgado'
 
 
-- Exercício 1: b
CREATE PROCEDURE spInsereProduto
	@nomeProduto VARCHAR(255),
	@precoKiloProduto FLOAT,
	@codCategoriaProduto INT
AS
BEGIN
	IF (EXISTS(SELECT TOP 1 nomeProduto FROM tbProduto WHERE nomeProduto = @nomeProduto))
	BEGIN 
		PRINT('Produto ' + @nomeProduto + ' já existe no sistema')
	END
	ELSE
	BEGIN
		INSERT INTO tbProduto(nomeProduto, precoKiloProduto, codCategoriaProduto) 
		VALUES (@nomeProduto, @precoKiloProduto, @codCategoriaProduto)
		PRINT('Produto ' + @nomeProduto + ' inserido com sucesso')
	END
END

EXEC spInsereProduto 'Bolo Floresta Negra', 42.00, 1
EXEC spInsereProduto 'Bolo Prestígio', 43.00, 1
EXEC spInsereProduto 'Nutela', 44.00, 1
EXEC spInsereProduto 'Bolo Formigueiro', 17.00, 2
EXEC spInsereProduto 'Bolo de cenoura', 19.00, 2
EXEC spInsereProduto 'Torta de palmito', 45.00, 3
EXEC spInsereProduto 'Torta de frango com catupiry', 47.00, 3
EXEC spInsereProduto 'Coxinha de frango', 25.00, 4
EXEC spInsereProduto 'Torta de escarola', 44.00, 3
EXEC spInsereProduto 'Coxinha de frango', 25.00, 4
EXEC spInsereProduto 'Esfiha carne', 27.00, 4
EXEC spInsereProduto 'Folhado queijo', 31.00, 4
EXEC spInsereProduto 'Risoles misto', 29.00, 4
 
--  Exercício 1: C
CREATE PROCEDURE spInsereCliente 
	@nomeCliente VARCHAR(255),
	@dataNascimentoCliente DATE,
	@ruaCliente VARCHAR(255),
	@numCasaCliente INT,
	@cepCliente VARCHAR(9),
	@bairroCliente VARCHAR(255),
	@cidadeCliente VARCHAR(255),
	@estadoCliente VARCHAR(255),
	@cpfCliente VARCHAR(255),
	@sexoCliente VARCHAR(2)
AS 
BEGIN
	IF (EXISTS (SELECT codCliente FROM tbCliente WHERE cpfCliente = @cpfCliente))
	BEGIN
		PRINT('Cliente cpf ' + @cpfCliente + ' já cadastrado')
	END
	ELSE IF (@bairroCliente NOT IN ('Guaianases','Itaquera'))
	BEGIN
		PRINT('Não foi possível cadastrar o cliente ' + @nomeCliente + ' pois o bairro ' + @bairroCliente + ' não é atendido pela confeitaria')
	END
	ELSE
	BEGIN
		INSERT INTO tbCliente(nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente) 
		VALUES (@nomeCliente, @dataNascimentoCliente, @ruaCliente, @numCasaCliente, @cepCliente, @bairroCliente, @cidadeCliente, @estadoCliente, @cpfCliente, @sexoCliente)
		PRINT('Cliente cadastrado com sucesso')
	END
END

EXEC spInsereCliente 'Samira Fatah', '1990-05-05', 'Rua Aguapeí', 1000, '08.090-000', 'Guaianases', 'São Paulo', 'SP', '12345678900', 'F'
EXEC spInsereCliente 'Celia Nogueira', '1992-06-06', 'Rua Andes', 234, '08.456-090', 'Guaianases', 'São Paulo', 'SP', '12345678901', 'F'
EXEC spInsereCliente 'Paulo Cesar Siqueira', '1984-04-04', 'Rua Castelo do Piauí', 232, '08.109-000', 'Itaquera', 'São Paulo', 'SP', '12345678902', 'M'
EXEC spInsereCliente 'Rodrigo Favaroni', '1991-04-09', 'Rua Sansão Castelo Branco', 10, '08.431-090', 'Guaianases', 'São Paulo', 'SP', '12345678903', 'M'
EXEC spInsereCliente 'Flávia Regina Brito', '1992-04-22', 'Rua Mariano Moro', 300, '08.200-123', 'Itaquera', 'São Paulo', 'SP', '12345678904', 'F'
 
-- Exercício 1: D
ALTER PROCEDURE spInsereEncomenda
	@cpfCliente VARCHAR(255),
	@dataEncomenda DATE,
	@valorTotalEncomenda FLOAT,
	@dataEntregaEncomenda DATE
 
	AS 
	BEGIN
		DECLARE @nomeCliente VARCHAR(255)
		DECLARE @codCliente INT

		SET @nomeCliente = (SELECT TOP 1 nomeCliente FROM tbCliente WHERE cpfCliente = @cpfCliente)
		SET @codCliente = (SELECT TOP 1 codCliente FROM tbCliente WHERE cpfCliente = @cpfCliente)

		IF (@codCliente IS NULL)
		BEGIN 
			PRINT('não foi possível efetivar a encomenda pois o cliente de cpf' + @nomeCliente + ' não
está cadastrado')
		END
 
		ELSE
		BEGIN 
			INSERT INTO tbEncomenda(dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda) VALUES 
				(@dataEncomenda, @codCliente, @valorTotalEncomenda, @dataEntregaEncomenda)

			PRINT('A encomenda acabou de ser feita com sucesso.')
		END
 
	END
 
EXEC spInsereEncomenda '12345678900', '2015-08-08', 450.00, '2015-08-15';
EXEC spInsereEncomenda '12345678901', '2015-10-10', 200.00, '2015-10-15';
EXEC spInsereEncomenda '12345678902', '2015-10-10', 150.00, '2015-12-10';
EXEC spInsereEncomenda '12345678900', '2015-10-06', 250.00, '2015-10-12';
EXEC spInsereEncomenda '12345678903', '2015-10-05', 150.00, '2015-10-12';
 
-- Exercício 1: E
CREATE PROCEDURE spInsereItensEncomenda 
	@codEncomenda INT,
	@codProduto INT,
	@quantidadeKilo FLOAT,
	@subTotal FLOAT

	AS
	BEGIN
		IF(NOT EXISTS (SELECT codEncomenda FROM tbEncomenda WHERE codEncomenda = @codEncomenda)) 
		BEGIN
			PRINT('A encomenda ' + @codEncomenda + 'não existe')
		END

		ELSE IF(NOT EXISTS (SELECT codProduto FROM tbProduto WHERE codProduto = @codProduto)) 
		BEGIN
			PRINT('O produto ' + @codProduto + ' não existe no sistema')
		END

		ELSE
		BEGIN
			INSERT INTO tbItensEncomenda(codEncomenda, codProduto, quantidadeKilos, subTotal) VALUES
				(@codEncomenda, @codProduto, @quantidadeKilo, @subTotal)

			PRINT('A sua encomenda acabou de ser feita.')
		END

	END

EXEC spInsereItensEncomenda 1, 1, 2.5, 105.00
EXEC spInsereItensEncomenda 1, 10, 2.6, 70.00
EXEC spInsereItensEncomenda 1, 9, 6, 150.00
EXEC spInsereItensEncomenda 1, 12, 4.3, 125.00
EXEC spInsereItensEncomenda 2, 9, 8, 200.00
EXEC spInsereItensEncomenda 3, 11, 3.2, 100.00
EXEC spInsereItensEncomenda 3, 9, 2, 50.00
EXEC spInsereItensEncomenda 4, 2, 3.5, 150.00
EXEC spInsereItensEncomenda 4, 3, 2.2, 100.00
EXEC spInsereItensEncomenda 5, 6, 3.4, 150.00
 
-- Exercício 1: F
 
-- Exercício F: 1
 
CREATE PROCEDURE AlterarPrecoBoloFesta
AS 
BEGIN
	UPDATE tbProduto
		SET precoKiloProduto = precoKiloProduto * 1.10
		WHERE codCategoriaProduto IN ( SELECT codCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto = 'Bolo festa');
END;
 
EXEC AlterarPrecoBoloFesta;
 
-- Exercício F: 2
 
CREATE PROCEDURE AlterarPrecoBoloSimples
AS 
BEGIN
UPDATE tbProduto
	SET precoKiloProduto = precoKiloProduto * 0.80
	WHERE codCategoriaProduto IN ( SELECT codCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto = 'Bolo simples');
END;
 
EXEC AlterarPrecoBoloSimples;
 
-- Exercício F: 3
 
CREATE PROCEDURE AlterarPrecoTorta
AS 
BEGIN
UPDATE tbProduto
	SET precoKiloProduto = precoKiloProduto * 1.25
	WHERE codCategoriaProduto IN ( SELECT codCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto = 'Torta');
END;
 
EXEC AlterarPrecoTorta;
 
-- Exercício F: 4
 
CREATE PROCEDURE AlterarPrecoSalgado
AS 
BEGIN
UPDATE tbProduto
	SET precoKiloProduto = precoKiloProduto * 1.20
	WHERE codCategoriaProduto IN ( SELECT codCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto = 'Salgado') AND codProduto  <> 10;
END;
 
EXEC AlterarPrecoSalgado;
 
-- Exercício 1: G
 
CREATE PROCEDURE RemocaoCliente
	@cpfCliente VARCHAR(255)
AS 
BEGIN
 
-- Declarando o nome do Cliente
	DECLARE @nomeCliente VARCHAR(255)
	SELECT @nomeCliente = nomeCliente  FROM tbCliente WHERE cpfCliente = @cpfCliente
 
-- Checando Encomendas
		IF EXISTS (
			SELECT tbCliente.cpfCliente, tbEncomenda.codCliente FROM tbCliente
			INNER JOIN tbEncomenda
			ON tbCliente.codCliente = tbEncomenda.codCliente
			WHERE tbCLiente.cpfCliente = @cpfCliente)
		BEGIN
			PRINT('Impossivel remover esse cliente pois o cliente ' + @nomeCliente + ' possui encomendas')
		END
		ELSE
		BEGIN
			DELETE FROM tbCliente
			WHERE tbCliente.cpfCliente = @cpfCliente	
			PRINT ('Cliente ' + @nomeCliente + ' removido com sucesso') 
		END
END
 
 
EXEC RemocaoCliente '';
 
-- Exercício 1: H
 
CREATE PROCEDURE AlteracaoPedido 
	@codigoEncomenda INT,
	@codigoProduto INT
AS 
BEGIN
 
-- datas
	DECLARE @dataAtual DATE
	SET @dataAtual = CAST(GETDATE() AS DATE);
 
	DECLARE @dataEntrega DATE
	SET @dataEntrega = (SELECT dataEntregaEncomenda FROM tbEncomenda WHERE codEncomenda = @codigoEncomenda)
-- Verificação do produto
 
	DECLARE @valorProduto INT
	SELECT @valorProduto = subTotal FROM tbItensEncomenda WHERE codProduto = @codigoProduto
 
	
	IF @dataEntrega > @dataAtual
	BEGIN 
		DELETE FROM tbItensEncomenda WHERE codEncomenda = @codigoEncomenda AND codProduto = @codigoProduto
		UPDATE tbEncomenda SET valorTotalEncomenda = valorTotalEncomenda - @valorProduto WHERE codEncomenda = @codigoEncomenda
	END
	ELSE 
	BEGIN
		PRINT ('Data Invalida para alteração de encomendas')
	END
END
 
EXEC AlteracaoPedido 1, 1