/* Atividade 2
- Crie um banco de dados para um serviço de pizzaria de uma empresa, o nome do banco deverá ter o seguinte nome db_pizzaria_legal,
 onde o sistema trabalhará com as informações dos produtos desta empresa. 

- O sistema trabalhará com 2 tabelas tb_pizza e tb_categoria.

- Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria 
para se trabalhar com o serviço dessa pizzaria.

- Crie uma tabela de tb_pizza e utilizando a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se
trabalhar com o serviço dessa pizzaria(não esqueça de criar a foreign key de tb_categoria nesta tabela).

- Popule esta tabela Categoria com até 5 dados.

- Popule esta tabela pizza com até 8 dados.

- Faça um select que retorne os Produtos com o valor maior do que 45 reais.

- Faça um select trazendo  os Produtos com valor entre 29 e 60 reais.

- Faça um select  utilizando LIKE buscando os Produtos com a letra C.

- Faça um um select com Inner join entre  tabela categoria e pizza.

- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são pizza doce).*/

create database db_pizzaria_legal;
use db_pizzaria_legal;

create table tb_categoria (
	id_categoria bigint (2) auto_increment, 
    tipo_categoria enum("Salgada","Doce") not null,   
    tamanho enum ("P", "M", "G") not null,
    primary key (id_categoria)  
);

insert into tb_categoria(tipo_categoria, tamanho)
	values("Salgada", "P"),
		  ("Salgada", "M"),
		  ("Salgada", "G"),
          ("Doce", "P"),
          ("Doce", "M");
          
create table tb_pizza (
	id_pizza bigint(3) auto_increment, 
    nome varchar(30) not null,  
    ingredientes varchar(50) not null,
    preco real,
    promocao boolean,
       
	fk_categoria bigint(2),
    primary key (id_pizza),  
    foreign key (fk_categoria) references tb_categoria(id_categoria) 
);

insert into tb_pizza(nome, ingredientes,preco, promocao, fk_categoria)
	values("Marguerita", "mussarela,tomate, óregano", "25.90", true, 3),
		  ("Portuguesa", "mussarela,presunto, ovo", "28.90", false, 3),
          ("Baiana", "mussarela,calabresa, pimenta", "27.90", true, 2),
          ("Picanha", "mussarela,picanha, bacon", "59.90", true, 1),
          ("Camarão", "mussarela, camarão, palmito", "52.90", false, 3),
          ("Rúcula", "mussarela,tomate, rúcula", "38.90", true, 2),
          ("Brigadeiro", "chocolate,leite condensado", "28.90", false, 4),
          ("Romeu e julieta", "mussarela,goiabada", "29.90", false, 5);
          
select * from tb_pizza;
select * from tb_categoria;

select nome as "Nome da pizza", preco as "preço" from tb_pizza where preco > 45.00;
select nome as "Nome da pizza", preco as "preço"from tb_pizza where preco between 29.00 and 60.00;
select nome as "Nome da pizza" from tb_pizza where nome like "C%";

select tb_pizza.nome, tb_categoria.tipo_categoria
from tb_pizza inner join tb_categoria
on tb_categoria.id_categoria = tb_pizza.fk_categoria;

select tb_pizza.nome, tb_categoria.tipo_categoria
from tb_pizza inner join tb_categoria
on tb_categoria.id_categoria = tb_pizza.fk_categoria
where tb_categoria.tipo_categoria = "Doce"




