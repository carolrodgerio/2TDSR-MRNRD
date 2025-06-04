CREATE OR REPLACE FUNCTION buscar_nome_usuario (
    p_id_usuario IN NUMBER
) RETURN VARCHAR2 IS
    v_nome VARCHAR2(50);
BEGIN
    SELECT
        nome
    INTO v_nome
    FROM
        usuario
    WHERE
        id_usuario = p_id_usuario;

    RETURN v_nome;
EXCEPTION
    WHEN no_data_found THEN
        RETURN 'Usuário não encontrado';
END;

SELECT
    buscar_nome_usuario(1)
FROM
    dual;
