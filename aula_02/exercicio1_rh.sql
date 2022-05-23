/*Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema trabalhará com as informações dos colaboradores desta empresa.
Crie uma tabela de colaboradores e determine 5 atributos relevantes dos colaboradores para se trabalhar com o serviço deste RH.
Insira nesta tabela no mínimo 5 dados (registros).
Faça um SELECT que retorne todes os colaboradores com o salário maior do que 2000.
Faça um SELECT que retorne todes os colaboradores com o salário menor do que 2000.
Ao término atualize um registro desta tabela através de uma query de atualização.*/

CREATE DATABASE db_rh;

USE db_rh;	

CREATE TABLE tb_colaboradores(
id BIGINT AUTO_INCREMENT,
nome VARCHAR (255) NOT NULL,
idade INT,
setor VARCHAR (255) NOT NULL,
cargo VARCHAR (255),
salario DECIMAL (7, 2) NOT NULL,
sttaus_ferias BOOLEAN,
PRIMARY KEY (id)
);

ALTER TABLE tb_colaboradores CHANGE sttaus_ferias status_ferias VARCHAR (255);

INSERT INTO tb_colaboradores (nome, idade, setor, cargo, salario, status_ferias) 
VALUES ("Maria", 60, "Administração", "Diretora", 15350.00, true);

INSERT INTO tb_colaboradores (nome, idade, setor, cargo, salario, status_ferias) 
VALUES ("Denise", 52, "Recursos Humanos", "Coordenadora", 11890.69, false);

INSERT INTO tb_colaboradores (nome, idade, setor, cargo, salario, status_ferias) 
VALUES ("Alexandre", 49, "Comercial", "Superintendente", 11890.10, false);

INSERT INTO tb_colaboradores (nome, idade, setor, cargo, salario, status_ferias) 
VALUES ("Karin", 24, "TI", "Diretora", 13000.00, false);

INSERT INTO tb_colaboradores (nome, idade, setor, cargo, salario, status_ferias) 
VALUES ("Wellton", 33, "Financeiro", "Diretor", 12750.17, true);

UPDATE tb_colaboradores SET salario = 1999.00 WHERE id =1;

SELECT * from tb_colaboradores;

SELECT * FROM tb_colaboradores WHERE salario > 2000;

SELECT * FROM tb_colaboradores WHERE salario < 2000;

UPDATE tb_colaboradores SET salario = 10910.69 WHERE id =1;

SELECT * FROM tb_colaboradores;



