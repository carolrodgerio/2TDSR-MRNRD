SET SERVEROUTPUT ON;

DECLARE
    valor_carro number := &DIGITE_VALOR_DO_CARRO;
BEGIN
    dbms_output.put_line('VALOR DA COMPRA: ' || valor_carro);
    dbms_output.put_line('FINANCIAMENTO: ' || valor_carro * 1.03);
    dbms_output.put_line('VALOR DAS PARCELAS: ' || valor_carro * 1.03 / 10);
END;