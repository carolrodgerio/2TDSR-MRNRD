-- inserção

CREATE OR REPLACE PROCEDURE inserir_dispositivo (
    p_id_dispositivo   NUMBER,
    p_tipo_dispositivo VARCHAR2,
    p_status           VARCHAR2,
    p_id_usuario       NUMBER
) AS
BEGIN
    INSERT INTO dispositivo VALUES ( p_id_dispositivo,
                                     p_tipo_dispositivo,
                                     p_status,
                                     p_id_usuario );

END;

-- atualização

CREATE OR REPLACE PROCEDURE atualizar_dispositivo (
    p_id_dispositivo NUMBER,
    p_status         VARCHAR2
) AS
BEGIN
    UPDATE dispositivo
    SET
        status = p_status
    WHERE
        id_dispositivo = p_id_dispositivo;

END;

-- exclusão

CREATE OR REPLACE PROCEDURE excluir_dispositivo (
    p_id_dispositivo NUMBER
) AS
BEGIN
    DELETE FROM dispositivo
    WHERE
        id_dispositivo = p_id_dispositivo;

END;

-- execução

BEGIN
    inserir_dispositivo(1, 'Sensor', 'Ativo', 1);
    inserir_dispositivo(2, 'RUNA', 'Ativo', 2);
    inserir_dispositivo(3, 'Sensor', 'Inativo', 3);
    inserir_dispositivo(4, 'Central', 'Ativo', 4);
    inserir_dispositivo(5, 'Sensor', 'Stand-by', 5);
END;
