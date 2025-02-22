SET SERVEROUTPUT ON;

DECLARE
    valor_cambio number := &DIGITE_VALOR_DO_CAMBIO;
BEGIN
    dbms_output.put_line('45 DÓLARES PARA REAIS EQUIVALEM A : ' || 45 * valor_cambio || ' REAIS');
END;