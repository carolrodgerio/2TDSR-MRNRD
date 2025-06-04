-- inserção

CREATE OR REPLACE PROCEDURE inserir_login (
    p_login      VARCHAR2,
    p_senha      VARCHAR2,
    p_id_usuario NUMBER,
    p_id_tipo    NUMBER
) AS
BEGIN
    INSERT INTO login VALUES ( p_login,
                               p_senha,
                               p_id_usuario,
                               p_id_tipo );

END;

-- atualização

CREATE OR REPLACE PROCEDURE atualizar_login (
    p_login VARCHAR2,
    p_senha VARCHAR2
) AS
BEGIN
    UPDATE login
    SET
        senha = p_senha
    WHERE
        login = p_login;

END;

-- exclusão

CREATE OR REPLACE PROCEDURE excluir_login (
    p_login VARCHAR2
) AS
BEGIN
    DELETE FROM login
    WHERE
        login = p_login;

END;

-- execução

BEGIN
    inserir_login('carlos', 'senha123', 1, 1);
    inserir_login('ana', 'senha456', 2, 2);
    inserir_login('marcos', 'senha789', 3, 3);
    inserir_login('juliana', 'senhaabc', 4, 4);
    inserir_login('fernanda', 'senhadef', 5, 5);
END;
