SET SERVEROUTPUT ON;

DECLARE
    salario_minimo number := &DIGITE_SALARIO_MINIMO;
BEGIN
    dbms_output.put_line('SAL�RIO REAJUSTADO: ' || salario_minimo * 1.25);
END;