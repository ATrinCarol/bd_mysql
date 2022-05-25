CREATE DATABASE db_pizzaria_legal;

USE db_pizzaria_legal;

CREATE TABLE tb_categorias(
id bigint auto_increment,
sabor varchar (10) not null,
quantidade_pedacos int,
PRIMARY KEY (id)
);

INSERT INTO tb_categorias (sabor, quantidade_pedacos) -- FK 1
VALUES ("Salgada", 8);

INSERT INTO tb_categorias (sabor, quantidade_pedacos) -- FK 2
VALUES ("Salgada", 4);

INSERT INTO tb_categorias (sabor, quantidade_pedacos) -- FK 3
VALUES ("Doce", 8);

INSERT INTO tb_categorias (sabor, quantidade_pedacos) -- FK 4
VALUES ("Doce", 4);

INSERT INTO tb_categorias (sabor, quantidade_pedacos) -- FK 5
VALUES ("MeioMeio", 8);

INSERT INTO tb_categorias (sabor, quantidade_pedacos) -- FK 6
VALUES ("MeioMeio", 4); 

CREATE TABLE tb_pizzas(
id bigint auto_increment,
nome varchar (255) not null,
valor decimal (4, 2) not null,
com_azeitona boolean,
com_borda_recheada boolean,
fk_categorias_id bigint,
PRIMARY KEY (id),
FOREIGN KEY (fk_categorias_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_pizzas (nome, valor, com_azeitona, com_borda_recheada, fk_categorias_id)
VALUES ("Mussarela", 59.99, true, false, 1);

INSERT INTO tb_pizzas (nome, valor, com_azeitona, com_borda_recheada, fk_categorias_id)
VALUES ("Calabresa", 44.99, true, false, 2);

INSERT INTO tb_pizzas (nome, valor, com_azeitona, com_borda_recheada, fk_categorias_id)
VALUES ("Mussarela", 44.99, true, false, 2);

INSERT INTO tb_pizzas (nome, valor, com_azeitona, com_borda_recheada, fk_categorias_id)
VALUES ("Mussarela e Calabresa", 69.99, true, true, 5);

INSERT INTO tb_pizzas (nome, valor, com_azeitona, com_borda_recheada, fk_categorias_id)
VALUES ("Manjericão", 59.99, true, false, 2);

INSERT INTO tb_pizzas (nome, valor, com_azeitona, com_borda_recheada, fk_categorias_id)
VALUES ("Brigadeiro", 44.99, false, true, 3);

INSERT INTO tb_pizzas (nome, valor, com_azeitona, com_borda_recheada, fk_categorias_id)
VALUES ("Prestígio", 44.99, false, false, 4);

INSERT INTO tb_pizzas (nome, valor, com_azeitona, com_borda_recheada, fk_categorias_id)
VALUES ("Manjericão e Mussarela", 69.99, true, true, 1);

INSERT INTO tb_pizzas (nome, valor, com_azeitona, com_borda_recheada, fk_categorias_id)
VALUES ("Brigadeiro e Prestígio", 44.99, true, false, 6);

-- Faça um SELECT que retorne todas as pizzas cujo valor seja maior do que R$ 45,00.
SELECT * FROM tb_pizzas WHERE valor > 45.00;

-- Faça um SELECT que retorne todas as pizzas cujo valor esteja no intervalo R$ 50,00 e R$ 100,00.
SELECT * FROM tb_pizzas WHERE valor BETWEEN 50 AND 100;

-- Faça um SELECT utilizando o operador LIKE, buscando todas as pizzas que possuam a letra M no atributo nome.
SELECT * FROM tb_pizzas WHERE nome LIKE "%m%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias.
SELECT * FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.fk_categorias_id = tb_categorias.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_pizzas com os dados da tabela tb_categorias, onde traga apenas
-- as pizzas que pertençam a uma categoria específica (Exemplo: Todas as pizzas que são doce).
SELECT tb_pizzas.nome, tb_categorias.sabor FROM tb_pizzas INNER JOIN tb_categorias
ON tb_pizzas.fk_categorias_id = tb_categorias.id
WHERE tb_categorias.sabor = "Doce";




