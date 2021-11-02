/*Atividade 5
- Crie um banco de dados para um serviço de uma loja de produtos de construção, o nome do banco deverá ter o seguinte nome 
db_construindo_a_nossa_vida, onde o sistema trabalhará com as informações dos produtos desta empresa. 

- O sistema trabalhará com 2 tabelas tb_produto e tb_categoria.

- Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria 
para se trabalhar com o serviço deste ecommerce.

- Crie uma tabela de tb_produto e utilize a habilidade de abstração e determine 5 atributos relevantes dos tb_produto 
para se trabalhar com o serviço de uma loja de produtos (não esqueça de criar a foreign key de tb_categoria nesta tabela).

- Popule esta tabela Categoria com até 5 dados.

- Popule esta tabela Produto com até 8 dados.

- Faça um select que retorne os Produtos com o valor maior do que 50 reais.

- Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.

- Faça um select  utilizando LIKE buscando os Produtos com a letra C.

- Faça um um select com Inner join entre  tabela categoria e produto.

- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são da categoria 
hidráulica).*/

create database db_construindo_a_nossa_vida;
use db_construindo_a_nossa_vida;

create table tb_categoria(
	id_categoria bigint(2) auto_increment,
    departamento varchar(50),
	ambiente varchar (50),
    primary key (id_categoria)  
);

insert into tb_categoria (departamento,ambiente)
	values("Tintas", "geral"),
		  ("Louças", "banheiro"),
          ("Ferramentas", "garagem"),
          ("Iluminação", "geral"),
          ("Azulejos", "sala/quarto");
          
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
	values("Vaso sanitário", 15, "600.0", 2),
		  ("Tinta para parede", 25, "125.0", 1),
          ("Lâmpada de led", 30, "12.0", 4),
          ("Alicate", 30, "39.9", 3),
          ("Furadeira", 10, "200.0", 3),
          ("Piso cerâmico", 300, "20.0", 5),
          ("Parafusadeira", 5, "208.0", 3),
          ("Espelho", 15, "600.0", 2);
          
select * from tb_produto;
select * from tb_categoria;

select nome as "Produto", preco as "preço" from tb_produto where preco > 50.0;
select nome as "Produto", preco as "preço" from tb_produto where preco between 3.0 and 60.0;
select nome as "Produto" from tb_produto where nome like "C%";

select tb_produto.nome, tb_categoria.ambiente
from tb_produto inner join tb_categoria
on tb_categoria.id_categoria = tb_produto.fk_categoria;

select tb_produto.nome, tb_categoria.departamento
from tb_produto inner join tb_categoria
on tb_categoria.id_categoria = tb_produto.fk_categoria
where tb_categoria.departamento = "Ferramentas"



          
          

