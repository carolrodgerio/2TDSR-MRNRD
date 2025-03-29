CREATE OR REPLACE PROCEDURE listarmovimentosestoqueproduto (
    p_cod_produto NUMBER
) AS
BEGIN
    FOR x IN (
        SELECT
            a.cod_produto                "Código do produto",
            a.dat_movimento_estoque      "Data de movimento",
            b.des_tipo_movimento_estoque "Descrição do movimento"
        FROM
                 movimento_estoque a
            INNER JOIN tipo_movimento_estoque b ON a.cod_tipo_movimento_estoque = b.cod_tipo_movimento_estoque
        WHERE
            cod_produto = p_cod_produto
    ) LOOP
        dbms_output.put_line(x."Código do produto");
        dbms_output.put_line(x."Data de movimento");
        dbms_output.put_line(x."Descrição do movimento");
        dbms_output.put_line('---');
    END LOOP;
END;
