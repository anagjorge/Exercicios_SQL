
/*Atividade 2

Crie um banco de dados para um e commerce, onde o sistema trabalhará com as informações dos produtos deste ecommerce. 

Crie uma tabela produtos e utilizando a habilidade de abstração e determine 5 atributos relevantes dos
produtos para se trabalhar com o serviço deste ecommerce.

Popule esta tabela com até 8 dados;

Faça um select que retorne os produtos com o valor maior do que 500.

Faça um select que retorne os produtos com o valor menor do que 500.

Ao término atualize um dado desta tabela através de uma query de atualização.
Salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL ou texto e coloque no seu GitHuB 
pessoal e compartilhe esta atividade.*/

create database ecommerce;
use ecommerce; 

create table tb_produtos(
	id_produto bigint(4) auto_increment, -- 9999
	nome varchar (30) not null,
    marca enum("Nike", "Adidas", "Puma"),
	categoria enum("Roupas", "Calçados","Acessórios"),
	valor real,
	quantidade int,
    dt_entrada_estoque date,
    
    primary key (id_produto)
);

describe tb_produtos;

insert into tb_produtos(nome, marca, categoria , valor, quantidade, dt_entrada_estoque)
	      Values ("Camiseta" ,"Adidas", "Roupas", "230.0", 10, "2021-04-10"),
	             ("Tênis Masculino", "Nike", "Calçados", "650.0", 25, "2021-04-25"),
				 ("Blusa", "Puma", "Roupas", "210.0", 13, "2021-05-04"),
                 ("Cinto", "Nike",  "Acessórios", "25.0", 8, "2021-03-07"),                    
				 ("Conjunto", "Adidas", "Roupas", "525.0", 10, "2021-06-10"),
                 ("Blusa Feminina", "Nike","Roupas", "550.0", 26, "2021-04-21"),
		         ("Calça Masculina","Adidas", "Roupas", "80.0", 10, "2021-06-10"),
		         ("Tênis Feminino","Adidas", "Calçados", "330.0", 10, "2021-07-23");

select nome as 'Nome do Produto', date_format(dt_entrada_estoque, '%d/%m/%Y') as 'Data de entrada no estoque' 
from tb_produtos;
select * from tb_produtos;
select * from tb_produtos where valor > 500.0;
select * from tb_produtos where valor < 500.0;

update `ecommerce`.`tb_produtos` set `valor`='250.0' where(`id_produto`= '1');
select valor from tb_produtos where id_produto = '1';
