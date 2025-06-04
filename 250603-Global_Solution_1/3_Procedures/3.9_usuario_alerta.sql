-- inserção

CREATE OR REPLACE PROCEDURE inserir_rel_usuario_alerta (
    p_id_usuario NUMBER,
    p_id_alerta  NUMBER
) AS
BEGIN
    INSERT INTO relacionamento_usuario_alerta VALUES ( p_id_usuario,
                                                       p_id_alerta );

END;

-- atualização

CREATE OR REPLACE PROCEDURE atualizar_rel_usuario_alerta (
    p_id_usuario       NUMBER,
    p_id_alerta_antigo NUMBER,
    p_id_alerta_novo   NUMBER
) AS
BEGIN
    UPDATE relacionamento_usuario_alerta
    SET
        id_alerta = p_id_alerta_novo
    WHERE
            id_usuario = p_id_usuario
        AND id_alerta = p_id_alerta_antigo;

END;

-- exclusão

CREATE OR REPLACE PROCEDURE excluir_rel_usuario_alerta (
    p_id_usuario NUMBER,
    p_id_alerta  NUMBER
) AS
BEGIN
    DELETE FROM relacionamento_usuario_alerta
    WHERE
            id_usuario = p_id_usuario
        AND id_alerta = p_id_alerta;

END;

-- execução

BEGIN
    inserir_rel_usuario_alerta(1, 1);
    inserir_rel_usuario_alerta(2, 2);
    inserir_rel_usuario_alerta(3, 3);
    inserir_rel_usuario_alerta(4, 4);
    inserir_rel_usuario_alerta(5, 5);
END;
