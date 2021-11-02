/*
	Atividade 3
		Crie um banco de dados para um registro de uma escola, onde o sistema trabalhará 
        com as informações dos estudantes deste registro dessa escola.
		Crie uma tabela estudantes e utilizando a habilidade de abstração e determine 5 
        atributos relevantes dos estudantes para se trabalhar com o serviço dessa escola.

		Popule esta tabela com até 8 dados;
        
		Faça um select que retorne o/as estudantes com a nota maior do que 7.
		Faça um select que retorne o/as estudantes com a nota menor do que 7.
        
		Ao término atualize um dado desta tabela através de uma query de atualização.
		salve as querys para cada uma dos requisitos o exercício em um arquivo .SQL 
        ou texto e coloque no seu GitHuB pessoal e compartilhe esta atividade.
*/

create database escola;
use escola; 

create table tb_alunes(
	id_alune bigint(4) auto_increment, -- 9999
	nome varchar (30) not null,
	dt_nasc date,
	turma enum("Matemática", "Português","Geografia"),
	nota real,
	stt boolean,
    
    primary key (id_alune)
);

describe tb_alunes;

insert into tb_alunes(nome, dt_nasc, turma, nota, stt) 
	      Values ("Maria", "1990-10-25", "Matematica", 10.0, true),
	             ("Adriana", "2000-10-13", "Portugues", 4.5, true),
				 ("Joao", "2000-12-13", "Geografia", 8.4, true),
                 ("Jose", "1993-02-25", "Português", 9.0, true),                    
				 ("Marina",  "1990-11-01", "Matemática", 5.4, false),
                 ("Luis", "1992-12-28", "Português", 3.3, true),
		         ("Monica", "1991-07-21", "Geografia", 9.1, false),
		         ("Valentina", "2000-08-30", "Geografia", 5.9, true);

select * from tb_alunes;
select * from tb_alunes where nota > 7;
select * from tb_alunes where nota < 7;

update `escola`.`tb_alunes` set `nota`='9' where(`id_alune`= '5');
select nota from tb_alunes where id_alune = '5';



