SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_usuarios IS
    SELECT
        id_usuario,
        nome,
        email,
        telefone
    FROM
        usuario
    ORDER BY
        nome;

    v_id_usuario usuario.id_usuario%TYPE;
    v_nome       usuario.nome%TYPE;
    v_email      usuario.email%TYPE;
    v_telefone   usuario.telefone%TYPE;
BEGIN
    OPEN c_usuarios;
    LOOP
        FETCH c_usuarios INTO
            v_id_usuario,
            v_nome,
            v_email,
            v_telefone;
        EXIT WHEN c_usuarios%notfound;
        dbms_output.put_line('ID: '
                             || v_id_usuario
                             || ' | Nome: '
                             || v_nome
                             || ' | E-mail: '
                             || nvl(v_email, 'Sem e-mail')
                             || ' | Telefone: '
                             || nvl(v_telefone, 'Sem telefone'));

    END LOOP;

    CLOSE c_usuarios;
END;
