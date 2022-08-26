-- EXERCÍCIO 1
use HospitalBD

-- A)
CREATE VIEW VW_PacienteConvenio (NomePaciente, CPF, NomeConvenio) AS
SELECT p.Nome, p.CPF, c.Nome FROM Paciente AS p 
INNER JOIN Convenio c ON p.IdConvenio = c.IdConvenio

-- SELECT * FROM VW_PacienteConvenio

-- B)
CREATE VIEW VW_EspecialidadeQuantidadeMedicos (NomeEspecialidade, QuantidadeMedicos) AS
SELECT e.Especialidade, COUNT(m.IdEspecialidade) FROM Especialidade AS e 
INNER JOIN Medico m ON m.IdEspecialidade = e.IdEspecialidade
GROUP BY e.Especialidade

-- SELECT * FROM VW_EspecialidadeQuantidadeMedicos

-- C)
CREATE VIEW VW_ConsultaQuantValorMedicamentos (IdConsulta, QuantMedicamentos, ValorMedicamentos) AS
SELECT c.IdConsulta, COUNT(m.IdMedicamento), SUM(m.Preco) FROM Consulta AS c 
INNER JOIN Prescricao p ON p.IdConsulta = c.IdConsulta
INNER JOIN Medicamento m ON m.IdMedicamento = p.IdMedicamento
GROUP BY c.IdConsulta

-- SELECT * FROM VW_ConsultaQuantValorMedicamentos

-- D)
CREATE VIEW VW_MedicoHospital (NomeMedico, CRM, NomeHospital) AS
SELECT m.NomeMedico, m.Crm, h.Nome FROM Medico AS m 
INNER JOIN HospitalMedico hm ON hm.Crm = m.Crm
INNER JOIN Hospital h ON h.IdHospital = hm.IdHospital

-- SELECT * FROM VW_MedicoHospital

-- E)
CREATE VIEW VW_ConvenioQuantConsultas (NomeConvenio, QuantConsultas) AS
SELECT conv.Nome, SUM(cons.IdConsulta) FROM Convenio AS conv 
INNER JOIN Paciente p ON p.IdConvenio = conv.IdConvenio
INNER JOIN Consulta cons ON cons.IdPaciente = p.IdPaciente
GROUP BY conv.Nome

-- SELECT * FROM VW_VW_ConvenioQuantConsultas

-- F)
CREATE VIEW VW_PacienteQuantConsultas (NomePaciente, NomeConvenio, QuantConsultas) AS
SELECT p.Nome, c.Nome, COUNT(cons.IdConsulta) FROM Paciente AS p 
INNER JOIN Convenio c ON p.IdConvenio = c.IdConvenio
INNER JOIN Consulta cons ON cons.IdPaciente = p.IdPaciente
GROUP BY p.Nome, c.Nome

-- SELECT * FROM VW_PacienteQuantConsultas


-- EXERCÍCIO 3

CREATE TABLE #Livro (
	id int primary key,
	Titulo varchar(50),
	Edicao varchar(50),
	Autor varchar(50),
	Editora varchar(50),
	Isbn varchar(50),
	Area varchar(50),
	Preco money,
	Paginas int
)

SELECT * FROM #Livro


-- EXERCÍCIO 4

CREATE TABLE ##Livro (
	id int primary key,
	Titulo varchar(50),
	Edicao varchar(50),
	Autor varchar(50),
	Editora varchar(50),
	Isbn varchar(50),
	Area varchar(50),
	Preco money,
	Paginas int
)

SELECT * FROM ##Livro


-- EXERCÍCIO 5
CREATE TABLE #Hospital (
	IdHospital int,
	Nome varchar(50) NOT NULL,
	Endereco varchar(100) NOT NULL

	PRIMARY KEY (IdHospital)
)

INSERT INTO #Hospital (IdHospital, Nome, Endereco)
SELECT distinct Hospital.IdHospital, Hospital.Nome, Hospital.Endereco From Hospital 
INNER JOIN HospitalMedico hp ON hp.IdHospital = Hospital.IdHospital
INNER JOIN Consulta c ON hp.IdHospital = c.IdHospital
GROUP BY Hospital.IdHospital, Hospital.Nome, Hospital.Endereco
HAVING COUNT(c.IdConsulta)>=4


SELECT * FROM #Hospital

DROP TABLE #Hospital

