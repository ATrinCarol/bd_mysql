/*
Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará com as informações dos estudantes deste registro dessa escola. 
Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 atributos relevantes dos estudantes para se trabalhar
com o serviço dessa escola. 
Insira nesta tabela no mínimo 8 dados (registros).
Faça um SELECT que retorne todes o/a(s) estudantes com a nota maior do que 7.0.
Faça um SELECT que retorne todes o/a(s) estudantes com a nota menor do que 7.0.
Ao término atualize um registro desta tabela através de uma query de atualização.
*/

create database db_escola;

use db_escola;

create table tb_estudantes(
id bigint auto_increment,
nome varchar (100) NOT NULL,
idade int (2) NOT NULL, -- 99
serie int (1) NOT NULL,
turma varchar (1),
notas decimal (3,2) NOT NULL,
recuperacao boolean,
PRIMARY KEY (id)
);

INSERT INTO tb_estudantes(nome, idade, serie, turma, notas, recuperacao)
VALUE ("Pedro Paulo Soares Pereira", 9, 3, "A", 9.9, false);
INSERT INTO tb_estudantes(nome, idade, serie, turma, notas, recuperacao)
VALUE ("Paulo Eduardo Salvador", 14, 8, "C", 9.8, false);
INSERT INTO tb_estudantes(nome, idade, serie, turma, notas, recuperacao)
VALUE ("Edivaldo Pereira Alves", 11, 5, "D", 7.9, false);
INSERT INTO tb_estudantes(nome, idade, serie, turma, notas, recuperacao)
VALUE ("Kleber Geraldo Lelis Simões", 8, 2, "B", 8.0, false);
INSERT INTO tb_estudantes(nome, idade, serie, turma, notas, recuperacao)
VALUE ("Eduardo Taddeo", 10, 4, "C", 9.9, false);
INSERT INTO tb_estudantes(nome, idade, serie, turma, notas, recuperacao)
VALUE ("Washington Roberto Santana", 12, 6, "B", 7.8, false);
INSERT INTO tb_estudantes(nome, idade, serie, turma, notas, recuperacao)
VALUE ("Reinaldo Aguiar", 13, 7, "C", 9.9, false);
INSERT INTO tb_estudantes(nome, idade, serie, turma, notas, recuperacao)
VALUE ("Moyses Rodrigues", 14, 8, "A", 3.4, true);
INSERT INTO tb_estudantes(nome, idade, serie, turma, notas, recuperacao)
VALUE ("Daniel Korn", 11, 5, "B", 1.7, true);
INSERT INTO tb_estudantes(nome, idade, serie, turma, notas, recuperacao)
VALUE ("Alex Barbosa", 15, 9, "D", 4.5, true);

SELECT * FROM tb_estudantes;

SELECT * FROM tb_estudantes WHERE notas > 7.0;
SELECT * FROM tb_estudantes WHERE notas < 7.0;

UPDATE tb_estudantes SET notas = 6.9 WHERE id = 10;
UPDATE tb_estudantes SET recuperacao = false WHERE id = 10;




