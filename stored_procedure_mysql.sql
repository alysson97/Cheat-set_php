-- Verifica se existe e apaga se já existir
DROP PROCEDURE IF EXISTS procedureNameEx1;
DROP PROCEDURE IF EXISTS procedureNameEx2;
DROP PROCEDURE IF EXISTS procedureNameEx3;

-- Stored procedure sem parâmetros
CREATE PROCEDURE procedureNameEx1()
BEGIN
    SELECT * FROM tableName;
END;

CREATE PROCEDURE procedureNameEx2(IN SOME_ID INT)
BEGIN
    SELECT * FROM tableName WHERE idFiled = SOME_ID;
END;

CREATE PROCEDURE procedureNameEx3(IN DATA_INI DATE, IN DATA_FINAL DATE)
BEGIN
    SELECT * FROM tableName A
    INNER JOIN otherTableName B ON B.SOME_ID = A.SOME_ID
    WHERE SOME_DATA BETWEEN DATA_INI AND DATA_FINAL;
END;

-- Comando para executar
CALL procedureNameEx1();
CALL procedureNameEx2(2); -- seleciona apenas os campos com id=2
CALL procedureNameEx3('2024-01-01', '2024-01-25'); --seleciona os campos cujas datas estejam entre o intervalo pedido
