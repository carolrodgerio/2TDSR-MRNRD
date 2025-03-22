CREATE OR REPLACE PROCEDURE prd_insert_pais (
    p_cod_pais NUMBER,
    p_nom_pais VARCHAR2
) AS
BEGIN
    INSERT INTO pais VALUES (
        p_cod_pais,
        p_nom_pais
    );

    COMMIT;
END;
