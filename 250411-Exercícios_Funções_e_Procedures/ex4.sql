CREATE OR REPLACE PROCEDURE prc_relatorio_composicao_ativa (
    p_cod_produto NUMBER
) AS
BEGIN
    FOR x IN (
        SELECT
            a.cod_produto              "Código do produto",
            a.nom_produto              "Nome do produto",
            a.cod_barra                "Código de barras",
            b.dat_movimento_estoque    "Data de movimentação",
            b.qtd_movimentacao_estoque "Quantidade de movimentações"
        FROM
            produto           a
            LEFT JOIN movimento_estoque b ON a.cod_produto = b.cod_produto
        WHERE
            a.cod_produto = p_cod_produto
        GROUP BY
            a.cod_produto
    ) LOOP
        dbms_output.put_line(x."Código do produto");
        dbms_output.put_line(x."Nome do produto");
        dbms_output.put_line(x."Código de barras");
        dbms_output.put_line(x."Data de movimentação");
        dbms_output.put_line(x."Quantidade de movimentações");
    END LOOP;
EXCEPTION
    WHEN program_error THEN
        dbms_output.put_line('Tente novamente.');
END;
