SELECT
    ic.Year,
    MAKEDATE(ic.Year, 1) AS FirstDayOfYear,
    CURDATE() AS CurrentDate,
    TIMESTAMPDIFF(YEAR, MAKEDATE(ic.Year, 1), CURDATE()) AS YearsDifference
FROM 
    infectious_cases AS ic;
