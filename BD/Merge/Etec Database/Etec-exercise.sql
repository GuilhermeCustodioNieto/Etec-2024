-- CREATES do banco de dados e das tabelas
CREATE DATABASE db_etec

USE db_etec

CREATE TABLE tb2A (
	RM INT NOT NULL, 
	nomeAluno VARCHAR(255) NOT NULL,
	statusAluno VARCHAR (9) NOT NULL,

	PRIMARY KEY(RM),
)

CREATE TABLE tb2B (
	RM INT NOT NULL, 
	nomeAluno VARCHAR(255) NOT NULL,
	statusAluno VARCHAR (9) NOT NULL,

	PRIMARY KEY(RM),
)



CREATE TABLE tb3A (
	RM INT NOT NULL, 
	nomeAluno VARCHAR(255) NOT NULL,
	statusAluno VARCHAR (9) NOT NULL,

	PRIMARY KEY(RM),
)

-- Inserção dos dados para teste
INSERT INTO tb2A (RM, nomeAluno, statusAluno) VALUES
(642305, 'Lucas Silva', 'APROVADO'),
(619080, 'Mariana Souza', 'REPROVADO'),
(609432, 'Pedro Oliveira', 'APROVADO'),
(619208, 'Ana Clara Mendes', 'APROVADO'),
(645707, 'João Almeida', 'REPROVADO'),
(605752, 'Beatriz Santos', 'APROVADO'),
(626120, 'Gabriel Costa', 'APROVADO'),
(656919, 'Lara Ferreira', 'REPROVADO'),
(636394, 'Mateus Rocha', 'APROVADO'),
(638703, 'Sofia Martins', 'APROVADO');

INSERT INTO tb2B (RM, nomeAluno, statusAluno) VALUES
(639954, 'Rafael Lima', 'APROVADO'),
(676246, 'Carolina Ribeiro', 'APROVADO'),
(667139, 'Felipe Gomes', 'REPROVADO'),
(667138, 'Isabela Duarte', 'APROVADO'),
(665052, 'Ricardo Batista', 'APROVADO'),
(662462, 'Vitória Silva', 'REPROVADO'),
(667157, 'Leonardo Azevedo', 'APROVADO'),
(633848, 'Manuela Teixeira', 'APROVADO'),
(652037, 'Hugo Carvalho', 'REPROVADO'),
(639654, 'Camila Pinto', 'APROVADO');

-- Teste
MERGE tb3A dest
	USING (SELECT RM, nomeAluno, statusAluno FROM tb2A WHERE statusAluno = 'APROVADO') AS ori
	ON ori.RM = dest.RM
	WHEN NOT MATCHED THEN
		INSERT VALUES (ori.RM, ori.nomeAluno, ori.statusAluno)
	WHEN MATCHED THEN 
		UPDATE SET dest.RM = ori.RM, dest.nomeAluno = ori.nomeAluno, dest.statusAluno = ori.statusAluno;

MERGE tb3A dest
	USING (SELECT RM, nomeAluno, statusAluno FROM tb2B WHERE statusAluno = 'APROVADO') AS ori
	ON ori.RM = dest.RM
	WHEN NOT MATCHED THEN
		INSERT VALUES (ori.RM, ori.nomeAluno, ori.statusAluno)
	WHEN MATCHED THEN 
		UPDATE SET dest.RM = ori.RM, dest.nomeAluno = ori.nomeAluno, dest.statusAluno = ori.statusAluno;


SELECT * FROM tb3A

