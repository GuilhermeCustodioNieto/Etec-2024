CREATE DATABASE bdRecursosHumanos 

USE bdRecursosHumanos

DROP DATABASE bdRecursosHumanos

CREATE TABLE tbDepartamento(
	codDepartamento INT NOT NULL PRIMARY KEY IDENTITY(1, 1)
	,nomeDepartamento VARCHAR(255) NOT NULL
)

CREATE TABLE tbFuncionario(
	codFuncionario INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	, nomeFuncionario VARCHAR (255) NOT NULL
	, cpfFuncionario VARCHAR (255) NOT NULL
	, sexoFuncionario CHAR NOT NULL
	, dataNascimentoFuncionario DATE NOT NULL 
	, salarioFuncionario FLOAT NOT NULL
	, codDepartamento INT NOT NULL REFERENCES tbDepartamento (codDepartamento)
)

CREATE TABLE tbDependente(
	codDependente  INT NOT NULL PRIMARY KEY IDENTITY(1,1)
	, nomeDependente VARCHAR(255) NOT NULL
	, dataNascimentoDependente VARCHAR (10) NOT NULL
	, sexoDependente VARCHAR (255) NOT NULL
	, codFuncionario INT NOT NULL REFERENCES tbFuncionario (codFuncionario)
)

-- Inserindo dados na tabela de departamentos
INSERT INTO tbDepartamento (nomeDepartamento) VALUES 
('Compras'),
('Vendas'),
('TI'),
('Marketing');

-- Inserindo dados na tabela de funcionários
INSERT INTO tbFuncionario (nomeFuncionario, cpfFuncionario, sexoFuncionario, dataNascimentoFuncionario, salarioFuncionario, codDepartamento) VALUES 
('Maria Luisa Moura', '12345678900', 'F', '1990-02-10', 3400.00, 1),
('Mariana Goulart', '4567890299', 'F', '1991-04-08', 2800.00, 1),
('Pedro Paulo Vidigal', '64587222388', 'M', '1994-05-07', 5400.00, 2),
('Carlos Calixto', '83783223233', 'M', '1965-03-03', 8900.00, 2),
('Viviane Martins', '77832233399', 'F', '1976-06-06', 4300.00, 3),
('Analice Mendes', '83703383439', 'F', '1981-09-09', 6800.00, 3),
('Patricia Ishikawa', '43356609300', 'F', '1978-05-05', 4900.00, 4);

-- Inserindo dados na tabela de dependentes
INSERT INTO tbDependente (nomeDependente, dataNascimentoDependente, sexoDependente, codFuncionario) VALUES 
('Lucas Moura', '2015-01-10', 'M', 1),
('Carlos Calixto Jr', '2000-06-08', 'M', 4),
('Michele Costa Calixto', '2003-09-09', 'F', 4),
('Silvana Costa Calixto', '2006-04-04', 'F', 4),
('Arthur Mendes Silva', '2010-07-07', 'M', 6);


-- Exercício 1
CREATE VIEW Funcionarios_Departamento AS
	SELECT tbDepartamento.nomeDepartamento, COUNT(codFuncionario) AS quantidade_funcionarios FROM tbDepartamento
		INNER JOIN tbFuncionario ON tbFuncionario.codDepartamento = tbDepartamento.codDepartamento

	GROUP BY tbDepartamento.nomeDepartamento, tbFuncionario.codDepartamento

-- Exercício 2
SELECT nomeDepartamento FROM Funcionarios_Departamento 
	WHERE quantidade_funcionarios = (SELECT MIN(quantidade_funcionarios) FROM Funcionarios_Departamento)
	
-- Exercício 3
CREATE VIEW Soma_Salarios AS
	SELECT SUM(tbFuncionario.salarioFuncionario) AS soma_salarios FROM tbFuncionario
		INNER JOIN tbDepartamento ON tbFuncionario.codDepartamento = tbDepartamento.codDepartamento

	GROUP BY tbDepartamento.nomeDepartamento, tbFuncionario.codDepartamento

-- Exercício 4
SELECT soma_salarios FROM Soma_Salarios
	WHERE soma_salarios = (SELECT max(soma_salarios) FROM Soma_Salarios)

-- Exercício 5
CREATE VIEW Funcionarios_sem_dependentes AS
	SELECT tbFuncionario.nomeFuncionario as nome_funcionarios, tbDepartamento.nomeDepartamento nome_departamento FROM tbFuncionario
		INNER JOIN tbDepartamento ON tbFuncionario.codDepartamento = tbDepartamento.codDepartamento

	WHERE tbFuncionario.codFuncionario NOT IN (SELECT codFuncionario FROM tbDependente)

-- Exercício 6
CREATE VIEW Dependentes_por_Funcionario AS 
	SELECT COUNT(codDependente) FROM tbDependente
		INNER JOIN tbFuncionario ON tbFuncionario.codFuncionario = tbDependente.codDependente

	GROUP BY tbFuncionario.nomeFuncionario


SELECT * FROM tbDepartamento
SELECT * FROM tbDependente
SELECT * FROM tbFuncionario