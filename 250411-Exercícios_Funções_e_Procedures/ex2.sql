CREATE OR REPLACE FUNCTION fnc_percentual_desconto (
    p_cod_pedido NUMBER
) RETURN NUMBER IS
    media_produtos NUMBER;
    program_error EXCEPTION;
    zero_divide EXCEPTION;
BEGIN
    SELECT
        AVG(qtd_item)
    INTO media_produtos
    FROM
             pedido a
        INNER JOIN item_pedido b ON ( a.cod_pedido = b.cod_pedido )
    WHERE
        a.cod_pedido = p_cod_pedido
    GROUP BY
        a.cod_pedido;

EXCEPTION
    WHEN program_error THEN
        dbms_output.put_line('Tente novamente.');
    WHEN zero_divide THEN
        dbms_output.put_line('Impossível dividir por zero.');
        RETURN media_produtos;
END fnc_percentual_desconto;
