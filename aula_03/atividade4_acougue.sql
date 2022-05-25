CREATE DATABASE db_cidade_das_carnes;

USE db_cidade_das_carnes;

CREATE TABLE tb_categorias(
id bigint auto_increment,
especie varchar (255) not null,
tipos varchar (255),
PRIMARY KEY (id)
);

INSERT INTO tb_categorias (especie, tipos) -- OBS: Mesmo não colocando not null no atributo "tipos", não deixou eu executar sem inserir esse dado
 VALUES ("Bovina", "Nobre") , -- FK1
 ("Bovina", "Barata") , -- FK2
 ("Suína", "Barata") , -- FK3
 ("Aves", "Barata") , -- FK4
 ("Peixes", "Barata"); -- FK5
 
 CREATE TABLE tb_produtos(
 id bigint auto_increment,
 nome varchar (255),
 preco decimal (5,2),
 validade date,
 selo_qualidade boolean,
 fk_categorias_id bigint,
 PRIMARY KEY (id),
 FOREIGN KEY (fk_categorias_id) REFERENCES tb_categorias(id)
 );
 
 INSERT INTO tb_produtos (nome, preco, validade, selo_qualidade, fk_categorias_id)
 VALUES ("Picanha", 120.00, "2022-06-29", true, 1), 
 ("Coxa", 15.00, "2022-08-11", true, 4), 
 ("Pernil", 20.00, "2022-10-18", false, 3),
 ("Costela gaúcha", 28.00, "2022-12-03", true, 2),
 ("Bagre", 19.00, "2022-05-30", true, 5),
 ("Filé Mignon", 148.00, "2022-07-20", true, 1),
 ("Fígado", 19.00, "2022-09-03", false, 4),
 ("Tilápia", 23.00, "2022-06-05", true, 1),
 ("Músculo", 33.00, "2022-07-13", true, 2),
 ("Sobrecoxa", 13.00, "2022-07-29", true, 4);
 
 SELECT * FROM tb_produtos WHERE preco > 50.00;
 
 SELECT * FROM tb_produtos WHERE preco BETWEEN 50 AND 150;
 
 SELECT * FROM tb_produtos WHERE nome LIKE "%C%";
 
 SELECT * FROM tb_produtos INNER JOIN tb_categorias
 ON tb_produtos.fk_categorias_id = tb_categorias.id;
 
SELECT tb_produtos.nome, tb_categorias.especie FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.fk_categorias_id = tb_categorias.id 
WHERE especie = "Aves";
 