SET SERVEROUTPUT ON;

DECLARE
    valor_carro number := &DIGITE_VALOR_DO_CARRO;
BEGIN
    dbms_output.put_line('VALOR DO CARRO: ' || valor_carro);
    dbms_output.put_line('ENTRADA: ' || valor_carro * 0.2);
    dbms_output.put_line('VALOR EM 6x: ' || valor_carro * 0.8 * 1.1 || ', SENDO CADA PARCELA NO VALOR DE: ' || valor_carro * 0.8 * 1.1 / 6);
    dbms_output.put_line('VALOR EM 12x: ' || valor_carro * 0.8 * 1.15 || ', SENDO CADA PARCELA NO VALOR DE: ' || valor_carro * 0.8 * 1.15 / 12);
    dbms_output.put_line('VALOR EM 18x: ' || valor_carro * 0.8 * 1.2 || ', SENDO CADA PARCELA NO VALOR DE: ' || valor_carro * 0.8 * 1.2 / 18);
END;