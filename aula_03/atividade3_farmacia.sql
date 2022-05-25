CREATE DATABASE db_farmacia_bem_estar;

USE db_farmacia_bem_estar;

CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
situacao varchar (255),
indicacao varchar (255),
PRIMARY KEY (id)
);

INSERT INTO tb_categorias (situacao, indicacao) VALUES ("Genérico", "Com receita"); -- FK 1

INSERT INTO tb_categorias (situacao, indicacao) VALUES ("Genérico", "Sem receita"); -- FK 2

INSERT INTO tb_categorias (situacao, indicacao) VALUES ("Referência", "Com receita"); -- FK 3

INSERT INTO tb_categorias (situacao, indicacao) VALUES ("Referência", "Sem receita"); -- FK 4

INSERT INTO tb_categorias (situacao) VALUES ("Somente por encomenda"); -- FK 5

CREATE TABLE tb_produtos (
id bigint auto_increment,
nome varchar (255) not null,
validade date not null,
preco decimal (6,2) not null,
quantidade int not null,
fk_categorias_id bigint,
PRIMARY KEY (id),
FOREIGN KEY (fk_categorias_id) REFERENCES tb_categorias(id) 
);

INSERT INTO tb_produtos (nome, validade, preco, quantidade, fk_categorias_id)
VALUES ("Buscofem", "2023-06-18", 23.99, 367, 4);

INSERT INTO tb_produtos (nome, validade, preco, quantidade, fk_categorias_id)
VALUES ("Ibuprofeno", "2024-06-18", 3.99, 764, 2);

INSERT INTO tb_produtos (nome, validade, preco, quantidade, fk_categorias_id)
VALUES ("Xifaxan", "2023-08-23", 635.00, 1, 3);

INSERT INTO tb_produtos (nome, validade, preco, quantidade, fk_categorias_id)
VALUES ("Sovaldi", "2025-03-28", 9000.00, 0, 5);

INSERT INTO tb_produtos (nome, validade, preco, quantidade, fk_categorias_id)
VALUES ("Sofosbuvir", "2024-11-09", 160.00, 14, 1);

INSERT INTO tb_produtos (nome, validade, preco, quantidade, fk_categorias_id)
VALUES ("Mamacadela", "2022-05-29", 25.00, 236, 2);

INSERT INTO tb_produtos (nome, validade, preco, quantidade, fk_categorias_id)
VALUES ("Monessa", "2023-06-17", 78.90, 78, 3);

INSERT INTO tb_produtos (nome, validade, preco, quantidade, fk_categorias_id)
VALUES ("Pantogar", "2023-06-17", 72.26, 114, 4);

SELECT * FROM tb_produtos WHERE preco > 50;

SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 60;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.fk_categorias_id = tb_categorias.id;

SELECT tb_produtos.nome, tb_categorias.situacao FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.fk_categorias_id = tb_categorias.id
WHERE situacao = "Genérico";









