USE bdRecursosHumanos

-- Exercício A
CREATE VIEW Funcionarios_Departamento AS
	SELECT tbDepartamento.nomeDepartamento, COUNT(codFuncionario) AS quantidade_funcionarios FROM tbDepartamento
		INNER JOIN tbFuncionario ON tbFuncionario.codDepartamento = tbDepartamento.codDepartamento

	GROUP BY tbDepartamento.nomeDepartamento, tbFuncionario.codDepartamento

-- Exercício B
SELECT nomeDepartamento FROM Funcionarios_Departamento 
	WHERE quantidade_funcionarios = (SELECT MIN(quantidade_funcionarios) FROM Funcionarios_Departamento)
	
-- Exercício C
CREATE VIEW Soma_Salarios AS
	SELECT SUM(tbFuncionario.salarioFuncionario) AS soma_salarios FROM tbFuncionario
		INNER JOIN tbDepartamento ON tbFuncionario.codDepartamento = tbDepartamento.codDepartamento

	GROUP BY tbDepartamento.nomeDepartamento, tbFuncionario.codDepartamento

-- Exercício D
SELECT soma_salarios FROM Soma_Salarios
	WHERE soma_salarios = (SELECT max(soma_salarios) FROM Soma_Salarios)

-- Exercício E
CREATE VIEW Funcionarios_sem_dependentes AS
	SELECT tbFuncionario.nomeFuncionario as nome_funcionarios, tbDepartamento.nomeDepartamento nome_departamento FROM tbFuncionario
		INNER JOIN tbDepartamento ON tbFuncionario.codDepartamento = tbDepartamento.codDepartamento

	WHERE tbFuncionario.codFuncionario NOT IN (SELECT codFuncionario FROM tbDependente)

-- Exercício F
CREATE VIEW Dependentes_por_Funcionario AS 
	SELECT nomeFuncionario, COUNT(codDependente) AS quantidade_dependentes FROM tbDependente
		INNER JOIN tbFuncionario ON tbFuncionario.codFuncionario = tbDependente.codFuncionario

	GROUP BY tbFuncionario.nomeFuncionario

-- Exercício G
SELECT nomeFuncionario FROM Dependentes_por_Funcionario
	WHERE quantidade_dependentes = (SELECT max(quantidade_dependentes) FROM Dependentes_por_Funcionario)

-- Exercício H
CREATE VIEW Quantidade_por_Departamento AS
	SELECT nomeDepartamento, COUNT(tbDependente.codDependente) as quantidade_dependentes FROM tbDepartamento
			INNER JOIN tbFuncionario ON  tbFuncionario.codDepartamento = tbDepartamento.codDepartamento
			INNER JOIN tbDependente ON tbFuncionario.codFuncionario = tbDependente.codFuncionario

	GROUP BY tbDepartamento.nomeDepartamento

-- Exercício I
SELECT SUM(quantidade_dependentes) FROM Quantidade_por_Departamento
.