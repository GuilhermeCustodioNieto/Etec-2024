USE dbStore

-- Exerc�cio 1: A

INSERT INTO tbCategoriaProduto(nomeCategoriaProduto) VALUES
	('Bolo Festa'),
	('Bolo Simples'),
	('Torta'),
	('Salgado')


-- Exerc�cio 1: b
CREATE PROCEDURE spInsereProduto
	@nomeProduto varchar(255),
	@precoKiloProduto FLOAT,
	@codCategoriaProduto INT

	AS
	BEGIN
		IF(EXISTS (SELECT nomeProduto FROM tbProduto WHERE nomeProduto = @nomeProduto))
		BEGIN 
			PRINT('Produto ' + @nomeProduto + ' j� existe no sistema')
		END
		ELSE
		BEGIN
			INSERT INTO tbProduto(nomeProduto, precoKiloProduto, codCategoriaProduto) VALUES
				(@nomeProduto, @precoKiloProduto, @codCategoriaProduto)

			PRINT('Produto ' + @nomeProduto + ' inserido com sucesso')
		END
	END


EXEC spInsereProduto 'Bolo Floresta Negra', 42.00, 1
EXEC spInsereProduto 'Bolo Prest�gio', 43.00, 1
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

--  Exerc�cio 1: C
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
			PRINT('Cliente cpf ' + @cpfCliente + ' j� cadastrado')
		END

		ELSE IF(@bairroCliente NOT IN('Guaianases','Itaquera'))
		BEGIN
			PRINT('N�o foi poss�vel cadastrar o clinete ' + @nomeCliente + ' pois o bairro ' + @bairroCliente + ' n�o � atendido pela confeitaria')

		END

		ELSE
		BEGIN
			INSERT INTO tbCliente(nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente) 
			VALUES(@nomeCliente, @dataNascimentoCliente, @ruaCliente, @numCasaCliente, @cepCliente, @bairroCliente, @cidadeCliente, @estadoCliente, @cpfCliente, @sexoCliente)

			PRINT('Cliente cadastrado com sucesso')
		END
	END

EXEC spInsereCliente 'Samira Fatah', '1990-05-05', 'Rua Aguape�', 1000, '08.090-000', 'Guaianases', 'S�o Paulo', 'SP', '12345678900', 'F'
EXEC spInsereCliente 'Celia Nogueira', '1992-06-06', 'Rua Andes', 234, '08.456-090', 'Guaianases', 'S�o Paulo', 'SP', '12345678901', 'F'
EXEC spInsereCliente 'Paulo Cesar Siqueira', '1984-04-04', 'Rua Castelo do Piau�', 232, '08.109-000', 'Itaquera', 'S�o Paulo', 'SP', '12345678902', 'M'
EXEC spInsereCliente 'Rodrigo Favaroni', '1991-04-09', 'Rua Sans�o Castelo Branco', 10, '08.431-090', 'Guaianases', 'S�o Paulo', 'SP', '12345678903', 'M'
EXEC spInsereCliente 'Fl�via Regina Brito', '1992-04-22', 'Rua Mariano Moro', 300, '08.200-123', 'Itaquera', 'S�o Paulo', 'SP', '12345678904', 'F'

-- Exerc�cio 1: D
CREATE PROCEDURE spInsereEncomenda
	@cpfCliente VARCHAR(255),
	@dataEncomenda DATE,
	@codCliente INT,
	@valorTotalEncomenda FLOAT,
	@dataEntregaEncomenda DATE

	AS 
	BEGIN
		DECLARE @nomeCliente VARCHAR(255)

		SET @nomeCliente = (SELECT TOP 1 nomeCliente FROM tbCliente WHERE cpfCliente = @cpfCliente)

		IF (@nomeCliente IS NULL)
		BEGIN 
			PRINT('n�o foi poss�vel efetivar a encomenda pois o cliente de cpf' + @cpfCliente + ' n�o
est� cadastrado')
		END

		ELSE
		BEGIN 
			INSERT INTO tbEncomenda(dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda) VALUES 
				(@dataEncomenda, @codCliente, @valorTotalEncomenda, @dataEntregaEncomenda)
		END

	END

EXEC spInsereEncomenda '12345678900', '2015-08-08', 1, 450.00, '2015-08-15';
EXEC spInsereEncomenda '12345678901', '2015-10-10', 2, 200.00, '2015-10-15';
EXEC spInsereEncomenda '12345678902', '2015-10-10', 3, 150.00, '2015-12-10';
EXEC spInsereEncomenda '12345678900', '2015-10-06', 1, 250.00, '2015-10-12';
EXEC spInsereEncomenda '12345678903', '2015-10-05', 4, 150.00, '2015-10-12';


-- Exerc�cio 1: E
INSERT INTO tbItensEncomenda(codEncomenda, codProduto, quantidadeKilos, subTotal) VALUES
	(1, 1, 2.5, 105.00),
	(1, 10, 2.6, 70.00),
	(1, 9, 6, 150.00),
	(1, 12, 4.3, 125.00),
	(2, 9, 8, 200.00),
	(3, 11, 3.2, 100.00),
	(3, 9, 2, 50.00),
	(4, 2, 3.5, 150.00),
	(4, 3, 2.2, 100.00),
	(5, 6, 3.4, 150.00)