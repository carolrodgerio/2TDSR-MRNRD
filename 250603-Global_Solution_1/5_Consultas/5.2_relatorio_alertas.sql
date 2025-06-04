SET SERVEROUTPUT ON;

DECLARE
    CURSOR c_relatorio IS
    SELECT
        s.tipo_sinal,
        COUNT(a.id_alerta) AS total_alertas
    FROM
        sinal  s
        LEFT JOIN alerta a ON a.id_sinal = s.id_sinal
                              AND a.id_localizacao = s.id_localizacao
    GROUP BY
        s.tipo_sinal
    ORDER BY
        total_alertas DESC;

    v_tipo_sinal    sinal.tipo_sinal%TYPE;
    v_total_alertas NUMBER;
BEGIN
    dbms_output.put_line('Relatório de Alertas por Tipo de Sinal');
    dbms_output.put_line('--//--');
    FOR rec IN c_relatorio LOOP
        dbms_output.put_line('Tipo de sinal: '
                             || rec.tipo_sinal
                             || ' | Total de alertas: '
                             || rec.total_alertas);
    END LOOP;

END;
