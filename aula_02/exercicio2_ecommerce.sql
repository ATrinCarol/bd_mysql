/*
Crie um banco de dados para um e-commerce, onde o sistema trabalhará com as informações dos produtos deste e-commerce.
Crie uma tabela de produtos e determine 5 atributos relevantes dos produtos para se trabalhar com o serviço deste e-commerce.
Insira nesta tabela no mínimo 8 dados (registros).
Faça um SELECT que retorne todes os produtos com o valor maior do que 500.
Faça um SELECT que retorne todes os produtos com o valor menor do que 500.
Ao término atualize um registro desta tabela através de uma query de atualização.
*/

CREATE DATABASE db_ecommerce;

USE db_ecommerce;

CREATE TABLE tb_produtos(
id BIGINT AUTO_INCREMENT,
nome VARCHAR (30) NOT NULL,
quantidade_estoque INT,
preco DECIMAL (6,2) NOT NULL,
descricao VARCHAR (300),
PRIMARY KEY (id)
);

SELECT * FROM tb_produtos;

INSERT INTO tb_produtos(nome, quantidade_estoque, preco, descricao) 
VALUES ("Ração", 5000, 39.99, "carne, frango, salmão, folhas");
INSERT INTO tb_produtos(nome, quantidade_estoque, preco, descricao) 
VALUES ("Remédio", 3678, 50.00, "vermífugo, pulgas, dor de cabeça, rim");
INSERT INTO tb_produtos(nome, quantidade_estoque, preco, descricao) 
VALUES ("Coleira", 300, 25.50, "várias cores e modelos");
INSERT INTO tb_produtos(nome, quantidade_estoque, preco, descricao) 
VALUES ("Brinquedos", 560, 19.90, "vários tipos, tamanhos e cores");
INSERT INTO tb_produtos(nome, quantidade_estoque, preco, descricao) 
VALUES ("Acessórios", 679, 29.99, "para a cabeça, pés, rabo. Vários modelos e várias cores");
INSERT INTO tb_produtos(nome, quantidade_estoque, preco, descricao) 
VALUES ("Roupas", 3490, 60.00, "vários tamanhos, modelos e cores. Somente para cão e gato");
INSERT INTO tb_produtos(nome, quantidade_estoque, preco, descricao)  -- cada vez que executa essa linha, insere novamente esse dado na tabela
VALUES ("Passeios", 30, 569.00, "Somente 1 por dia, no período comercial, com capacidade para até 5 animais");
INSERT INTO tb_produtos(nome, quantidade_estoque, preco, descricao) 
VALUES ("Banho e Tosa", 150, 75.00, "Somente no período da tarde, 5 vagas por dia");

SELECT * FROM tb_produtos WHERE preco > 500;
SELECT * FROM tb_produtos WHERE preco < 500;

UPDATE tb_produtos SET preco = 500.99 WHERE id = 7;

-- Exlui todos os dados replicados
DELETE FROM tb_produtos WHERE id = 9;
DELETE FROM tb_produtos WHERE id = 10;
DELETE FROM tb_produtos WHERE id = 11;
DELETE FROM tb_produtos WHERE id = 12;
DELETE FROM tb_produtos WHERE id = 13;
DELETE FROM tb_produtos WHERE id = 14;
DELETE FROM tb_produtos WHERE id = 15;
DELETE FROM tb_produtos WHERE id = 16;
DELETE FROM tb_produtos WHERE id = 17;
