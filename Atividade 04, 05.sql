create database Hospital

use Hospital

create table Hospital (
IdHospital int identity, 
Nome varchar (150) not null,
Endereco varchar (100) not null, 
constraint PK_Hospital primary key (IdHospital)
)

create table Especialidade (
IdEspecialidade int identity,
Especialidade varchar (100) not null,
Departamento varchar (100) not null,
constraint PK_Especialidade primary key (IdEspecialidade) 
)

create table Medicamento (
IdMedicamento int identity,
Nome varchar (100) not null, 
Preco money,
Indicacao text not null, 
EfeitoColateral text not null, 
Posologia text not null, 
Constraint PK_Medicamento primary key (IdMedicamento)
)

create table Convenio (
IdConvenio int identity, 
Nome varchar (100) not null,
constraint PK_Convenio primary key (IdConvenio), 
constraint Convenio_Nome unique (Nome) 
)

create table Medico (
Crm int, 
NomeMedico varchar (100) not null, 
IdEspecialidade int not null, 
constraint PK_Medico primary key (Crm), 
constraint FK_Medico_IdEspecialidade foreign key (IdEspecialidade) references Especialidade (IdEspecialidade) 
)

create table HospitalMedico (
IdHospital int, 
Crm int, 
DataAdmissao date not null, 
constraint PK_HospitalMedico primary key (IdHospital, Crm), constraint FK_HospitalMedico_IdHospital
foreign key (IdHospital) references Hospital (IdHospital), 
constraint FK_HospitalMedico_Crm foreign key (Crm) references Medico (Crm) 
) 

create table Paciente (
IdPaciente int identity, 
Cpf varchar (100) not null, 
Nome varchar (100) not null, 
Endereco varchar (100) not null, 
IdConvenio int,
DataInicioConvenio date, 
constraint PK_Paciente primary key (IdPaciente), 
constraint FK_Paciente_IdConvenio foreign key (IdConvenio) references Convenio(IdConvenio),
constraint Paciente_Cpf unique (Cpf), 
constraint CK_Paciente_Cpf check (len(Cpf) = 11)
)

create table Telefone (
IdPaciente int, 
Telefone varchar (100), 
constraint PK_Telefone primary key (IdPaciente, Telefone),
constraint FK_Telefone_IdPaciente foreign key(IdPaciente) references Paciente (IdPaciente) 
)

create table Consulta ( 
IdConsulta int identity, 
IdHospital int, 
Crm int, 
IdPaciente int, 
DataConsulta datetime not null constraint DF_DtCons default getdate(), 
constraint PK_Consulta primary key (IdConsulta),
constraint Consulta_IdHospitalcrmIdPacienteDataConsulta unique (IdHospital, Crm, IdPaciente, DataConsulta),
constraint FK_Consulta_IdHospitalCrm foreign key (IdHospital, Crm) references HospitalMedico(IdHospital, Crm), 
constraint FK_Consulta_IdPaciente foreign key (IdPaciente) references Paciente (IdPaciente) 
)

create table Prescricao (
IdConsulta int, 
IdMedicamento int, 
constraint PK_Prescricao primary key (IdConsulta, IdMedicamento),
constraint FK_Prescricao_IdConsulta foreign key (IdConsulta) references Consulta(IdConsulta), 
constraint FK_Prescricao_IdMedicamento foreign key  (IdMedicamento) references Medicamento (IdMedicamento)
)

Insert Hospital values ('Rua Brasil', 621)
Insert Hospital values ('Rua Santos', 213)
Insert Hospital values ('Rua Rodrigues', 7549)

Insert Especialidade values ('Psiquiatra', '01')
Insert Especialidade values ('Odontologia', '033')
Insert Especialidade values ('Psicologo', '789')

Insert Medicamento values ('Olanzapina', '01')
Insert Medicamento values ('Dipirona', '099')
Insert Medicamento values ('Chorar', '763')

Insert Convenio values ('MaisSaude')
Insert Convenio values ('ViverMelhor')
Insert Convenio values ('VidaFeliz')

Insert Medico values (9484, 'Andrea Santos', 7)
Insert Medico values (6667, 'Claudia Macedo', 3)
Insert Medico values (6172, 'Maria Silva', 9)

Insert HospitalMedico values (9482, 7)
Insert HospitalMedico values (6667, 3)
Insert HospitalMedico values (6172, 9)

Insert Paciente values ('23179654327', 'Tamires Santos', 777)
Insert Paciente values ('51394765201', 'Tatiane Santos', 888)
Insert Paciente values ('95641307854', 'Filipe Santos', 999)


Insert Telefone values (777, '11940901320')
Insert Telefone values (888, '1109285018')
Insert Telefone values (999, '1163187939')

Insert Consulta values (9482, 7, '2007-02-06')
Insert Consulta values (6667, 3, '2007-06-02')
Insert Consulta values (6172, 9, '2007-08-03')

Insert Prescricao values ('Paciente', 777, 'Doutor', 9482)
Insert Prescricao values ('Paciente', 888, 'Doutor', 6667) 
Insert Prescricao values ('Paciente', 999, 'Doutor', 6172)

SELECT * FROM Hospital WHERE Endereco = ‘Rua Pedro II’
SELECT Especialidade FROM Especialidade WHERE Departamento = ‘Depto 3’
SELECT NomeMedico FROM Medico WHERE Crm = ‘123’
SELECT Nome, DataInicioConv FROM Paciente WHERE IdConvenio = 2
SELECT Nome FROM Medicamento WHERE Preco < 20.00

UPDATE Especialidade set Departamento = ‘Depto 5’ WHERE Departamento = ‘Depto 2’
UPDATE Medicamento set Posologia = ‘Não informado’ WHERE Posologia is null
UPDATE Paciente set Endereco = ‘Rua da Liberdade’ WHERE  CPF = ‘44445555500’
UPDATE Medicamento set Preco = Preco + (Preco * 0.10) WHERE Preco < 10.00
UPDATE Convenio set Nome = ‘Luz Convênios’ WHERE Nome = ‘Luz’

DELETE from Telefone WHERE CodPaciente = 1
DELETE from Prescricao WHERE IdMedicamento = 2
DELETE from Consulta WHERE IdPaciente = 3
DELETE from Paciente WHERE Cpf = ‘88887777702’
DELETE from Medico WHERE Crm = 436

SELECT * from Medicamento WHERE Preco + (Preco * 0.05) < 20.00
SELECT Nome from Medicamento WHERE (Preco * 0.25) < 4.00
SELECT Nome from Medicamento WHERE (Preco / 3) > 5.00
SELECT * from Medicamento WHERE (Preco * 3) < 50.00
SELECT Nome, Indicacao from Medicamento WHERE CAST(Preco AS int) % 4 = 0
SELECT * from Paciente WHERE CodConvenio = 2      
SELECT Nome from Medicamento WHERE Indicacao != ‘Livre’
SELECT Nome from Convenio WHERE Nome < ‘Santo Amaro’
SELECT NomeMedico from Medico WHERE NomeMedico > ‘C’
SELECT Nome from Paciente WHERE DataInicioConv <= ‘2018’
SELECT Especialidade from Especialidade WHERE Departamento >= ‘Depto 3’
SELECT Nome from Medicamento WHERE Preco !< 10.00
SELECT Nome from Medicamento WHERE Preco !> 7.00
SELECT Nome, PreçoDesconto = (Preco – (Preco * 0.25)) from Medicamento
SELECT Nome, [Efeito Colateral] = EfeitoColateral from Medicamento
SELECT [Código do Paciente] = CodPaciente, [Número de Telefone] = NumTelefo-ne from Telefone
SELECT Nome from Paciente WHERE Nome < ‘M’ and DataInicioConv > ‘2017’
SELECT Nome from Medicamento WHERE Preco < 10 or Indicacao = ‘Livre’
SELECT Especialidade from Especialidade WHERE not (Departamento = ‘Depto 3’)
SELECT Nome from Hospital WHERE Nome like ‘%z%’
SELECT Especialidade from Especialidade WHERE Especialidade like ‘[C-O]%’
SELECT Nome from Medicamento WHERE Nome like ‘%l’
SELECT Nome from Paciente WHERE Endereco not like ‘%O%’
SELECT Nome from Paciente WHERE DataInicioConv not like ‘2018%’
SELECT NomeMedico from Medico WHERE NomeMedico not like ‘[JÁ]%’
SELECT Nome from Medicamento WHERE Preco between 9.00 and 15.00
SELECT Especialidade from Especialidade WHERE Departamento between ‘Dep-to 2’ and ‘Depto 5’
SELECT Nome from Convenio WHERE Nome not between ‘L’ and ‘S’
SELECT Nome from Medicamento WHERE Nome not between ‘B’ and ‘E’
SELECT * from Especialidade WHERE Departamento in (‘Depto 1’, ‘Depto 3’)
SELECT * from Paciente WHERE CodConvenio in (1, 3)
SELECT * from Medicamento WHERE EfeitoColateral not in (‘Dor de cabeça’, ‘So-nolência’)
SELECT * from Convenio WHERE Nome not in (‘Luz Convênios’, ‘Santo Amaro’)
SELECT * from Medicamento WHERE EfeitoColateral is null
SELECT * from Medicamento WHERE Indicacao is not null


SELECT max (Preco) from Medicamento 
SELECT min (Preco) from Medicamento
SELECT avg (Preco) from Medicamento
SELECT count (*) from IdPaciente where DataInicioConv >= '2013'
SELECT Nome, Preco from Medicamento order by Preco asc 
SELECT distinct Departamento from Especialidade
SELECT top 5 * from Consulta
SELECT IdEspecialidade, count (*) from Medico group by IdEspecialidade
SELECT IdConvenio, count (*) from Paciente group by IdConvenio 
SELECT IdPaciente from Telefone grup by IdPaciente having count (*) >=3
SELECT M.NomeMedico, E.Especialidade from Medico as M inner join  Especialidade as E ON M.IdEspecialidade = E.IdEspecialidade
SELECT P.Nome, Conv.Nome from Paciente as P inner join Covenio as Conv on P.IdConvenio = IdConvenio
SELECT PaciMedi.Nome, Total = sum (Medi.Preco) from Paciente as PaciMedi inner join Consulta as Conv 
on PaciMedi.IdPaciente = Conv.IdPaciente inner join Prescricao as Presc 
on PaciMedi.IdConsulta = Presc.IdConsulta inner join Medicamento as M 
on Presc.IdMedicamento = M.IdMedicamento group by PaciMedi.Nome order by total
SELECT Nome from Hospital where IdHospital in (select IdHospital from HospitalMedico where DataAdmissao >='2012-07-01')
SELECT M.NomeMedico, E.Especialidade from Medico as M inner join Especialidade as E on M.IdEspecialidade = E.IdEspecialidade where M.Crm (SELECT Crm 
HospitalMedico where DataAdmissao >= '2011-01-01')

backup database Hospital
to disk = 'C:/Hosp/backup.bak'
with
init,
name = 'Hoosp',
retaindays = 1

backup database Hospital
to disk = 'C:/Hosp/backup.bak'
with
name = 'Hoosp',
retaindays = 1


backup database Hospital
to disk = 'C:/Hosp/backup.bak'
with
differential,
name = 'Hoosp',
retaindays = 1

backup database Hospital
to disk = 'C:/Hosp/backup.bak'
with
differential,
name = 'Hoosp',
retaindays = 1

backup database Hospital
to disk = 'C:/Hosp/backup.bak'
with
differential,
name = 'Hoosp',
retaindays = 1

restore database Hospital 
from disk = 'C:/Hosp/backup.bak'
with 
norecovery, 
file = 2
