/*
Atividade 1

Crie um banco de dados para um serviço de RH de uma empresa, onde o sistema
trabalhará com as informações dos funcionaries desta empresa.

Crie uma tabela de funcionaries e utilizando a habilidade de abstração e determine 5
atributos relevantes dos funcionaries para se trabalhar com o serviço deste RH.

Popule esta tabela com até 5 dados;

Faça um select que retorne os funcionaries com o salário maior do que 2000.
Faça um select que retorne os funcionaries com o salário menor do que 2000.
Ao término atualize um dado desta tabela através de uma query de atualização.*/

create database empresa;
use empresa;

create table tb_funcionarios(
	id_funcionario bigint(4) auto_increment, 
	nome varchar (30) not null,
	dt_nasc date,
	setor enum("Administrativo", "Estoque","TI"),
	salario real,
    
    primary key (id_funcionario)
);

describe tb_funcionarios;

insert into tb_funcionarios(nome, dt_nasc, setor, salario)
Values ("Maria", "1990-10-25", "Administrativo", 1500),
	   ("João", "1975-11-24", "Estoque", 2500),
       ("Valentina", "1990-06-12", "TI", 3500),
       ("Marcos", "1992-04-23", "Estoque", 3000),
       ("Marluce", "1978-10-14", "Administrativo", 2900);

select * from tb_funcionarios;
select * from tb_funcionarios where salario > 2000.00;
select * from tb_funcionarios where salario < 2000.00;

update `empresa`.`tb_funcionarios` set `salario`='3100' where(`id_funcionario`= '10');
select salario from tb_funcionarios where id_funcionario = '10';



