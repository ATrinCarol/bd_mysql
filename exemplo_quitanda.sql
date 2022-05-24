
-- Recriar o Banco de dados db_quitanda
CREATE DATABASE db_quitanda;

-- Selecionar o Banco de Dados db_quitanda
USE db_quitanda;

-- Criar a tabela tb_categorias
CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");

INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");

INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");

INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");


INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");

INSERT INTO tb_categorias (descricao)
VALUES ("outros");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar a Tabela tb_produtos
CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int, 
dtvalidade date NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Tomate", 1105, "2022-03-15", 3.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produtos;

-- E trás somente essas duas buscas
SELECT * FROM tb_produtos WHERE preco > 5.50 AND categoria_id = 2; 

-- OU trás uma dessas duas buscas
SELECT * FROM tb_produtos WHERE preco > 5.50 OR categoria_id = 2; 

-- Trás tudo que NÃO SEJA id 2 e em ordem alfabética
SELECT * FROM tb_produtos WHERE NOT categoria_id = 2 ORDER BY nome; 

-- Entende que tem que achar tudo que tiver esses valores exatos
SELECT * FROM tb_produtos WHERE preco IN (5, 10, 15); 

-- Dá pra fazer com data também. Trás um intervalo entre valores
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 15; 

-- Vai buscar as datas de validade entre o período de datas
SELECT * FROM tb_produtos WHERE dtvalidade BETWEEN '2022-03-10'
AND '2022-03-15' ORDER BY dtvalidade DESC;

/* Traga pra mim qualquer produto cujo nome possua a sílaba "RA".
% é um coringa. Se tiver % só no começo %ra ele só vai trazer o que começa com RA
Se o % estiver no final ra% só vai trazer o que terminar com RA.
%ra% trás tudo que tiver essas sílabas. Geralmente é usado pra busca de textos.
Mas por exemplo se tiver números dentro de textos que queira buscar, aí você pode usar o LIKE
*/
SELECT * FROM tb_produtos WHERE nome LIKE "%ra%"; 

-- Pra saber quantos registros tem na minha tabela
SELECT count(*) FROM tb_produtos;

-- Especificar quantos registros tem em um atributo
SELECT count(categoria_id) FROM tb_produtos;

-- Saber a soma de todos meus produtos
SELECT sum(preco) FROM tb_produtos;

-- Calcular a média do preço de todos os produtos
SELECT avg (preco) FROM tb_produtos;

/*Calcular a média de preço de uma categoria. Ao invés de fazer uma média geral,
vai pegar cada categoria e vai calcular a média de cada categoria.
*/
SELECT categoria_id, avg (preco) as Média FROM tb_produtos
GROUP BY categoria_id;

-- Função MAX serve pra achar o maior valor
SELECT max(preco) FROM tb_produtos;

-- Função MIN serve pra achar o menor valor
SELECT min(preco) FROM tb_produtos;

/*INNER JOIN - Trás todos os dados que possuem chave estrangeira
 criar uma consulta que junta as tabelas que estão relacionadas
Ou seja, a chave estrangeira da minha tabela de produtos
tem que ser igual a chave primária da minha tabela de categorias
*/
SELECT * FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;

-- Consulta específica de nome, preço e descrição. Visualização mais limpa
SELECT nome, preco, tb_categorias.descricao
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;

/*LEFT JOIN trás o que possui chave estrangeira e também o que está
na tabela produtos
*/ 
SELECT nome, preco, tb_categorias.descricao
FROM tb_produtos LEFT JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;

/* RIGHT JOIN trás o que possui chave estrangeira e também 
o que está na tabela categorias
*/
SELECT nome, preco, tb_categorias.descricao
FROM tb_produtos RIGHT JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id;

















