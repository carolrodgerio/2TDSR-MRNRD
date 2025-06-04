SELECT
    d.tipo_dispositivo,
    COUNT(rs.id_sinal) AS total_sinais
FROM
    dispositivo               d
    LEFT JOIN relacionamento_sinal_disp rs ON d.id_dispositivo = rs.id_dispositivo
GROUP BY
    d.tipo_dispositivo
ORDER BY
    total_sinais DESC;
