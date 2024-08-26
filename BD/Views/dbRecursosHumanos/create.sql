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