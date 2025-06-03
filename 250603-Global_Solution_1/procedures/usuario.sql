CREATE OR REPLACE PROCEDURE sp_insert_usuario (
    p_id_usuario NUMBER,
    p_nome VARCHAR2,
    p_cpf VARCHAR2,
    p_telefone VARCHAR2,
    p_email VARCHAR2,
    p_tipo_usuario VARCHAR2
) IS
BEGIN
    INSERT INTO usuario (id_usuario, nome, cpf, telefone, email, tipo_usuario)
    VALUES (p_id_usuario, p_nome, p_cpf, p_telefone, p_email, p_tipo_usuario);
END;

CREATE OR REPLACE PROCEDURE sp_update_usuario (
    p_id_usuario NUMBER,
    p_nome VARCHAR2,
    p_cpf VARCHAR2,
    p_telefone VARCHAR2,
    p_email VARCHAR2,
    p_tipo_usuario VARCHAR2
) IS
BEGIN
    UPDATE usuario SET
        nome = p_nome,
        cpf = p_cpf,
        telefone = p_telefone,
        email = p_email,
        tipo_usuario = p_tipo_usuario
    WHERE id_usuario = p_id_usuario;
END;

CREATE OR REPLACE PROCEDURE sp_delete_usuario (
    p_id_usuario NUMBER
) IS
BEGIN
    DELETE FROM usuario WHERE id_usuario = p_id_usuario;
END;

BEGIN
    sp_insert_usuario(1, 'Ana', '12345678900', '11999990000', 'ana@email.com', 'PF');
    sp_insert_usuario(2, 'Carlos', '22345678901', '11988880000', 'carlos@email.com', 'Voluntário');
    sp_insert_usuario(3, 'Beatriz', '32345678902', '11977770000', 'beatriz@email.com', 'Gestor');
    sp_insert_usuario(4, 'Daniel', '42345678903', '11966660000', 'daniel@email.com', 'PF');
    sp_insert_usuario(5, 'Fernanda', '52345678904', '11955550000', 'fernanda@email.com', 'Voluntário');
END;
