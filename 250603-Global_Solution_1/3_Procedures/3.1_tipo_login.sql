-- inserção

CREATE OR REPLACE PROCEDURE inserir_tipo_login (
    p_id_tipo   NUMBER,
    p_descricao VARCHAR2
) AS
BEGIN
    INSERT INTO tipo_login VALUES ( p_id_tipo,
                                    p_descricao );

END;

-- atualização

CREATE OR REPLACE PROCEDURE atualizar_tipo_login (
    p_id_tipo   NUMBER,
    p_descricao VARCHAR2
) AS
BEGIN
    UPDATE tipo_login
    SET
        descricao = p_descricao
    WHERE
        id_tipo = p_id_tipo;

END;

-- exclusão

CREATE OR REPLACE PROCEDURE excluir_tipo_login (
    p_id_tipo NUMBER
) AS
BEGIN
    DELETE FROM tipo_login
    WHERE
        id_tipo = p_id_tipo;

END;

-- execução

BEGIN
    inserir_tipo_login(1, 'ADM');
    inserir_tipo_login(2, 'Usuário');
    inserir_tipo_login(3, 'ADM');
    inserir_tipo_login(4, 'Usuário');
    inserir_tipo_login(5, 'ADM');
END;
