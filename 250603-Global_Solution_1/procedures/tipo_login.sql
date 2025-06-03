CREATE OR REPLACE PROCEDURE sp_insert_tipo_login (
    p_id_tipo NUMBER,
    p_descricao VARCHAR2,
    p_login VARCHAR2
) IS
BEGIN
    INSERT INTO tipo_login (id_tipo, descricao, login)
    VALUES (p_id_tipo, p_descricao, p_login);
END;

CREATE OR REPLACE PROCEDURE sp_update_tipo_login (
    p_id_tipo NUMBER,
    p_descricao VARCHAR2,
    p_login VARCHAR2
) IS
BEGIN
    UPDATE tipo_login SET
        descricao = p_descricao,
        login = p_login
    WHERE id_tipo = p_id_tipo;
END;

CREATE OR REPLACE PROCEDURE sp_delete_tipo_login (
    p_id_tipo NUMBER
) IS
BEGIN
    DELETE FROM tipo_login WHERE id_tipo = p_id_tipo;
END;

BEGIN
    sp_insert_tipo_login(1, 'ADM', 'administrador ');
    sp_insert_tipo_login(2, 'Usuário', 'usuario');
    sp_insert_tipo_login(3, 'ADM', 'gestor');
    sp_insert_tipo_login(4, 'Usuário', 'voluntario');
    sp_insert_tipo_login(5, 'ADM', 'suporte');
END;
