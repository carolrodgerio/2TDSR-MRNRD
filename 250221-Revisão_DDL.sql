SELECT
    nom_pais,
    nom_estado,
    COUNT(nom_cidade) "QTD CIDADE"
FROM
    pais   a
    LEFT JOIN estado b ON ( a.cod_pais = b.cod_pais )
    INNER JOIN cidade c ON ( b.cod_estado = c.cod_estado )
WHERE
    a.nom_pais = 'Brazil'
GROUP BY
    nom_pais,
    nom_estado
HAVING
    COUNT(nom_cidade) < 10
ORDER BY
    3 DESC
