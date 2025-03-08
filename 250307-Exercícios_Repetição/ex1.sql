SET SERVEROUTPUT ON;

BEGIN
    FOR x IN 1..10 LOOP
        dbms_output.put_line(x * 150);
    END LOOP;
END;
