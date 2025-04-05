SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE calc_fgts IS
    valor NUMBER;
BEGIN
    valor := cal_fgts(1500);
    dbms_output.put_line('O valor do cálculo é: ' || valor);
END;

EXEC calc_fgts();
