/* Atividade 4
- Crie um banco de dados para um serviço de um açougue ou uma quitanda, o nome do banco deverá ter o seguinte nome db_cidade_das_carnes ou db_cidade_das_frutas, onde o sistema trabalhará com as informações dos produtos desta empresa. 

- O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

- Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço desse açougue.

- Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço desse açougue(não esqueça de criar a foreign key de tb_categoria nesta tabela).

- Popule esta tabela Categoria com até 5 dados.

- Popule esta tabela Produto com até 8 dados.

- Faça um select que retorne os Produtos com o valor maior do que 50 reais.

- Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.

- Faça um select  utilizando LIKE buscando os Produtos com a letra C.

- Faça um um select com Inner join entre  tabela categoria e produto.

- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são aves ou legumes).*/

create database db_cidade_das_frutas;
use db_cidade_das_frutas;

create table tb_categoria(
	id_categoria bigint(2) auto_increment,
    tipo_categoria varchar(50),
    estacao varchar (50),
    primary key (id_categoria)  
);

insert into tb_categoria (tipo_categoria,estacao)
	values("Frutas", "verão"),
		  ("Legumes", "outono"),
          ("oleaginosas", "inverno"),
          ("Folhas", "verão"),
          ("Temperos", "verão");
          
create table tb_produto (
	id_produto bigint(3) auto_increment, 
    nome varchar(30) not null,  
	quantidade bigint(3) not null,
    preco real not null,

	fk_categoria bigint(2),
    primary key (id_produto),  
    foreign key (fk_categoria) references tb_categoria(id_categoria) 
);

insert into tb_produto (nome, quantidade, preco, fk_categoria)
	values("coco", 15, "5.99", 3),
		  ("orégano", 25, "15.99", 5),
          ("cenoura", 100, "7.99", 2),
          ("limão", 50, "12.89", 1),
          ("Rúcula", 200, "6.79", 4),
          ("Nozes", 10, "72.99", 3),
          ("Damasco", 10, "65.00", 1),
          ("Morango", 10, "12.99", 1);

select * from tb_produto;
select * from tb_categoria;

select nome as "Produto", preco as "preço" from tb_produto where preco > 50.0;
select nome as "Produto", preco as "preço" from tb_produto where preco between 3.0 and 60.0;
select nome as "Produto" from tb_produto where nome like "C%";

select tb_produto.nome, tb_categoria.estacao
from tb_produto inner join tb_categoria
on tb_categoria.id_categoria = tb_produto.fk_categoria;

select tb_produto.nome, tb_categoria.tipo_categoria
from tb_produto inner join tb_categoria
on tb_categoria.id_categoria = tb_produto.fk_categoria
where tb_categoria.tipo_categoria = "Legumes";







          
          
          
    



