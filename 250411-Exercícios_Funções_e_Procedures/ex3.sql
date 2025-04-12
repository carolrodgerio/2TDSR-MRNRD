CREATE OR REPLACE PROCEDURE prc_relatorio_estoque_produto (
    p_cod_produto NUMBER
) AS
BEGIN
    FOR x IN (
        SELECT
            a.cod_produto                "Código do produto",
            MAX(a.dat_movimento_estoque) "Data do movimento",
            SUM(b.qtd_produto)           "Total de unidades movimentadas"
        FROM
            movimento_estoque a
            LEFT JOIN produto_composto  b ON a.cod_produto = b.cod_produto
        WHERE
            a.cod_produto = p_cod_produto
        GROUP BY
            a.cod_produto
    ) LOOP
        dbms_output.put_line(x."Código do produto");
        dbms_output.put_line(x."Data do movimento");
        dbms_output.put_line(x."Total de unidades movimentadas");
    END LOOP;
EXCEPTION
    WHEN program_error THEN
        dbms_output.put_line('Tente novamente.');
    WHEN no_data_found THEN
        dbms_output.put_line('Ausência de dados.');
END;
