USE bdTransito

-- Inserts tbMotorista
INSERT INTO tbMotorista (nomeMotorista, dataNascimentoMotorista, cpfMotorista, CNHMotorista, pontuacaoAcumulada)
VALUES 
('João Silva', '1985-04-12', '123.456.789-00', 'ABC123456', 12),
('Maria Fernandes', '1990-07-19', '234.567.890-01', 'DEF234567', 5),
('Carlos Souza', '1975-03-08', '345.678.901-02', 'GHI345678', 8),
('Ana Oliveira', '2000-01-20', '456.789.012-03', 'JKL456789', 3),
('Lucas Pereira', '1988-11-25', '567.890.123-04', 'MNO567890', 15),
('Mariana Costa', '1995-06-30', '678.901.234-05', 'PQR678901', 0),
('Paulo Santos', '1982-09-17', '789.012.345-06', 'STU789012', 20),
('Beatriz Almeida', '1993-05-05', '890.123.456-07', 'VWX890123', 2),
('Rafael Lima', '1997-08-23', '901.234.567-08', 'YZA901234', 7),
('Juliana Ribeiro', '1980-12-15', '012.345.678-09', 'BCD012345', 18);

-- Inserts tbVeiculo
INSERT INTO tbVeiculo (modeloVeiculo, placa, renavam, anoVeiculo, idMotorista)
VALUES 
('Ford Ka', 'ABC1234', 123456789, 2010, 1),
('Fiat Uno', 'DEF5678', 234567890, 2012, 2),
('Volkswagen Gol', 'GHI9123', 345678901, 2008, 3),
('Chevrolet Onix', 'JKL4567', 456789012, 2015, 4),
('Hyundai HB20', 'MNO8912', 567890123, 2019, 5),
('Renault Sandero', 'PQR3456', 678901234, 2011, 6),
('Toyota Corolla', 'STU7890', 789012345, 2016, 7),
('Honda Civic', 'VWX1234', 890123456, 2005, 8),
('Chevrolet Prisma', 'YZA5678', 901234567, 2018, 9),
('Ford Fiesta', 'BCD0123', 012345678, 2007, 10);

-- Inserts tbMultas
INSERT INTO tbMultas (dataMulta, horaMulta, pontosMulta, idVeiculo)
VALUES 
('2023-01-10', '14:30:00', 4, 1),
('2022-11-15', '09:00:00', 3, 2),
('2021-05-22', '16:45:00', 2, 3),
('2020-07-18', '12:20:00', 5, 4),
('2019-03-05', '10:10:00', 1, 5),
('2018-08-30', '08:30:00', 6, 6),
('2017-12-25', '14:00:00', 4, 7),
('2016-02-14', '19:00:00', 3, 8),
('2015-06-20', '11:15:00', 5, 9),
('2014-10-11', '13:50:00', 2, 10);
