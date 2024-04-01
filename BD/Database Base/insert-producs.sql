USE db_estoque

INSERT INTO tbLCliente(nomeCliente, cpfCliente, emailCliente, sexoCliente, dataNascimentoCliente)
VALUES
('Amando José Santana', '12345678900', 'amandojosesantana@outlook.com', 'm', '1961-02-21 00:00:00'),
('Sheila Carvalho Leal', '4567809823', 'scarvalho@ig.com.br', 'f', '1978-09-13 00:00:00'),
('Carlos Henrique Souza', '76598278299', 'chenrique@ig.com.br', 'm', '1981-09-08 00:00:00'),
('Maria Aparecida Souza', '87365309388', 'mapdasouza@outlook.com', 'f', '1977-04-09 00:00:00'),
('Adriana Nogueira Silva', '76354309388', 'drica1977@ig.com.br', 'f', '1977-04-09 00:00:00'),
('Paulo Henrique Silva', '87390123111', 'phsivla80@hotmail.com', 'm', '1987-02-02 00:00:00')

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

