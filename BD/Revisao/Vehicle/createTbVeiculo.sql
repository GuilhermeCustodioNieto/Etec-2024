create database bdTransito

USE bdTransito

CREATE TABLE tbMotorista(
	idMotorista INT IDENTITY(1,1) NOT NULL,
	nomeMotorista VARCHAR(255) NOT NULL,
	dataNascimentoMotorista date NOT NULL,
	cpfMotorista VARCHAR(15) NOT NULL,
	CNHMotorista VARCHAR(15) NOT NULL,
	pontuacaoAcumulada INT NOT NULL,

	PRIMARY KEY (idMotorista)
)

CREATE TABLE tbVeiculo(
	idVeiculo INT NOT NULL IDENTITY(1,1),
	modeloVeiculo VARCHAR(255) NOT NULL,
	placa VARCHAR(255) NOT NULL,
	renavam INT NOT NULL,
	anoVeiculo INT NOT NULL,
	idMotorista INT NOT NULL FOREIGN KEY REFERENCES tbMotorista(idMotorista),

	PRIMARY KEY(idVeiculo),

)

CREATE TABLE tbMultas(
	idMulta INT NOT NULL IDENTITY(1,1),
	dataMulta DATE NOT NULL,
	horaMulta time NOT NULL,
	pontosMulta INT NOT NULL,
	idVeiculo INT NOT NULL FOREIGN KEY REFERENCES tbVeiculo(idVeiculo),	

	PRIMARY KEY(idMulta),
	
)

SELECT * FROM tbMotorista
SELECT * FROM tbVeiculo
SELECT * FROM tbMultas

DROP TABLE tbVeiculo
DROP TABLE tbMotorista
DROP TABLE tbMultas