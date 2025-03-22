CREATE OR REPLACE PROCEDURE prd_delete_pais (
    p_cod_pais NUMBER,
    p_nom_pais VARCHAR2
) AS
BEGIN
    DELETE FROM pais
    WHERE
        cod_pais = p_cod_pais;

    COMMIT;
END;
