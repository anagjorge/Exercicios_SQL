/* Atividade 6
- Crie um banco de dados para um serviço de um site de cursos onlines, o nome do banco deverá ter o seguinte nome db_cursoDaMinhaVida,
 onde o sistema trabalhará com as informações dos produtos desta empresa. 

- O sistema trabalhará com 2 tabelas tb_curso e tb_categoria.

- Crie uma tabela de categorias utilizando a habilidade de abstração e determine 3 atributos relevantes do tb_categoria para se
 trabalhar com o serviço deste site de cursos onlines.

- Crie uma tabela de tb_produto e utilizando a habilidade de abstração e determine 5 atributos relevantes dos tb_produto para se
 trabalhar com o serviço de um site de cursos onlines(não esqueça de criar a foreign key de tb_categoria nesta tabela).

- Popule esta tabela Categoria com até 5 dados.

- Popule esta tabela Produto com até 8 dados.

- Faça um select que retorne os Produtos com o valor maior do que 50 reais.

- Faça um select trazendo  os Produtos com valor entre 3 e 60 reais.

- Faça um select  utilizando LIKE buscando os Produtos com a letra J.

- Faça um um select com Inner join entre  tabela categoria e produto.

- Faça um select onde traga todos os Produtos de uma categoria específica (exemplo todos os produtos que são da categoria Java).*/

create database db_cursoDaMinhaVida;
use db_cursoDaMinhaVida;

create table tb_categoria(
	id_categoria bigint(2) auto_increment,
    categoria varchar(50),
	sub_categoria varchar(50),
    primary key (id_categoria)  
);

insert into tb_categoria (categoria,sub_categoria)
	values("Desenvolvimento","Linguagem de programação"),
		  ("Desenvolvimento","Data science"),
          ("Finanças","Escrituração contábil"),
          ("Marketing", "Marketing digital"),
          ("Fotografia", "Fotografia comercial");
          
create table tb_curso (
	id_curso bigint(3) auto_increment, 
    nome varchar(30) not null,  
	preco real not null,
    curso_ativo boolean,

	fk_categoria bigint(2),
    primary key (id_curso),  
    foreign key (fk_categoria) references tb_categoria(id_categoria) 
);

insert into tb_curso (nome, preco, curso_ativo, fk_categoria)
	values("Java completo","25.99",true, 1),
		  ("Python","65.99", true, 2),
          ("Contabilidade na prática","30.99",true, 3),
          ("Marketing digital completo", "59.9", true, 4),
          ("Fotografia para iniciantes", "63.9", true, 5);
          
select * from tb_curso;
select * from tb_categoria;

select nome as "Curso", preco as "Preço" from tb_curso where preco > 50.0;
select nome as "Curso", preco as "Preço" from tb_curso where preco between 3.0 and 60.0;
select nome as "Produto" from tb_curso where nome like "J%";

select tb_curso.nome, tb_categoria.categoria
from tb_curso inner join tb_categoria
on tb_categoria.id_categoria = tb_curso.fk_categoria;

select tb_curso.nome, tb_categoria.categoria
from tb_curso inner join tb_categoria
on tb_categoria.id_categoria = tb_curso.fk_categoria
where tb_categoria.categoria = "Desenvolvimento";




