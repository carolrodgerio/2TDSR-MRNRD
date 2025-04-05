CREATE OR REPLACE FUNCTION cal_fgts (
    sal NUMBER
) RETURN NUMBER IS
BEGIN
    RETURN sal * 0.08;
END;

SELECT
    cal_fgts(1500)
FROM
    dual;
