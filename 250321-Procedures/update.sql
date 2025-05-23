CREATE OR REPLACE PROCEDURE prd_update_pais (
    p_cod_pais NUMBER,
    p_nom_pais VARCHAR2
) AS
BEGIN
    UPDATE pais
    SET
        nom_pais = p_nom_pais
    WHERE
        cod_pais = p_cod_pais;

    COMMIT;
END;
