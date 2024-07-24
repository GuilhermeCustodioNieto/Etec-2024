USE bdTransito

-- A
SELECT COUNT(idMotorista) AS 'Quantidade_Motoristas' FROM tbMotorista

-- B
SELECT nomeMotorista AS 'Motoristas com Silva' FROM tbMotorista
	WHERE nomeMotorista LIKE '%Silva'

-- C
SELECT COUNT(idMotorista) AS 'Quantidade Motoristas de 2000' FROM tbMotorista
	WHERE YEAR(dataNascimentoMotorista) = 2000

-- D
SELECT nomeMotorista AS 'Motoristas com m� pontua��o' FROM tbMotorista
	WHERE pontuacaoAcumulada > 10

-- E
SELECT SUM(pontuacaoAcumulada) AS 'Somatoria pontua��o' FROM tbMotorista

-- F
SELECT AVG(pontuacaoAcumulada) AS 'M�dia m� pontua��o' FROM tbMotorista

-- G
SELECT COUNT (idVeiculo) FROM tbVeiculo
	WHERE idMotorista = 1

-- H
SELECT COUNT (idVeiculo)  FROM tbVeiculo
	WHERE SUBSTRING(CAST(placa AS VARCHAR), 1, 1) = 'A'

-- I
SELECT COUNT(idVeiculo) FROM tbVeiculo
	WHERE anoVeiculo <= YEAR(GETDATE()) - 10

-- J
SELECT AVG(idVeiculo) FROM tbVeiculo
	WHERE anoVeiculo <= YEAR(GETDATE()) - 10

-- K
SELECT COUNT (idVeiculo) FROM tbVeiculo
	WHERE modeloVeiculo LIKE '%Sedan'

-- L
SELECT SUM (pontosMulta) FROM tbMulta
	WHERE idVeiculo = 2

-- M
SELECT AVG (pontosMulta) FROM tbMulta

-- N
SELECT COUNT (idMulta) FROM tbMulta
	WHERE YEAR(dataMulta) = 2018 AND MONTH(dataMulta) = 04

-- O
SELECT COUNT(idVeiculo) AS 'Placa finalizada or 1/2' FROM tbVeiculo
	WHERE RIGHT(placa, 1) = '1' OR RIGHT(placa, 1) = '2'

-- P
SELECT COUNT(idVeiculo) AS 'Placa finalizada or 3/4' FROM tbVeiculo
	WHERE RIGHT(placa, 1) = '3' OR RIGHT(placa, 1) = '4'

-- Q
SELECT COUNT(idVeiculo) AS 'Placa finalizada or 5/6' FROM tbVeiculo
	WHERE RIGHT(placa, 1) = '5' OR RIGHT(placa, 1) = '6'

-- R
SELECT COUNT(idVeiculo) AS 'Placa finalizada or 7/8' FROM tbVeiculo
	WHERE RIGHT(placa, 1) = '7' OR RIGHT(placa, 1) = '8'

-- S
SELECT COUNT(idVeiculo) AS 'Placa finalizada or 9/0' FROM tbVeiculo
	WHERE RIGHT(placa, 1) = '9' OR RIGHT(placa, 1) = '0'

-- T
SELECT anoVeiculo, COUNT(idVeiculo) AS 'quant. veiculos por ano' FROM tbVeiculo
	GROUP By anoVeiculo


-- U
SELECT pontuacaoAcumulada, COUNT(idMotorista) AS 'quant. motoristas por pontuacao' FROM tbMotorista
	GROUP By pontuacaoAcumulada

-- V
SELECT COUNT(idMotorista) AS 'quant. motoristas + 20 pontos' FROM tbMotorista
	WHERE pontuacaoAcumulada > 20

	GROUP By pontuacaoAcumulada

-- W
SELECT AVG(idMotorista) AS 'quant. motoristas por pontuacao' FROM tbMotorista
	WHERE YEAR(dataNascimentoMotorista) = 2000

-- X
SELECT AVG(pontosMulta) AS 'Media multas' FROM tbMultas
	WHERE YEAR(dataMulta) = 2017

-- Y
SELECT COUNT(idVeiculo) AS 'Proibido circular segunda-feira' FROM tbVeiculo
	WHERE RIGHT(placa, 1) = '1' OR RIGHT(placa, 1) = '2'

