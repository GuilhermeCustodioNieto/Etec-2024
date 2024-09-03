CREATE DATABASE dbStore

USE dbStore

CREATE TABLE tbCategoriaProduto(
	codCategoriaProduto INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nomeCategoriaProduto VARCHAR(255) NOT NULL,
)


CREATE TABLE tbProduto(
	codProduto INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nomeProduto VARCHAR(255) NOT NULL,
	precoKiloProduto FLOAT NOT NULL,
	codCategoriaProduto INT NOT NULL,

	FOREIGN KEY (codCategoriaProduto) REFERENCES tbCategoriaProduto(codCategoriaProduto)
)

CREATE TABLE tbCliente(
	codCliente INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	nomeCliente VARCHAR(255) NOT NULL,
	dataNascimentoCliente DATE NOT NULL,
	ruaCliente VARCHAR(255) NOT NULL,
	numCasaCliente INT NOT NULL,
	cepCliente VARCHAR(9) NOT NULL,
	bairroCliente VARCHAR(255) NOT NULL,
	cidadeCliente VARCHAR(255) NOT NULL,
	estadoCliente VARCHAR(255) NOT NULL,
	cpfCliente VARCHAR(255) NOT NULL,
	sexoCliente VARCHAR(2) NOT NULL,
)

CREATE TABLE tbEncomenda(
	codEncomenda INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	dataEncomenda DATE NOT NULL,
	codCliente INT NOT NULL,
	valorTotalEncomenda FLOAT NOT NULL,
	dataEntregaEncomenda DATE NOT NULL,

	FOREIGN KEY (codCliente) REFERENCES tbCliente(codCliente)
)

CREATE TABLE tbItensEncomenda(
	codItensEncomenda INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	codEncomenda INT NOT NULL,
	codProduto INT NOT NULL,
	quantidadeKilos FLOAT NOT NULL,
	subTotal FLOAT NOT NULL,

	FOREIGN KEY (codEncomenda) REFERENCES tbEncomenda(codEncomenda),
	FOREIGN KEY (codProduto) REFERENCES tbProduto(codProduto),
)