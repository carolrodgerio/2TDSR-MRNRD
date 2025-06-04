CREATE OR REPLACE FUNCTION contar_alertas_ativos_por_dispositivo (
    p_id_dispositivo IN NUMBER
) RETURN NUMBER IS
    v_total NUMBER;
BEGIN
    SELECT
        COUNT(*)
    INTO v_total
    FROM
             alerta a
        JOIN sinal s ON a.id_sinal = s.id_sinal
                        AND a.id_localizacao = s.id_localizacao
    WHERE
        s.id_localizacao IN (
            SELECT
                id_localizacao
            FROM
                localizacao
            WHERE
                id_dispositivo = p_id_dispositivo
        )
        AND a.status = 'Emitido';

    RETURN v_total;
END;

SELECT contar_alertas_ativos_por_dispositivo(1) FROM dual;
