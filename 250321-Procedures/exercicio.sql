-- crie uma procedure para trazer o total de pedidos de um determinado cliente

CREATE OR REPLACE PROCEDURE hist_pedidos (
    cod_client NUMBER
) AS
BEGIN FOR x IN (
    SELECT
        a.cod_cliente,
        b.nom_cliente,
        d.nom_produto,
        SUM(a.val_total_pedido) total
    FROM
             pedido a
        INNER JOIN cliente     b ON ( a.cod_cliente = b.cod_cliente )
        INNER JOIN item_pedido c ON ( a.cod_pedido = c.cod_pedido )
        INNER JOIN produto     d ON ( c.cod_produto = d.cod_produto )
    WHERE
        a.cod_cliente = cod_cliente
    GROUP BY
        a.cod_cliente,
        b.nom_cliente,
        d.nom_produto
) LOOP dbms_output.put_line(x.cod_cliente
                            || 'TOTAL DE PEDIDOS '
                            || x.total);
END HIST_PEDIDOS ;
