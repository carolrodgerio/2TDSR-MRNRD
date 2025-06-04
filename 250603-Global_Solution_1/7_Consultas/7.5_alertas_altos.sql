SELECT
    u.nome,
    COUNT(a.id_alerta) AS total_alertas_altos
FROM
         usuario u
    JOIN relacionamento_usuario_alerta rua ON u.id_usuario = rua.id_usuario
    JOIN alerta                        a ON rua.id_alerta = a.id_alerta
WHERE
    a.nivel = 'Alto'
GROUP BY
    u.nome
ORDER BY
    total_alertas_altos DESC;
