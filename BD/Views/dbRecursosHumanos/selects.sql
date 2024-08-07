USE bdRecursosHumanos;

-- Exercício A
CREATE VIEW Funcionarios_Departamento AS
SELECT 
    tbDepartamento.nomeDepartamento, 
    COUNT(tbFuncionario.codFuncionario) AS quantidade_funcionarios 
FROM 
    tbDepartamento
INNER JOIN 
    tbFuncionario ON tbFuncionario.codDepartamento = tbDepartamento.codDepartamento
GROUP BY 
    tbDepartamento.nomeDepartamento;

-- Exercício B
SELECT TOP 1 nomeDepartamento 
	FROM Funcionarios_Departamento 
		ORDER BY quantidade_funcionarios ASC;

-- Exercício C
CREATE VIEW Soma_Salarios AS
SELECT 
    tbDepartamento.nomeDepartamento, 
    SUM(tbFuncionario.salarioFuncionario) AS soma_salarios 
FROM 
    tbFuncionario
INNER JOIN 
    tbDepartamento ON tbFuncionario.codDepartamento = tbDepartamento.codDepartamento
GROUP BY 
    tbDepartamento.nomeDepartamento;

-- Exercício D
SELECT TOP 1 nomeDepartamento, soma_salarios 
	FROM Soma_Salarios
	ORDER BY soma_salarios DESC;

-- Exercício E
CREATE VIEW Funcionarios_sem_dependentes AS
SELECT 
    tbFuncionario.nomeFuncionario AS nome_funcionarios, 
    tbDepartamento.nomeDepartamento AS nome_departamento 
FROM 
    tbFuncionario
INNER JOIN 
    tbDepartamento ON tbFuncionario.codDepartamento = tbDepartamento.codDepartamento
WHERE 
    tbFuncionario.codFuncionario NOT IN (SELECT codFuncionario FROM tbDependente);

-- Exercício F
CREATE VIEW Dependentes_por_Funcionario AS 
SELECT 
    tbFuncionario.nomeFuncionario, 
    COUNT(tbDependente.codDependente) AS quantidade_dependentes 
FROM 
    tbDependente
INNER JOIN 
    tbFuncionario ON tbFuncionario.codFuncionario = tbDependente.codFuncionario
GROUP BY 
    tbFuncionario.nomeFuncionario;

-- Exercício G
SELECT TOP 1 nomeFuncionario 
FROM Dependentes_por_Funcionario
ORDER BY quantidade_dependentes DESC;

-- Exercício H
CREATE VIEW Quantidade_por_Departamento AS
SELECT 
    tbDepartamento.nomeDepartamento, 
    COUNT(tbDependente.codDependente) AS quantidade_dependentes 
FROM 
    tbDepartamento
INNER JOIN 
    tbFuncionario ON tbFuncionario.codDepartamento = tbDepartamento.codDepartamento
INNER JOIN 
    tbDependente ON tbFuncionario.codFuncionario = tbDependente.codFuncionario
GROUP BY 
    tbDepartamento.nomeDepartamento;

-- Exercício I
SELECT SUM(quantidade_dependentes) AS soma_geral_dependentes 
FROM Quantidade_por_Departamento;
