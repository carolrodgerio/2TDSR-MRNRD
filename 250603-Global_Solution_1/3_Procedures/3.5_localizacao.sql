-- inserção

CREATE OR REPLACE PROCEDURE inserir_localizacao (
    p_id_localizacao NUMBER,
    p_latitude       NUMBER,
    p_longitude      NUMBER,
    p_descricao      VARCHAR2,
    p_id_dispositivo NUMBER
) AS
BEGIN
    INSERT INTO localizacao VALUES ( p_id_localizacao,
                                     p_latitude,
                                     p_longitude,
                                     p_descricao,
                                     p_id_dispositivo );

END;

-- atualização

CREATE OR REPLACE PROCEDURE atualizar_localizacao (
    p_id_localizacao NUMBER,
    p_descricao      VARCHAR2
) AS
BEGIN
    UPDATE localizacao
    SET
        descricao = p_descricao
    WHERE
        id_localizacao = p_id_localizacao;

END;

-- exclusão

CREATE OR REPLACE PROCEDURE excluir_localizacao (
    p_id_localizacao NUMBER
) AS
BEGIN
    DELETE FROM localizacao
    WHERE
        id_localizacao = p_id_localizacao;

END;

-- execução

BEGIN
    inserir_localizacao(1, -23.550520, -46.633308, 'Centro SP', 1);

    inserir_localizacao(2, -22.903539, -43.209587, 'Centro RJ', 2);

    inserir_localizacao(3, -19.815700, -43.954200, 'Centro BH', 3);

    inserir_localizacao(4, -30.034600, -51.217700, 'Centro POA', 4);

    inserir_localizacao(5, -3.717220, -38.543300, 'Centro Fortaleza', 5);

END;
