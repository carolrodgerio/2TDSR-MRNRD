SET SERVEROUTPUT ON;

DECLARE
    idade    NUMBER;
    nome     VARCHAR2(30) := 'CAROL';
    endereco nome%TYPE := '&DIGITE_ENDEREÇO';
BEGIN
    idade := 39;
    dbms_output.put_line('A IDADE DECLARADA É: ' || idade);
    dbms_output.put_line('O NOME DECLARADO É: ' || nome);
    dbms_output.put_line('ENDEREÇO INFORMADO: ' || endereco);
END;
