USE db_estoque

INSERT INTO tblCliente(nomeCliente, cpfCliente, emailCliente, sexoCliente, dataNascimentoCliente)
VALUES
('Amando José Santana', '12345678900', 'amandojosesantana@outlook.com', 'm', '1961-02-21'),
('Sheila Carvalho Leal', '4567809823', 'scarvalho@ig.com.br', 'f', '1978-09-13'),
('Carlos Henrique Souza', '76598278299', 'chenrique@ig.com.br', 'm', '1981-09-08'),
('Maria Aparecida Souza', '87365309388', 'mapdasouza@outlook.com', 'f', '1977-04-09'),
('Adriana Nogueira Silva', '76354309388', 'drica1977@ig.com.br', 'f', '1977-04-09'),
('Paulo Henrique Silva', '87390123111', 'phsivla80@hotmail.com', 'm', '1987-02-02')

INSERT INTO tblFabricante(nomeFabricante) 
VALUES
('Unilever'),
('P&G'),
('Bunge')

INSERT INTO tblFornecedor(nomeFornecedor, contatoFornecedor)
VALUES
('Atacadão', 'Carlos Santos'),
('Assai', 'Maria Stella'),
('Roldão', 'Paulo César')

INSERT INTO tblProduto(descricaoProduto, valorProduto, quantidadeProduto, codFabricante, codFornecedor)
VALUES 
('Amaciante Downy', 5.76, 1500, 2,1),
('Amaciante Confort', 4.45, 2300,1,1),
('Sabão em pó OMO', 5.99, 1500, 1, 2),
('Margaina Qualy', 4.76, 2500, 3,1),
('Salsicha Hot Dog Sadia', 6.78, 2900, 3, 2),
('Mortadela Perdigão', 2.50, 1200, 3, 3),
('Hamburguer Sadia', 9.89, 1600, 3,1),
('Fralda Pampers', 36.00, 340, 2, 3),
('Xampu Seda', 5.89, 800, 1,2),
('Condicionador Seda', 6.50, 700, 1, 3)

INSERT INTO tblVenda(dataVenda, valorTotalVenda, codCliente)
VALUES 
('2014-02-01', 4500.00, 1),
('2014-02-03', 3400, 1),
('2014-02-10', 2100, 2),
('2014-02-15', 2700, 3),
('2014-03-17', 560, 3),
('2014-04-09', 1200, 4),
('2014-05-07', 3500, 5),
('2014-05-07', 3400, 1),
('2014-05-05', 4000, 2)

INSERT INTO tblItensVenda(codVenda, codProduto, quantidadeitensVenda, subTotalItensvenda) VALUES
(1, 1, 200, 1500.00),
(1, 2, 300, 3000.00),
(2 ,4 ,120, 1400.00),
(2, 2, 200, 1000.00),
(2, 3, 130, 1000.00),
(3, 5, 200, 2100.00),
(4, 4, 120,1000.00),
(4, 5, 450, 700.00),
(5, 5, 200, 560.00),
(6, 7, 200, 600.00),
(6, 6, 300, 600.00),
(7, 1, 300, 2500.00),
(7, 2, 200, 1000.00),
(8, 6, 250, 1700.00),
(8, 5, 200, 1700.00),
(9, 4, 1000, 4000.00)