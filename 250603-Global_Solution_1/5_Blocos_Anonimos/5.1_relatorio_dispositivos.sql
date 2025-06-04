DECLARE
    v_id_usuario     NUMBER := 1;
    CURSOR c_dispositivos IS
    SELECT
        d.id_dispositivo,
        d.status
    FROM
        dispositivo d
    WHERE
        d.id_usuario = v_id_usuario;

    v_id_dispositivo dispositivo.id_dispositivo%TYPE;
    v_status         dispositivo.status%TYPE;
BEGIN
    dbms_output.put_line('Dispositivos do usuário de ID: ' || v_id_usuario);
    dbms_output.put_line('--//--');
    FOR rec IN c_dispositivos LOOP
        v_id_dispositivo := rec.id_dispositivo;
        v_status := rec.status;
        dbms_output.put_line('ID do dispositivo: '
                             || v_id_dispositivo
                             || ' | Status: '
                             || v_status);
        IF v_status IN ( 'Inativo', 'Stand-by' ) THEN
            dbms_output.put_line('⚠️  Atenção: Este dispositivo não está operando normalmente.');
        ELSE
            dbms_output.put_line('✅ Dispositivo em operação.');
        END IF;

    END LOOP;

END;
