CREATE DATABASE db_estoque

USE db_estoque

CREATE TABLE tblFabricante (
    codFabricante INTEGER NOT NULL IDENTITY(1,1),
    nomeFabricante VARCHAR(255) NOT NULL,

    PRIMARY KEY(codFabricante)
)

CREATE TABLE tblFornecedor (
    codFornecedor INTEGER NOT NULL IDENTITY(1,1),
    nomeFornecedor VARCHAR(255) NOT NULL,
    contatoFornecedor VARCHAR(255) NOT NULL,

    PRIMARY KEY(codFornecedor)
)

CREATE TABLE tblProduto (
    codProduto INTEGER NOT NULL IDENTITY(1,1),
    descricaoProduto VARCHAR (255) NOT NULL,
    valorProduto FLOAT NOT NULL,
    quantidadeProduto INTEGER NOT NULL,
    codFabricante INTEGER NOT NULL,
    codFornecedor INTEGER NOT NULL,

    FOREIGN KEY (codFabricante) REFERENCES tblFabricante(codFabricante),
    FOREIGN KEY (codFornecedor) REFERENCES tblFornecedor(codFornecedor),

    PRIMARY KEY(codProduto)
)

CREATE TABLE tblCliente (
    codCliente INTEGER NOT NULL IDENTITY(1,1),
    nomeCliente VARCHAR(255) NOT NULL,
    cpfCliente VARCHAR(255) NOT NULL,
    emailCliente VARCHAR(255) NOT NULL,
    sexoCliente VARCHAR(1) NOT NULL,
    dataNascimentoCliente DATE NOT NULL,

    PRIMARY KEY(codCliente)
)

CREATE TABLE tblVenda( 
    codVenda INTEGER NOT NULL IDENTITY(1,1),
    dataVenda DATETIME NOT NULL,
    valorTotalVenda FLOAT NOT NULL,
    codCliente INTEGER NOT NULL,

    FOREIGN KEY (codCliente) REFERENCES tblCliente(codCliente),

    PRIMARY KEY(codVenda)
)

CREATE TABLE tblItensVenda (
    codItensVenda INTEGER NOT NULL IDENTITY(1,1),

    codVenda INTEGER NOT NULL,
    codProduto INTEGER NOT NULL,
    quantidadeitensVenda INTEGER NOT NULL,
    subTotalItensvenda FLOAT NOT NULL,

    FOREIGN KEY (codVenda) REFERENCES tblVenda(codVenda),
    FOREIGN KEY (codProduto) REFERENCES tblProduto(codProduto),

    PRIMARY KEY(codItensVenda)
)

CREATE TABLE tbSaidaProduto(
	codSaidaProduto INT NOT NULL,
	dataSaidaProduto DATETIME NOT NULL,
	codProduto INT NOT NULL,
	quantidadeSaidaProduto INT NOT NULL,

	FOREIGN KEY (codProduto) REFERENCES tblProduto(codProduto),
	PRIMARY KEY (codSaidaProduto)
)


CREATE TABLE tbEntradaProduto(
	codEntrada INT NOT NULL,
	dataSaidaProduto DATETIME NOT NULL,
	codProduto INT NOT NULL,
	quantidadeEntradaProduto INT NOT NULL,

	FOREIGN KEY (codProduto) REFERENCES tblProduto(codProduto),
	PRIMARY KEY (codEntrada)
)



DROP DATABASE db_estoque