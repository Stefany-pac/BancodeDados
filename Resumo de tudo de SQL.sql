create database bd_cadastro
use bd_cadastro;

create table peop (
pk_idpeop int primary key IDENTITY (1,1),
fk_idpeop int,
foreign key (fk_idpeop) references peop (pk_idpeop),
nome varchar (30),
nascimento date,
sexo varchar (5),
peso float,
altura float,
nacionalidade varchar (30),
);

create table cursos (
pk_idcursos int primary key identity (1,1),
nome varchar (30),
professor varchar (30),
quant_alunos int,
);

insert into peop values (1, 'Pretinha', '2000/10/01', 'F', 15, 0.75, 'Brasil');
insert into peop values (2, 'Baby Yoda', '8990/11/11', 'M', 15, 0.76, 'Desconhecido');

insert into cursos values ('Java', 'Bertholdo', 20);
insert into cursos values ('SQL', 'Bertholdo', 30);
insert into cursos values ('Cobol', 'Bertholdo', 10);
insert into cursos values ('Python', 'Bertholdo', 20);
insert into cursos values ('Engenharia de Software', 'Bertholdo', 15);
insert into cursos values ('Banco de dados', 'Bertholdo', 30);
insert into cursos values ('MATA1', 'Bertholdo', 40);

Alter table peop ADD profissao varchar (50)
-- para escolher a posição q a nova coluna vai ficar é só colocar "AFTER" (nome da coluna que ficará abaixo)

Update peop --modifica 1 coisa
set nome = 'Yoda'
where pk_idpeop = 2

Update peop
set nome = 'Capitu'
where pk_idpeop = 1 

Update peop --modifica 2 coisas 
set nome = 'Melhor cavalheiro Jedi', nacionalidade = 'Disneyland' 
where pk_idpeop = 2

Update peop 
set profissao = 'Cavalheiro'
where pk_idpeop = 2

Delete from cursos -- deletar a linha 
where pk_idcursos = 3 

Delete from cursos --apaga tudos cursos que o Bertholdo ministrar 
where professor = 'Bertholdo'

truncate table cursos; --apaga tudo da tabela, sem utilizar parâmetros 

SELECT * FROM cursos --seleciona todas as colunas 

order by nome desc; -- ordena pelo nome de baixo para cima

order by nome --ordena em ordem alfabetica normal 

select nome, quant_alunos from cursos -- filtra colunas 
order by quant_alunos

select * from cursos --filtra linhas 
where quant_alunos = 20
order by nome 

select nome, professor from cursos
where quant_alunos = 10
order by nome

select nome, professor from cursos
where quant_alunos <= 30
order by nome

select nome, professor from cursos -- entre dois parâmetros 
where quant_alunos between 20 and 30 

select pk_idcursos, nome from cursos -- pode utilizar valores especificos entre parâmetros 
where quant_alunos IN ('10', '20', '30') 
order by nome 

select * from cursos
where quant_alunos > 30 

select * from cursos -- or = ou
where quant_alunos > 30 or pk_idcursos > 4

select * from cursos --mostra nomes com a inicial p
where nome like 'P%'

select * from cursos --mostra o nome q termina na letra "a"
where nome like '%A'

select * from cursos --mostra a palavra que tem "a" em qualquer lugar 
where nome like '%a%'

select * from cursos -- mostra a palavra que NÃO tem "a" em lugar nenhum 
where nome not like '%a%'

select * from cursos
where nome like 'Ja%v'

select * from cursos
where nome like 'J%'

select distinct quant_alunos from cursos -- faz com q apareça o mesmo nome só uma vez, reduz redundancia 
order by quant_alunos

select count (*) from cursos -- conta a quantidade de cursos cadastrados 

count (*) --função de agregação 

select max (quant_alunos) from cursos -- verifica o máximo dentro de um campo, no caso o máximo de alunos 

select max (quant_alunos) from cursos 
where professor = 'Bertholdo' 
-- verifica o máximo dentro de um campo usando uma condição, condição = Bertholdo. Pode ser usado no min, maz, sum 

select min (quant_alunos) from cursos -- verifica o mínimo dentro de um campo, no caso o mínimo de alunos 

select sum (quant_alunos) from cursos --soma todos os números de alunos em cada aula

select avg (quant_alunos) from cursos --tira a média 

select quant_alunos from cursos --agrupamento da quantidade de alunos  
group by quant_alunos

select quant_alunos, count (*) from cursos -- conta/agrupa quantas vezes a quantidade de aulas se repete 
group by quant_alunos 

select quant_alunos, count(*) from cursos
group by quant_alunos
having (quant_alunos) < 30 -- serve como condição 

select cursos.nome, peop.nome -- inner, right, left, outer 
from peop
inner join cursos
on pk_idcursos = fk_idpeop

