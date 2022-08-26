-- 6.1 - Desenvolva um Banco de Dados, insira as duas tabelas e os registros acima;

Create database bd_empresa;
Use bd_empresa;

Create table tb_cargo (
pk_cargo int PRIMARY KEY IDENTITY (0,1),
NomeCargo varchar (100) NOT NULL,
IdCargo varchar (200) NOT NULL,
Valor int NOT NULL
)
;

Create table tb_funcionario (
pk_funcionario int PRIMARY KEY IDENTITY (0,1),
NomeFuncionario varchar (200) NOT NULL,
IdFunc varchar (200) NOT NULL, 
IdCargo varchar (200) NOT NULL,
SalarioFunc int NOT NULL
)
;

Insert into tb_cargo values ('Programador Junior','1',3.500,00);
Insert into tb_cargo values ('Web Design Pleno', '2', 5.500,00);
Insert into tb_cargo values ('Programador Pleno', '3', 7.200,00);
Insert into tb_cargo values ('DBA Junior', '4', 6.300,00);
Insert into tb_cargo values ('Programador Senior', '5', 6.100,00);

Insert into tb_funcionario values ('Jose da Silva', '11', '5', 6.100,00);
Insert into tb_funcionario values ('Mario Jobbs', '2', '33', 5.500,00);
Insert into tb_funcionario values ('Francisco Brasil', '3', '44', 7.200,00);
Insert into tb_funcionario values ('Maria da Silva', '4', '55', 6.300,00);
Insert into tb_funcionario values ('Carlos de Santos', '1', '66', 3.500,00);
Insert into tb_funcionario values ('Jose Gates', '1', '77', 3.500,00);

-- 6.2 - Crie uma consulta, usando inner join, que retorne todos os nomes cargos ocupados, os nomes
-- dos funcion�rios, bem como todos os sal�rios de funcion�rios que desempenham algum cargo;

Select 
		c.NomeCargo, f.nomeFuncionario, f.SalarioFunc
From 
		tb_cargo AS c

				INNER JOIN 

			tb_funcionario AS f
ON 
		c.IdCargo = f.IdCargo

-- 6.3 - Crie uma nova consulta, usando where, que retorne todos os nomes cargos ocupados, os nomes
-- dos funcion�rios, bem como todos os sal�rios de funcion�rios que desempenham algum cargo;

Select
		tb_cargo.NomeCargo, tb_funcionario.NomeFuncionario, tb_funcionario.SalarioFunc
From 
		tb_cargo, tb_funcionario
Where
		tb_cargo.IdCargo = tb_funcionario.IdCargo

-- 6.4 - Fa�a uma consulta, usando left join, que retorne todos os nomes cargos ocupados, todos os
-- dados dos funcion�rios, bem como todos os sal�rios de funcion�rios que desempenham algum cargo;

Select 
		c.nomeCargo, f.nomeFuncionario, f.SalarioFunc
From
		tb_cargo AS c

			LEFT JOIN

		tb_funcionario AS f
ON
	c.IdCargo = f.IdCargo

-- 6.5 - Fa�a uma consulta, usando right join, que retorne todos os nomes cargos ocupados, todos os dados dos funcion�rios, bem como 
-- todos os sal�rios de funcion�rios que desempenham algum cargo;

Select
		c.nomeCargo, f.nomeFuncionario, f.SalarioFunc
From
		tb_cargo AS c

			RIGHT JOIN

		tb_funcionario AS f
ON
		c.IdCargo = f.IdCargo

-- 6.6 - Mostre os cargos que n�o possuem funcion�rios cadastrados;

Select tb_cargo.NomeCargo From tb_cargo Where NOT EXISTS
( Select tb_funcionario.IdCargo From tb_funcionario Where tb_cargo.IdCargo = tb_funcionario.IdCargo )

-- 6.7 - Fa�a uma atualiza��o, usando update e inner join e retorne todos os dados de funcion�rio, acrescentando uma coluna reajuste 
-- e sal�rio reajustado, concedendo um reajuste de 5% somente para aqueles com sal�rios menores que R$ 4.000,00.

Alter table tb_funcionario Add Reajuste int
UPDATE tb_funcionario Set Reajuste = (5) Where SalarioFunc < 4000

Alter table tb_funcionario Add SalarioReajustado int
UPDATE tb_funcionario Set SalarioReajustado = (1.05 * SalarioFunc) Where SalarioFunc < 4000

Select
		c.*, f.*
From 
		tb_cargo AS c

			INNER JOIN

		tb_funcionario AS f
ON
		c.IdCargo = f.IdCargo

Drop table tb_funcionario