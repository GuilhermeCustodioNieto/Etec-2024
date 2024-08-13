USE bdRecursosHumanos

INSERT INTO tbDepartamento (nomeDepartamento) VALUES 
('Compras'),
('Vendas'),
('TI'),
('Marketing');

INSERT INTO tbFuncionario (nomeFuncionario, cpfFuncionario, sexoFuncionario, dataNascimentoFuncionario, salarioFuncionario, codDepartamento) VALUES 
('Maria Luisa Moura', '12345678900', 'F', '1990-02-10', 3400.00, 1),
('Mariana Goulart', '4567890299', 'F', '1991-04-08', 2800.00, 1),
('Pedro Paulo Vidigal', '64587222388', 'M', '1994-05-07', 5400.00, 2),
('Carlos Calixto', '83783223233', 'M', '1965-03-03', 8900.00, 2),
('Viviane Martins', '77832233399', 'F', '1976-06-06', 4300.00, 3),
('Analice Mendes', '83703383439', 'F', '1981-09-09', 6800.00, 3),
('Patricia Ishikawa', '43356609300', 'F', '1978-05-05', 4900.00, 4);

INSERT INTO tbDependente (nomeDependente, dataNascimentoDependente, sexoDependente, codFuncionario) VALUES 
('Lucas Moura', '2015-01-10', 'M', 1),
('Carlos Calixto Jr', '2000-06-08', 'M', 4),
('Michele Costa Calixto', '2003-09-09', 'F', 4),
('Silvana Costa Calixto', '2006-04-04', 'F', 4),
('Arthur Mendes Silva', '2010-07-07', 'M', 6);