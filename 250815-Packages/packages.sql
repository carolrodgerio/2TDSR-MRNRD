CREATE TABLE aula_package (
    id            NUMBER,
    nome          VARCHAR2(30),
    email         VARCHAR2(50),
    data_cadastro DATE
);

CREATE OR REPLACE PACKAGE pkg_aula_pkg IS
    PROCEDURE prd_insert_cliente (
        p_id            NUMBER,
        p_nome          VARCHAR2,
        p_email         VARCHAR2,
        p_data_cadastro DATE
    );

    FUNCTION fc_contar_cliente RETURN NUMBER;

END pkg_aula_pkg;

CREATE OR REPLACE PACKAGE BODY pkg_aula_pkg AS

    PROCEDURE prd_insert_cliente (
        p_id            NUMBER,
        p_nome          VARCHAR2,
        p_email         VARCHAR2,
        p_data_cadastro DATE
    ) IS
    BEGIN
        INSERT INTO aula_package VALUES ( p_id,
                                          p_nome,
                                          p_email,
                                          p_data_cadastro );

        COMMIT;
    END prd_insert_cliente;

    FUNCTION fc_contar_cliente RETURN NUMBER IS
        v_total_cliente NUMBER;
    BEGIN
        SELECT
            COUNT(1)
        INTO v_total_cliente
        FROM
            aula_package;

        RETURN v_total_cliente;
    END fc_contar_cliente;

END pkg_aula_pkg;

SELECT
    pkg_aula_pkg.fc_contar_cliente
FROM
    dual;

CALL pkg_aula_pkg.prd_insert_cliente(10, 'Vergílio', 'pf1788@fiap.com', sysdate);
