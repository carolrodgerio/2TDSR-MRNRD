SELECT
    tipo_alerta,
    COUNT(*) AS quantidade_alertas
FROM
    alerta
GROUP BY
    tipo_alerta
ORDER BY
    quantidade_alertas DESC;
