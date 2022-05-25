CREATE DATABASE db_construindo_vidas;

USE db_construindo_vidas;

CREATE TABLE tb_categorias(
id bigint auto_increment,
construcao varchar (255) not null,
decoracao varchar (255),
PRIMARY KEY (id)
);

INSERT INTO tb_categorias (construcao) 
VALUES ("Estrutura"), -- FK 1
("Hidráulica"), -- FK 2
("Elétrica"); -- FK 3

-- INSERT INTO tb_categorias (decoracao)
-- VALUES ("Cozinha"),
-- ("Sala"),
-- ("Quarto"); DESCOBRIR PORQUE NÃO ESTÁ EXECUTANDO DESSA FORMA. ERRO 1364. ACHO QUE É PQ CONSTRUCAO ESTÁ COMO NOT NULL.

ALTER TABLE tb_categorias CHANGE construcao modo_construcao varchar (100); -- MODIFIQUEI O ATRIBUTO E TIREI O NOT NULL DE CONSTRUCAO.

INSERT INTO tb_categorias (decoracao)
VALUES ("Cozinha"), -- FK4
("Sala"), -- FK 5
("Quarto"); -- FK 6 - ERA ISSO MESMO. AGORA DEU CERTO.

CREATE TABLE tb_produtos(
id bigint auto_increment,
nome varchar (255),
preco decimal (7,2),
quantidade int,
cor varchar (255),
fk_categorias_id bigint,
PRIMARY KEY (id),
FOREIGN KEY (fk_categorias_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_produtos (nome, preco, quantidade, cor, fk_categorias_id)
VALUES ("Cimento", 33.99, 1890, "Cinza", 1),
("Cano PVC", 49.99, 8409, "Branco", 2),
("Eletroduto", 176.00, 968, "Amarelo", 3),
("Mesa madeira rústica", 789.50, 4, "Marrom", 4),
("Sofá 4 lugares", 2645.70, 9, "Preto", 5),
("Cama King Size", 2800.00, 12, "Branca", 6),
("Tinta", 70.00, 139, "Roxo", 1),
("Sofá 4 lugares", 2645.70, 1, "Bege", 5),
("Tinta", 70.00, 387, "Vermelho", 1),
("Disjuntor", 77.99, 53, "", 3);

SELECT * FROM tb_produtos WHERE preco > 100;

SELECT * FROM tb_produtos WHERE preco BETWEEN 70 AND 150;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.fk_categorias_id = tb_categorias.id;

SELECT tb_produtos.nome, tb_produtos.preco, tb_categorias.modo_construcao FROM
tb_produtos INNER JOIN tb_categorias ON tb_produtos.fk_categorias_id = tb_categorias.id
WHERE modo_construcao = "Elétrica";


