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
SELECT nomeMotorista AS 'Motoristas com má pontuação' FROM tbMotorista
	WHERE pontuacaoAcumulada > 10

-- E
SELECT SUM(pontuacaoAcumulada) AS 'Somatória má pontuação' FROM tbMotorista

-- F
SELECT AVG(pontuacaoAcumulada) AS 'Média má pontuação' FROM tbMotorista

-- G
SELECT COUNT (idVeiculo) FROM tbVeiculo
	WHERE idMotorista = 1

-- H
SELECT COUNT (idVeiculo) FROM tbVeiculo
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
