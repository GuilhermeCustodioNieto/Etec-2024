CREATE DATABASE dbEscola

USE dbEscola
CREATE TABLE tbAluno (
    codAluno INT IDENTITY(1,1) NOT NULL,
    nomeAluno VARCHAR(255) NOT NULL,
    dataNascAluno SMALLDATETIME NOT NULL,
    rgAluno VARCHAR(255) NOT NULL,
    naturalidadeAluno VARCHAR(255) NOT NULL

    PRIMARY KEY(codAluno)
)

CREATE TABLE tbCurso(
    codCurso INT IDENTITY(1,1) NOT NULL,
    nomeCurso VARCHAR(255) NOT NULL,
    cargaHorariaCurso INT NOT NULL,
    valorCurso FLOAT NOT NULL,

    PRIMARY KEY(codCurso)
)

CREATE TABLE tbTurma(
    codTurma INT IDENTITY(1,1) NOT NULL,
    nomeTurma VARCHAR(255) NOT NULL,
    codCurso INT NOT NULL,
    horarioTurma SMALLDATETIME NOT NULL,

    PRIMARY KEY(codTurma)
)

CREATE TABLE tbMatricula(
    codMatrcula INT IDENTITY(1,1) NOT NULL,
    dataMatricula SMALLDATETIME NOT NULL,
    codAluno INT NOT NULL,
    codTurma INT NOT NULL,


    PRIMARY KEY(codMatrcula)
)