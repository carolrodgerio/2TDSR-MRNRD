CREATE OR REPLACE FUNCTION fnc_percentual_desconto (
    p_pedido NUMBER
) RETURN NUMBER IS
    v_desc NUMBER;
    program_error EXCEPTION;
    zero_divide EXCEPTION;
    no_data_found EXCEPTION;
BEGIN
    SELECT
        SUM(val_desconto)
    INTO v_desc
    FROM
             pedido a
        INNER JOIN item_pedido b ON ( a.cod_pedido = b.cod_pedido )
    WHERE
        a.cod_pedido = p_pedido
    GROUP BY
        a.cod_pedido;

EXCEPTION
    WHEN program_error THEN
        dbms_output.put_line('Tente novamente.');
    WHEN zero_divide THEN
        dbms_output.put_line('Impossível dividir por zero.');
    WHEN no_data_found THEN
        dbms_output.put_line('Pedido inexistente.');
        RETURN v_desc;
END fnc_percentual_desconto;
