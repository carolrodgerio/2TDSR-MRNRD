SET SERVEROUTPUT ON;

DECLARE
    par   NUMBER := 0;
    impar NUMBER := 0;
BEGIN
    FOR x IN 1..157 LOOP
        IF MOD(x, 2) = 0 THEN
            par := par + 1;
        ELSE
            impar := impar + 1;
        END IF;
    END LOOP;

    dbms_output.put_line('A QUANTIDADE DE NÚMEROS PARES É: ' || par);
    dbms_output.put_line('A QUANTIDADE DE NÚMEROS ÍMPARES É: ' || impar);
END;

-- mod = resto da divisão
