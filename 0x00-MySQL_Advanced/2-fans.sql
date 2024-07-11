-- This query retrieves the origin of each metal band and the total number of fans from the metal_bands table.
-- The results are sorted in descending order by the number of fans.
SELECT origin, SUM(fans) AS nb_fans FROM metal_bands GROUP BY origin ORDER BY nb_fans DESC;