SELECT
    tipo_sinal,
    AVG(valor) AS media_valor
FROM
    sinal
WHERE
    processamento = 'S'
GROUP BY
    tipo_sinal
ORDER BY
    media_valor DESC;
