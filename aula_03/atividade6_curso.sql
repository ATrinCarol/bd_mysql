CREATE DATABASE db_curso_da_minha_vida;

USE db_curso_da_minha_vida;

CREATE TABLE tb_categorias(
id bigint auto_increment,
linguagem varchar (255),
dificuldade varchar (255),
PRIMARY KEY (id)
);

INSERT INTO tb_categorias (linguagem, dificuldade)
VALUES ("Java","Iniciante"), -- FK1
("Java","Intermediário"), -- FK2
("Java","Avançado"), -- FK3
("Python","Iniciante"), -- FK4
("Python","Intermediário"), -- FK5
("Python","Avançado"); -- FK6

CREATE TABLE tb_produtos(
id bigint auto_increment,
nome varchar (255),
preco decimal (7,2),
situacao varchar (10),
prof varchar (255),
fk_categorias_id bigint,
PRIMARY KEY (id),
FOREIGN KEY (fk_categorias_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos (nome, preco, situacao, prof, fk_categorias_id)
VALUES ("Desenvolvimento Web", 450.00, "Ativo", "Rafael", 2),
("Desenvolvimento Mobile", 450.00, "Ativo", "Fernanda", 3),
("Back End", 680.00, "Ativo", "Camis", 3),
("Front End", 680.00, "Ativo", "Leo", 3),
("Desenvolvimento Web", 600.00, "Inativo", "", 6),
("Desenvolvimento Mobile", 400.00, "Inativo", "", 4),
("Back End", 300, "Ativo", "Caroline", 1),
("Front End", 300, "Ativo", "Carol", 1),
("Desenvolvimento Full Stack Web e Mobile", 4000.00, "Ativo", "Anderson", 3);

SELECT * FROM tb_produtos WHERE preco > 500;

SELECT * FROM tb_produtos WHERE preco BETWEEN 600 AND 1000;

SELECT * FROM tb_produtos WHERE nome LIKE "%J%";

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.fk_categorias_id = tb_categorias.id;

SELECT tb_produtos.nome, tb_produtos.prof, tb_categorias.linguagem, tb_categorias.dificuldade FROM
tb_produtos INNER JOIN tb_categorias ON tb_produtos.fk_categorias_id = tb_categorias.id
WHERE linguagem = "Java";


