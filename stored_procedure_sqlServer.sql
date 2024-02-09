--Verifica se existe
--Apaga se já existe
IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE TYPE = 'P' AND NAME = 'procedureNameEx1')
  BEGIN
    DROP PROCEDURE procedureNameEx1
  END
GO

IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE TYPE = 'P' AND NAME = 'procedureNameEx2')
  BEGIN
    DROP PROCEDURE procedureNameEx2
  END
GO

IF EXISTS (SELECT 1 FROM SYS.OBJECTS WHERE TYPE = 'P' AND NAME = 'procedureNameEx3')
  BEGIN
    DROP PROCEDURE procedureNameEx3
  END
GO

--Stored procedure sem parametros
CREATE PROCEDURE procedureNameEx1
AS
SELECT * FROM tableName
GO

CREATE PROCEDURE procedureNameEx2
@SOME_ID  INTEGER
AS
SELECT * FROM tableName
WHERE idFiled = @SOME_ID
GO

CREATE PROCEDURE procedureNameEx3
@DATA_INI  DATE,
@DATA_FINAL DATE
AS
SELECT * FROM tableName A
INNER JOIN otherTableName B
ON (B.SOME_ID = A.SOME_ID)
WHERE SOME_DATA BETWEEN @DATA_INI AND @DATA_FINAL
GO

--Comando para executar
EXEC procedureNameEx1
EXEC procedureNameEx2 2 --seleciona apenas os campo com id=2
EXEC procedureNameEx3 '2024-01-01', '2024-01-25' --seleciona apenas os campo com id=2
