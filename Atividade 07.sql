USE HospitalBD

-- 1)
CREATE FUNCTION FE_DiasDesdeUltimaConsulta (@DataUltimaConsulta datetime) 
RETURNS int AS
BEGIN
	DECLARE @Data int
	SELECT @Data = DATEDIFF(day, @DataUltimaConsulta, GETDATE())
	RETURN @Data
END

SELECT Paciente.IdPaciente, Paciente.Nome, MIN(dbo.FE_DiasDesdeUltimaConsulta(Consulta.DataConsulta)) AS 'Dias desde ultima consulta' FROM Paciente
INNER JOIN Consulta ON Paciente.IdPaciente = Consulta.IdPaciente
GROUP BY Paciente.IdPaciente, Paciente.Nome


-- 2)
CREATE FUNCTION FE_VerificaData (@DataToValidate datetime)
RETURNS bit AS
BEGIN
	DECLARE @response bit
	
	if(isDate(@DataToValidate) = 1 and DATEDIFF(day, @DataToValidate, GETDATE()) >= 0)
		SET @response = 1
	else
		SET @response = 0
	
	RETURN @response
END


ALTER TABLE HospitalMedico ADD CONSTRAINT CK_Func_DataAdmissao CHECK(dbo.FE_VerificaData(DataAdmissao) = 1)


-- 3)
CREATE FUNCTION FTV_ConveniosSemPaciente () 
RETURNS Table
RETURN (

	SELECT Convenio.IdConvenio, Convenio.Nome FROM Convenio
	LEFT JOIN Paciente ON Paciente.IdConvenio = Convenio.IdConvenio
	GROUP BY Convenio.IdConvenio, Convenio.Nome
	HAVING COUNT(Paciente.IdConvenio) = 0
)

SELECT * FROM dbo.FTV_ConveniosSemPaciente()


-- 4)
CREATE FUNCTION FTV_PacientesComNoMinimoXConsultas (@NumMinConsultas int) 
RETURNS Table
RETURN (

	SELECT Paciente.IdPaciente, Paciente.Nome, COUNT(Consulta.IdConsulta) AS 'Quantidade de consultas' FROM Paciente
	INNER JOIN Consulta ON Paciente.IdPaciente = Consulta.IdPaciente
	GROUP BY Paciente.IdPaciente, Paciente.Nome
	HAVING COUNT(Consulta.IdConsulta) >= @NumMinConsultas
)

SELECT * FROM dbo.FTV_PacientesComNoMinimoXConsultas(2)


-- 5)
CREATE FUNCTION FTV_SelecionaMedicosPorEspecialidade (@IdEspecialidade int = null) 
RETURNS @TableSelecionaMedicosPorEspecialidade Table(CRM int, Nome varchar(100), Especialidade varchar(60), Departamento varchar(80)) AS
BEGIN

	INSERT @TableSelecionaMedicosPorEspecialidade (CRM, Nome, Especialidade, Departamento)
	SELECT Medico.Crm, Medico.NomeMedico, Especialidade.Especialidade, Especialidade.Departamento FROM Medico
	INNER JOIN Especialidade ON Medico.IdEspecialidade = Especialidade.IdEspecialidade
	WHERE Especialidade.IdEspecialidade = @IdEspecialidade

	if (@@ROWCOUNT = 0)
		INSERT @TableSelecionaMedicosPorEspecialidade VALUES(0, 'Nenhum dado encontrado', '', '')

	RETURN
END

SELECT * FROM dbo.FTV_SelecionaMedicosPorEspecialidade(10)


-- 6)
CREATE PROC	SP_InsereHospital (@Nome varchar(100), @Endereco varchar(100)) AS
BEGIN
	INSERT INTO Hospital VALUES (@Nome, @Endereco)
END

EXEC dbo.SP_InsereHospital @Nome='Novo hospital', @Endereco='Nova localização'
SELECT * FROM Hospital


-- 7)
CREATE PROC SP_AtualizaPrecoMedicamento (@Nome varchar(80), @PercentualAumento decimal) AS
BEGIN
	UPDATE Medicamento SET Preco = Preco + (Preco * (@PercentualAumento / 100))
	WHERE Nome = @Nome
END

SELECT * FROM Medicamento
EXEC dbo.SP_AtualizaPrecoMedicamento @Nome='Novalgina', @PercentualAumento=2


-- 8)
CREATE PROC SP_ExcluiEspecialidade (@IdEspecialidade int) AS
BEGIN
	DELETE Especialidade WHERE IdEspecialidade = @IdEspecialidade
END	

EXEC dbo.SP_ExcluiEspecialidade @IdEspecialidade=6	

