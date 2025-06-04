SELECT
    u.nome,
    COUNT(s.id_solicitacao) AS total_solicitacoes
FROM
    usuario           u
    LEFT JOIN solicitacao_ajuda s ON u.id_usuario = s.id_usuario
GROUP BY
    u.nome
ORDER BY
    total_solicitacoes DESC;
