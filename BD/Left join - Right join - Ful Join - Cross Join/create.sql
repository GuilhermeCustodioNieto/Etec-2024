CREATE DATABASE dbLivariaBrasileira

USE dbLivariaBrasileira
CREATE TABLE tbAutor(
    codAautor INT NOT NULL IDENTITY(1,1),
    nomeAutor VARCHAR(255) NOT NULL,

    PRIMARY KEY(codAautor)
)

CREATE TABLE tbGenero(
    codGenero INT NOT NULL IDENTITY(1,1),
    nomeGenero VARCHAR(255) NOT NULL,

    PRIMARY KEY(codGenero)
)

CREATE TABLE tbEditora(
    codEditora INT NOT NULL IDENTITY(1,1),
    nomeEditora VARCHAR(255) NOT NULL,

    PRIMARY KEY(codEditora)
)

CREATE TABLE tbLivro(
    codLivro INT NOT NULL IDENTITY(1,1),
    nomeLivro VARCHAR(255) NOT NULL,
    numPaginas INT NOT NULL,
    codGenero INT NOT NULL,
    codAutor INT NOT NULL,
    codEditora INT NOT NULL,

    PRIMARY KEY(codLivro)
    
)