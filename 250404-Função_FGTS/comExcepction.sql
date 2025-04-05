CREATE OR REPLACE FUNCTION cal_fgts_exc (
    sal NUMBER
) RETURN NUMBER IS
    meu_erro EXCEPTION;
    v_sal NUMBER;
BEGIN
    v_sal := sal * 0.08;
    IF v_sal < 1000 THEN
        RAISE meu_erro;
    END IF;
    RETURN v_sal;
EXCEPTION
    WHEN meu_erro THEN
        raise_application_error(-20001, 'Seu cálculo de FGTS está abaixo de R$ 1.000,00');
END;

SELECT
    cal_fgts_exc(100000)
FROM
    dual;
