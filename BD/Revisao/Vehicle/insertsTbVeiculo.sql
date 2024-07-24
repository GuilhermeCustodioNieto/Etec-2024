USE bdTransito

-- Inserts tbMotorista
INSERT INTO tbMotorista (nomeMotorista, dataNascimentoMotorista, cpfMotorista, CNHMotorista, pontuacaoAcumulada)
	VALUES 
	('João da Silva', '1985-03-15', '123.456.789-00', '123456789', 10),
	('Maria Souza', '1990-07-25', '987.654.321-00', '987654321', 5),
	('Pedro Oliveira', '1988-11-10', '456.789.123-00', '456789123', 8);



-- Inserts tbVeiculo
INSERT INTO tbVeiculo (modeloVeiculo, placa, renavam, anoVeiculo, idMotorista)
	VALUES 
	('Gol', 'ABC-1234', 123456789, 2018, 1), 
	('Onix', 'XYZ-5678', 987654321, 2020, 2),
	('Corolla', 'DEF-9876', 456789123, 2019, 3);

-- Inserts tbMultas
INSERT INTO tbMultas (dataMulta, horaMulta, pontosMulta, idVeiculo)
	VALUES ('2023-05-10', '14:30:00', 5, 1),  
	('2023-06-20', '10:45:00', 3, 2), 
	('2023-07-15', '16:00:00', 4, 3);
