CREATE OR REPLACE PROCEDURE listarpedidoclientes (
    p_cod_cliente NUMBER
) AS
BEGIN
    FOR x IN (
        SELECT
            cod_cliente      "Código do cliente",
            dat_pedido       "Data do pedido",
            val_total_pedido "Valor total do pedido"
        FROM
            pedido
        WHERE
            cod_cliente = p_cod_cliente
    ) LOOP
        dbms_output.put_line(x."Código do cliente");
        dbms_output.put_line(x."Data do pedido");
        dbms_output.put_line(x."Valor total do pedido");
        dbms_output.put_line(x."---");
    END LOOP;
END;
