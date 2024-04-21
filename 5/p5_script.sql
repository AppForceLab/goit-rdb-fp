DROP FUNCTION IF EXISTS CalculateYearDifference;
DELIMITER //
CREATE FUNCTION CalculateYearDifference(start_year INT)
RETURNS INT
DETERMINISTIC 
BEGIN
    -- Створюємо дату першого січня для заданого року
    DECLARE first_day_of_year DATE;
    SET first_day_of_year = MAKEDATE(start_year, 1);
    
    -- Повертаємо різницю в роках між сформованою датою і поточною датою
    RETURN TIMESTAMPDIFF(YEAR, first_day_of_year, CURDATE());
END //

DELIMITER ;
SELECT 
    Year,
    CalculateYearDifference(Year) AS YearsDifference
FROM 
    infectious_cases;