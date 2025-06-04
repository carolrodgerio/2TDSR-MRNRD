-- inserção

CREATE OR REPLACE PROCEDURE inserir_sinal (
    p_id_sinal       NUMBER,
    p_tipo_sinal     VARCHAR2,
    p_valor          NUMBER,
    p_unidade        VARCHAR2,
    p_data_hora      TIMESTAMP,
    p_processamento  CHAR,
    p_id_localizacao NUMBER
) AS
BEGIN
    INSERT INTO sinal VALUES ( p_id_sinal,
                               p_tipo_sinal,
                               p_valor,
                               p_unidade,
                               p_data_hora,
                               p_processamento,
                               p_id_localizacao );

END;

-- atualização

CREATE OR REPLACE PROCEDURE atualizar_sinal (
    p_id_sinal       NUMBER,
    p_id_localizacao NUMBER,
    p_valor          NUMBER
) AS
BEGIN
    UPDATE sinal
    SET
        valor = p_valor
    WHERE
            id_sinal = p_id_sinal
        AND id_localizacao = p_id_localizacao;

END;

-- exclusão

CREATE OR REPLACE PROCEDURE excluir_sinal (
    p_id_sinal       NUMBER,
    p_id_localizacao NUMBER
) AS
BEGIN
    DELETE FROM sinal
    WHERE
            id_sinal = p_id_sinal
        AND id_localizacao = p_id_localizacao;

END;

-- execução

BEGIN
    inserir_sinal(1, 'Chuva', 40, 'mm', systimestamp,
                  'S', 1);
    inserir_sinal(2, 'Vento', 20, 'm/s', systimestamp,
                  'N', 2);
    inserir_sinal(3, 'Chuva', 30, 'mm', systimestamp,
                  'S', 3);
    inserir_sinal(4, 'Enchente', 100, 'mm', systimestamp,
                  'N', 4);
    inserir_sinal(5, 'Terremoto', 10, '%', systimestamp,
                  'S', 5);
END;
