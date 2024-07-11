-- Filter bands by style 'Glam rock' and calculate their lifespan based on split and formation years
SELECT band_name, COALESCE(split, 2022) - formed AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
