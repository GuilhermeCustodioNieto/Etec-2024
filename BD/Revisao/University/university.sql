CREATE DATABASE University

/* ENTIDADES FORTES */
CREATE TABLE Professor(
    id INTEGER IDENTITY(1,1) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    RG INTEGER NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    numeroEndereco INTEGER NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numRua INTEGER NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    estado VARCHAR(50) NOT NULL,

    PRIMARY KEY(id)
)

CREATE TABLE Disciplina(
    id INTEGER IDENTITY(1,1),
    nomeDisciplina VARCHAR(255) NOT NULL,

    PRIMARY KEY(id)
)



CREATE TABLE Aluno(
    id  INTEGER IDENTITY(1,1) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    RG INTEGER NOT NULL,
    CPF VARCHAR(11) NOT NULL,
    numeroEndereco INTEGER NOT NULL,
    rua VARCHAR(255) NOT NULL,
    numRua INTEGER NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL,
    estado VARCHAR(50) NOT NULL,

    PRIMARY KEY(id)
)

CREATE TABLE Curso(
    id INTEGER IDENTITY(1,1) NOT NULL,
    nomeCurso VARCHAR(255) NOT NULL,

    PRIMARY KEY(id)
)

/* ENTIDADES FRACAS */

CREATE TABLE Campi(
    id INTEGER IDENTITY(1,1) NOT NULL,
    idCurso INTEGER NOT NULL,
    nomeCampi VARCHAR(255) NOT NULL,

    PRIMARY KEY(id)
)

CREATE TABLE Turma(
    id INTEGER IDENTITY(1,1) NOT NULL,
    anoFormacao DATE NOT NULL,
    numeroSala INTEGER NOT NULL,
    idCurso INTEGER NOT NULL,
    idAlunos INTEGER NOT NULL,

    FOREIGN KEY(idCurso) REFERENCES Curso(id),
    FOREIGN KEY(idAlunos) REFERENCES Aluno(id),

    PRIMARY KEY(id)
)

CREATE TABLE ConteudoCurso(
    id INTEGER IDENTITY(1,1) NOT NULL,
    idCurso INTEGER NOT NULL,
    idDisciplina INTEGER NOT NULL,

    FOREIGN KEY(idCurso) REFERENCES Curso(id),
    FOREIGN KEY(idDisciplina) REFERENCES Disciplina(id),

    PRIMARY KEY(id)
)

CREATE TABLE PlanejamentoAula(
    id INTEGER IDENTITY(1,1) NOT NULL,
    idAluno INTEGER NOT NULL,
    idProfessor INTEGER NOT NULL,

    FOREIGN KEY (idAluno) REFERENCES Aluno(id),
    FOREIGN KEY (idProfessor) REFERENCES Professor(id),

    PRIMARY KEY(id)
)



SELECT * FROM Professor
SELECT * FROM Disciplina
SELECT * FROM PlanejamentoAula
SELECT * FROM Professor
SELECT * FROM Aluno
SELECT * FROM Curso
SELECT * FROM Aluno
SELECT * FROM Turma
SELECT * FROM ConteudoCurso

