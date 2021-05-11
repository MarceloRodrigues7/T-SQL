DELETE T
FROM
(
SELECT *
, DupRank = ROW_NUMBER() OVER (
              PARTITION BY Nome_Cplus
              ORDER BY Nome_Cplus asc
            )
FROM faturamento_empresa
) AS T
WHERE DupRank > 1 
