DELETE T
FROM
(
SELECT *
, DupRank = ROW_NUMBER() OVER (
              PARTITION BY Coluna
              ORDER BY Coluna asc
            )
FROM tableDelete
) AS T
WHERE DupRank > 1 
