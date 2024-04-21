SELECT 
    e.EntityID,
    e.Entity,
    e.Code,
    AVG(NULLIF(ic.Number_rabies, '')) AS average_rabies,
    MIN(NULLIF(ic.Number_rabies, '')) AS min_rabies,
    MAX(NULLIF(ic.Number_rabies, '')) AS max_rabies,
    SUM(NULLIF(ic.Number_rabies, '')) AS sum_rabies
FROM 
    infectious_cases ic
JOIN 
    entities e ON ic.EntityID = e.EntityID
WHERE 
    ic.Number_rabies <> '' AND ic.Number_rabies IS NOT NULL
GROUP BY 
    e.EntityID
ORDER BY 
    average_rabies DESC
LIMIT 10;
