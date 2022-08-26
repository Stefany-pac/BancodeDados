create database BD_ENDERECO
use BD_ENDERECO

create table Pais
(
	id				int IDENTITY (1,1),
	nome			varchar(60) NOT NULL,
	
	PRIMARY KEY		(id)	
)

create table Estado
(
	id				int IDENTITY (1,1),
	nome			varchar(60) NOT NULL,
	id_pais			int,

	PRIMARY KEY		(id),
	FOREIGN KEY		(id_pais) REFERENCES Pais(id)
)

create table Cidade
(
	id				int IDENTITY (1,1),
	nome			varchar(60) NOT NULL,
	id_estado		int,

	PRIMARY KEY		(id),
	FOREIGN KEY		(id_estado) REFERENCES Estado(id)
)

create table Endereco
(
	id				int IDENTITY (1,1),
	idPessoa		int NOT NULL,
	logradouro		varchar(60) NOT NULL,
	complemento		varchar(60),
	bairro			varchar(60),
	cep				char(9),
	id_cidade		int,

	PRIMARY KEY		(id),
	FOREIGN KEY		(id_cidade) REFERENCES Cidade(id)
) 

create index idx_nomePais on Pais (nome)
create index idx_nomeEstado on Estado (nome)
create index idx_nomeCidade on Cidade (nome)
create index idx_logradouro on Endereco (logradouro)

insert into Pais values ('Brasil')

SELECT * FROM Pais

insert into Estado values ('Alagoas', 1)
insert into Estado values ('Acre', 1)
insert into Estado values ('Amazonas', 1)

Select * From Estado

insert into Cidade values ('Maceió', 1)
insert into Cidade values ('Arapiraca', 1)
insert into Cidade values ('Palmeira dos Índios', 1)

insert into Cidade values ('Rio Branco', 2)
insert into Cidade values ('Acrelândia', 2)
insert into Cidade values ('Epitaciolândia', 2)

insert into Cidade values ('Manaus', 3)
insert into Cidade values ('Boca do Acre', 3)
insert into Cidade values ('Ipixuna', 3)

Select * From Cidade

insert into Endereco values (469386, 'Rua Marcos Gonçalves de Melo', 'Casa 1', 'Bom Sucesso', '57309-226', 2)
insert into Endereco values (771974, 'Rua Quinze de Novembro', 'Casa 3', 'Centro', '57300-340', 2)
insert into Endereco values (425886, '1ª Travessa Santa Rita', 'Casa 2', 'Clima Bom', '57071-131', 1)
insert into Endereco values (142658, 'Quadra E', 'Casa 5', 'Clima Bom', '57071-217', 1)
insert into Endereco values (123456, 'Rua Bahia', 'Apartamento 3', 'Jardim Brasil', '57607-130', 3)
insert into Endereco values (123456, 'Rua Tertuliano Canuto', 'Apartamento 7', 'São Francisco', '57602-340', 3)

insert into Endereco values (654321, 'Rua Onze', 'Apartamento 33', 'Bahia Nova', '69904-470', 4)
insert into Endereco values (876512, 'Rua Aquarela', 'Casa 44', 'Santa Quitéria', '69914-340', 4)
insert into Endereco values (896523, 'Avenida Brasil ', 'Apartamento 55', 'Centro', '69945-000', 5)
insert into Endereco values (890122, 'Rua Geraldo Barbosa', 'Casa 4', 'Centro', '69945-000', 5)
insert into Endereco values (738905, 'Avenida Santos Dumont ', 'Apartamento 65', 'Centro', '69934-000', 6)
insert into Endereco values (871234, 'Avenida Internacional', 'Casa 9', 'Centro', '69934-000', 6)

insert into Endereco values (897427, 'Rua 18', 'Apartamento 53', 'Redenção', '69049-340', 7)
insert into Endereco values (111156, 'Rua Carlos Borborema', 'Casa 4', 'Colônia Oliveira Machado', '69070-590', 7)
insert into Endereco values (678123, 'Avenida Amazonas ', 'Apartamento 25', 'Centro', '69850-000', 8)
insert into Endereco values (890136, 'Rua Bl 23', 'Casa 84', 'Plato Piquiá', '69850-000', 8)
insert into Endereco values (740128, 'Rua Domingos Barroso', 'Apartamento 005', 'Centro', '69890-000', 9)
insert into Endereco values (926737, 'Avenida Juruá', 'Casa 77', 'Centro', '69890-000', 9)

Select * from Endereco 

id				int IDENTITY (1,1),
	idPessoa		int NOT NULL,
	logradouro		varchar(60) NOT NULL,
	complemento		varchar(60),
	bairro			varchar(60),
	cep				char(9),
	id_cidade		int,

Update Estado set nome = 'Paraná' Where id = 1

insert into Cidade values ('Cascavel', 1)

Delete Endereco Where id_cidade = 1
Delete Endereco Where id = 1

Select * from cidade where nome like 'c%'

update cidade set nome = 'curitiba' where nome = 'cascavel'

Select * from cidade