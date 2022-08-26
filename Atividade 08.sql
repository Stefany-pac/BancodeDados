use HospitalBD

-- 1)
CREATE TRIGGER TRG_IncluiDataAtualConsulta ON Consulta
AFTER insert, update
AS
BEGIN
	DECLARE @IdConsulta int, @DataConsulta datetime
	SELECT @IdConsulta=IdConsulta, @DataConsulta = DataConsulta FROM inserted

	IF (DATEDIFF(day, GETDATE(), @DataConsulta) < 0)
		UPDATE Consulta SET DataConsulta = GETDATE() WHERE IdConsulta = @IdConsulta
END

INSERT INTO Consulta VALUES (1, 101555, 5, '2022-01-05 00:00:00.000')
UPDATE Consulta SET Crm=101555 WHERE IdConsulta=22
SELECT * FROM consulta ORDER BY IdConsulta



-- 2)
CREATE TRIGGER TRG_ExcluiPaciente ON Paciente
INSTEAD OF delete
AS
BEGIN
	DECLARE @IdPaciente int
	SELECT @IdPaciente = IdPaciente FROM deleted

	DELETE FROM Telefone WHERE IdPaciente = @IdPaciente

	DELETE Prescricao FROM Prescricao P 
	INNER JOIN Consulta C ON C.IdConsulta = P.IdConsulta 
	WHERE C.IdPaciente = @IdPaciente

	DELETE FROM Consulta WHERE IdPaciente = @IdPaciente
	DELETE FROM Paciente WHERE IdPaciente = @IdPaciente

END

DELETE FROM Paciente WHERE IdPaciente = 10
SELECT * FROM Paciente


-- 3)
DISABLE TRIGGER TRG_IncluiDataAtualConsulta ON Consulta
ENABLE TRIGGER TRG_IncluiDataAtualConsulta ON Consulta

DISABLE TRIGGER TRG_ExcluiPaciente ON Paciente
ENABLE TRIGGER TRG_ExcluiPaciente ON Paciente