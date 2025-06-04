-- inserção

CREATE OR REPLACE PROCEDURE inserir_usuario (
    p_id_usuario NUMBER,
    p_nome       VARCHAR2,
    p_cpf        VARCHAR2,
    p_telefone   VARCHAR2,
    p_email      VARCHAR2
) AS
BEGIN
    INSERT INTO usuario VALUES ( p_id_usuario,
                                 p_nome,
                                 p_cpf,
                                 p_telefone,
                                 p_email );

END;

-- atualização

CREATE OR REPLACE PROCEDURE atualizar_usuario (
    p_id_usuario NUMBER,
    p_nome       VARCHAR2,
    p_email      VARCHAR2
) AS
BEGIN
    UPDATE usuario
    SET
        nome = p_nome,
        email = p_email
    WHERE
        id_usuario = p_id_usuario;

END;

-- exclusão

CREATE OR REPLACE PROCEDURE excluir_usuario (
    p_id_usuario NUMBER
) AS
BEGIN
    DELETE FROM usuario
    WHERE
        id_usuario = p_id_usuario;

END;

-- execução

BEGIN
    inserir_usuario(1, 'Carlos Silva', '12345678901', '11999998888', 'carlos@email.com');
    inserir_usuario(2, 'Ana Souza', '98765432100', '11999997777', 'ana@email.com');
    inserir_usuario(3, 'Marcos Lima', '45678912300', '21988887777', 'marcos@email.com');
    inserir_usuario(4, 'Juliana Mendes', '65432198700', '31977776666', 'juliana@email.com');
    inserir_usuario(5, 'Fernanda Rocha', '32165498700', '41966665555', 'fernanda@email.com');
END;
