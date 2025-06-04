-- inserção

CREATE OR REPLACE PROCEDURE inserir_alerta (
    p_id_alerta      NUMBER,
    p_tipo_alerta    VARCHAR2,
    p_conteudo       CLOB,
    p_data_hora      TIMESTAMP,
    p_status         VARCHAR2,
    p_nivel          VARCHAR2,
    p_id_sinal       NUMBER,
    p_id_localizacao NUMBER
) AS
BEGIN
    INSERT INTO alerta VALUES ( p_id_alerta,
                                p_tipo_alerta,
                                p_conteudo,
                                p_data_hora,
                                p_status,
                                p_nivel,
                                p_id_sinal,
                                p_id_localizacao );

END;

-- atualização

CREATE OR REPLACE PROCEDURE atualizar_alerta (
    p_id_alerta NUMBER,
    p_status    VARCHAR2,
    p_nivel     VARCHAR2
) AS
BEGIN
    UPDATE alerta
    SET
        status = p_status,
        nivel = p_nivel
    WHERE
        id_alerta = p_id_alerta;

END;

-- exclusão

CREATE OR REPLACE PROCEDURE excluir_alerta (
    p_id_alerta NUMBER
) AS
BEGIN
    DELETE FROM alerta
    WHERE
        id_alerta = p_id_alerta;

END;

-- execução

BEGIN
    inserir_alerta(1, 'Climático', 'Possibilidade de chuvas fortes', systimestamp, 'Emitido',
                   'Alto', 1, 1);

    inserir_alerta(2, 'Climático', 'Possibilidade de ventos fortes', systimestamp, 'Pendente',
                   'Médio', 2, 2);

    inserir_alerta(3, 'Climático', 'Possibilidade de chuvas fortes', systimestamp, 'Emitido',
                   'Médio', 3, 3);

    inserir_alerta(4, 'Evacuação', 'Enchente na região', systimestamp, 'Cancelado',
                   'Alto', 4, 4);

    inserir_alerta(5, 'Emergência', 'Terremoto na região', systimestamp, 'Emitido',
                   'Alto', 5, 5);

END;
