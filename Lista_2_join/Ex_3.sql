/* Atividade 3
- Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco deverá ter o seguinte nome db_farmacia_do_bem, 
onde o sistema trabalhará com as informações dos produtos desta empresa. 

- O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

- Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se trabalhar com o serviço desta farmacia.

- Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se trabalhar com o serviço deste farmacia(não esqueça de criar a foreign key de tb_categoria nesta tabela).

- Popule esta tabela Categoria com até 5 dados.

- Popule esta tabela Produto com até 8 dados.

- Faça um select que retorne os Produtos com o valor maior do que 50 reais.

- Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.

- Faça um select  utilizando LIKE buscando os Produtos com a letra B.

- Faça um um select com Inner join entre  tabela categoria e produto.

- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são cosméticos).*/

create database db_farmacia_do_bem;
use db_farmacia_do_bem;

create table tb_categoria (
	id_categoria bigint (2) auto_increment, 
    tipo_categoria enum("Similar","Genérico") not null,   
    indicacao varchar(50) not null,
    primary key (id_categoria)  
);

insert into tb_categoria (tipo_categoria, indicacao)
	values("Similar", "anti-inflamatório"),
		  ("Similar", "antigripe"),
          ("Genérico", "asma"),
          ("Genérico", "alergia"),
          ("Similar", "hipertensão");
          
create table tb_produto (
	id_produto bigint(3) auto_increment, 
    nome varchar(30) not null,  
	marca varchar(30) not null,
    preco real,
    com_receita boolean,
       
	fk_categoria bigint(2),
    primary key (id_produto),  
    foreign key (fk_categoria) references tb_categoria(id_categoria) 
);

insert into tb_produto(nome, marca, preco, com_receita, fk_categoria)
	values("Lisador", "GSK", "5.90", true, 1),
		  ("Losartana", "Merck", "12.90", true, 5),
          ("Aerodini", "Teuto", "65.90", true, 3),
          ("Allegra", "Sanofi", "52.90", true, 4),
          ("Loratamed", "Cimed", "22.40", true, 4),
          ("Nimesulida", "EMS", "68.90", true, 1),
          ("Cimegripe", "Sanofi", "12.20", true, 2);
          
select * from tb_produto;
select * from tb_categoria;

select nome as "Nome da medicamento", preco as "preço" from tb_produto where preco > 50.0;
select nome as "Nome da medicamento", preco as "preço" from tb_produto where preco between 3.0 and 60.0;
select nome as "Nome da medicamento" from tb_produto where nome like "B%";

select tb_produto.nome, tb_categoria.indicacao
from tb_produto inner join tb_categoria
on tb_categoria.id_categoria = tb_produto.fk_categoria;

select tb_produto.nome, tb_categoria.tipo_categoria
from tb_produto inner join tb_categoria
on tb_categoria.id_categoria = tb_produto.fk_categoria
where tb_categoria.tipo_categoria = "Genérico"






          