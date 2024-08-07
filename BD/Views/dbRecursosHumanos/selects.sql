USE bdRecursosHumanos;

-- Exerc�cio A: Criar uma view para exibir a quantidade de funcion�rios por nome de departamento
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

-- Exerc�cio B: Exibir somente o nome do departamento que possui o menor n�mero de funcion�rios
SELECT TOP 1 nomeDepartamento 
FROM Funcionarios_Departamento 
ORDER BY quantidade_funcionarios ASC;

-- Exerc�cio C: Criar uma view para exibir a soma dos sal�rios por nome de departamento
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

-- Exerc�cio D: Mostrar somente a maior soma dentre os departamentos
SELECT TOP 1 nomeDepartamento, soma_salarios 
FROM Soma_Salarios
ORDER BY soma_salarios DESC;

-- Exerc�cio E: Criar uma view para exibir somente o nome dos funcion�rios e o nome dos departamentos daqueles funcion�rios que n�o possuem dependentes
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

-- Exerc�cio F: Criar uma view que exiba a quantidade de dependentes por nome de funcion�rio
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

-- Exerc�cio G: Mostrar somente o nome do funcion�rio que possui mais dependentes
SELECT TOP 1 nomeFuncionario 
FROM Dependentes_por_Funcionario
ORDER BY quantidade_dependentes DESC;

-- Exerc�cio H: Criar uma view para exibir a quantidade de dependentes por departamento
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

-- Exerc�cio I: Apresentar a soma geral dos dependentes por departamento
SELECT SUM(quantidade_dependentes) AS soma_geral_dependentes 
FROM Quantidade_por_Departamento;
