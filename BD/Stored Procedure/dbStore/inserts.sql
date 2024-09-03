USE dbStore

INSERT INTO tbCategoriaProduto(nomeCategoriaProduto) VALUES
	('Bolo Festa'),
	('Bolo Simples'),
	('Torta'),
	('Salgado')

INSERT INTO tbProduto(nomeProduto, precoKiloProduto, codCategoriaProduto) VALUES
	('Bolo Floresta Negra', 42.00, 1),
	('Bolo Prestígio', 43.00, 1),
	('Nutela', 44.00, 1),
	('Bolo Formigueiro', 17.00, 2),
	('Bolo de cenoura', 19.00, 2),
	('Torta de palmito', 45.00, 3),
	('Torta de frango com catupiry', 47.00, 3),
	('Coxinha de frango', 25.00, 4),
	('Torta de escarola', 44.00, 3),
	('Coxinha de frango', 25.00, 4),
	('Esfiha carne', 27.00, 4),
	('Folhado queijo', 31.00, 4),
	('Risoles misto', 29.00, 4)


INSERT INTO tbCliente(nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente, bairroCliente, sexoCliente) VALUES
	('Samira Fatah', '1990-05-05 00:00:00', 'Rua Aguapeí', 1000, '08.090-000', 'Guaianases', 'F'),
	('Celia Nogueira', '1992-06-06 00:00:00', 'Rua Andes', 234, '08.456-090', 'Guaianases', 'F'),
	('Paulo Cesar Siqueira', '1984-04-04 00:00:00', 'Rua Castelo do Piauí', 232, '08.109-000', 'Itaquera', 'M'),
	('Rodrigo Favaroni', '1991-04-09 00:00:00', 'Rua Sansão Castelo Branco', 10, '08.431-090', 'Guaianases', 'M'),
	('Flávia Regina Brito', '1992-04-22 00:00:00', 'Rua Mariano Moro', 300, '08.200-123', 'Itaquera', 'F')

INSERT INTO tbEncomenda(dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda) VALUES 
	('08-08-2015', 1, 450.00, '15/08/2015'),
	('10-10-2015', 2, 200.00, '15/10/2015'),
	('10-10-2015', 3, 150.00, '10/12/2015'),
	('06-10-2015', 1, 250.00, '12/10/2015'),
	('05-10-2015', 4, 150.00, '12/10/2015')

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