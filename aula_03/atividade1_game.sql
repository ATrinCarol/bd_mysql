CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE tb_classes(
id bigint AUTO_INCREMENT,
arqueiro varchar(255) NOT NULL,
ladrão varchar(255) NOT NULL,
curandeiro varchar(255) NOT NULL,
PRIMARY KEY (id)
);

INSERT INTO tb_classes (arqueiro, ladrão, curandeiro)
VALUES ("Arqueiro SIM", "Ladrão NÃO", "Curandeiro NÃO"); -- FK 1

INSERT INTO tb_classes (arqueiro, ladrão, curandeiro)
VALUES ("Arqueiro NÃO", "Ladrão NÃO", "Curandeiro SIM"); -- FK 2

INSERT INTO tb_classes (arqueiro, ladrão, curandeiro)
VALUES ("Arqueiro SIM", "Ladrão SIM", "Curandeiro NÃO"); -- FK 3

INSERT INTO tb_classes (arqueiro, ladrão, curandeiro)
VALUES ("Arqueiro SIM", "Ladrão NÃO", "Curandeiro SIM"); -- FK 4

INSERT INTO tb_classes (arqueiro, ladrão, curandeiro)
VALUES ("Arqueiro NÃO", "Ladrão SIM", "Curandeiro NÃO"); -- FK 5


CREATE TABLE tb_personagens(
id bigint auto_increment,
nome varchar (30) NOT NULL,
habilidade varchar (30),
poder_ataque int,
poder_defesa int,
fk_classes_id bigint,
PRIMARY KEY (id),
FOREIGN KEY (fk_classes_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_personagens (nome, habilidade, poder_ataque, poder_defesa, fk_classes_id)
VALUES ("Faxyria Florgus", "Sabedoria (Sab)", 4857, 3967, 4);

INSERT INTO tb_personagens (nome, habilidade, poder_ataque, poder_defesa, fk_classes_id)
VALUES ("Nagan Grugg", "Constituição (Con)", 3904, 1135, 3);

INSERT INTO tb_personagens (nome, habilidade, poder_ataque, poder_defesa, fk_classes_id)
VALUES ("Vondern Gilcris", "Inteligência (Int)", 3958, 2000, 4);

INSERT INTO tb_personagens (nome, habilidade, poder_ataque, poder_defesa, fk_classes_id)
VALUES ("Pallostria Saadin", "Força (For)", 5986, 1312, 3);

INSERT INTO tb_personagens (nome, habilidade, poder_ataque, poder_defesa, fk_classes_id)
VALUES ("Quiin Adriggon", "Carisma (Car)", 899, 6780, 2);

INSERT INTO tb_personagens (nome, habilidade, poder_ataque, poder_defesa, fk_classes_id)
VALUES ("Zapris Eda", "Destreza (des)", 171, 8000, 1);

INSERT INTO tb_personagens (nome, habilidade, poder_ataque, poder_defesa, fk_classes_id)
VALUES ("Twylite Petro", "Sabedoria (Sab)", 3896, 3860, 3);

INSERT INTO tb_personagens (nome, habilidade, poder_ataque, poder_defesa, fk_classes_id)
VALUES ("Lachlus Daseran", "Constituição (Con)", 5678, 759, 1);

-- Faça um SELECT que retorne todes os personagens cujo poder de ataque seja maior do que 2000.
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- Faça um SELECT que retorne todes os personagens cujo poder de defesa esteja no intervalo 1000 e 2000.
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- Faça um SELECT utilizando o operador LIKE, buscando todes os personagens que possuam a letra C no atributo nome.
SELECT * FROM tb_personagens WHERE nome LIKE "%c%"; 

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes.
SELECT * FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.fk_classes_id = tb_classes.id;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_personagens com os dados da tabela tb_classes, 
-- onde traga apenas os personagens que pertençam a uma classe específica (Exemplo: Todes os personagens da classe dos arqueiros).
SELECT tb_classes.arqueiro
FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.fk_classes_id = tb_classes.id;


