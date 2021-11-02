/*
Atividade 1

- Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter o seguinte nome db_generation_game_online, 
onde, o sistema trabalhará com as informações dos personagens desse game. 

- O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.

- Crie uma tabela tb_classe utilizando a habilidade de abstração e determine 3 atributos relevantes da classe para se trabalhar
 com o serviço desse  game Online.

- Crie uma tabela tb_personagem utilizando a habilidade de abstração e determine 5 atributos relevantes dos 
funcionários para se trabalhar com o serviço desse game Online (não esqueça de criar a foreign key de tb_classe nesta tabela).

- Popule esta tabela classe com até 5 dados.

- Popule esta tabela personagem com até 8 dados.

- Faça um select que retorne os personagens com o poder de ataque maior do que 2000.

- Faça um select trazendo  os personagens com poder de defesa entre 1000 e 2000.

- Faça um select  utilizando LIKE buscando os personagens com a letra C.

- Faça um um select com Inner join entre  tabela classe e personagem.

- Faça um select onde traga todos os personagem de uma classe específica (exemplo todos os personagens que são arqueiros).*/

create database db_generation_game_online;
use db_generation_game_online;

create table tb_classe (
	id_classe bigint (2) auto_increment, 
    nome_classe varchar(30) not null,   
    talento varchar (50) not null,
    fraqueza varchar(50) not null,    
    primary key (id_classe)  
);

insert into tb_classe (nome_classe ,talento, fraqueza) 
	values ("Magia", "mágica", "física"),
			("Math", "cálculo", "arco"),
            ("Arqueiros", "arco/flecha", "matemática"),
            ("Luz", "conhecimento em elétrica", "magia"),
            ("Artistas", "música", "magia");
            
create table tb_personagens (
	id_personagens bigint(3) auto_increment, 
    nome_personagem varchar(30) not null,                 
    poder_defesa int not null,
    poder_ataque int not null,
    evoluir boolean not null, 
	fk_classe bigint(2),
    primary key (id_personagens),  
    foreign key (fk_classe) references tb_classe(id_classe) 
);

insert into tb_personagens (nome_personagem, poder_defesa, poder_ataque, evoluir, fk_classe)
values ("Maria", 2100, 1900, true, 4),
	   ("Barbára", 3500,4000, true, 3),
       ("João", 1900, 2300, false, 3),
       ("Francisco", 2500, 1900 , true, 2),
       ("Joaquina", 3200, 2200, false, 1);
       
select * from tb_personagens;

select * from tb_classe;

select nome_personagem, poder_ataque from tb_personagens where poder_ataque > 2000;

select nome_personagem from tb_personagens where poder_ataque between 1000 and 2000;

select nome_personagem from tb_personagens where nome_personagem like "C%";

select tb_personagens.nome_personagem, tb_classe.talento
from tb_personagens inner join tb_classe
on tb_classe.id_classe = tb_personagens.fk_classe;

select tb_personagens.nome_personagem, tb_classe.nome_classe
from tb_personagens inner join tb_classe
on tb_classe.id_classe = tb_personagens.fk_classe
where tb_classe.nome_classe = "arqueiros"





    

