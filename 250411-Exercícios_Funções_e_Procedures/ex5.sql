CREATE OR REPLACE PROCEDURE prc_relatorio_pedido (
    p_cod_pedido NUMBER
) AS
BEGIN
    FOR x IN (
        SELECT
            a.cod_pedido       "Código do pedido",
            a.val_total_pedido "Valor total do pedido",
            a.val_desconto     "Valor do desconto",
            a.status           "Status do pedido"
        FROM
                 pedido a
            INNER JOIN item_pedido b ON a.cod_pedido = b.cod_pedido
        WHERE
            a.cod_pedido = p_cod_pedido
        GROUP BY
            a.cod_pedido
    ) LOOP
        dbms_output.put_line(x."Código do pedido");
        dbms_output.put_line(x."Valor total do pedido");
        dbms_output.put_line(x."Valor do desconto");
        dbms_output.put_line(x."Status do pedido");
    END LOOP;
EXCEPTION
    WHEN program_error THEN
        dbms_output.put_line('Tente novamente.');
    WHEN no_data_found THEN
        dbms_output.put_line('Ausência de dados.');
END;
