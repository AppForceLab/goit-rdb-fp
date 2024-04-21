-- Створення нової таблиці `entities`, якщо вона не існує.
CREATE TABLE IF NOT EXISTS entities (
  EntityID INT AUTO_INCREMENT PRIMARY KEY,
  Entity VARCHAR(255) NOT NULL,
  Code VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

-- Вставка унікальних сутностей до таблиці `entities`.
INSERT INTO entities (Entity, Code)
SELECT DISTINCT Entity, Code
FROM infectious_cases;

-- Додавання стовпця `EntityID` з ініціалізованим значенням 0 до таблиці `infectious_cases`.
ALTER TABLE infectious_cases
ADD COLUMN EntityID INT NOT NULL DEFAULT 0;

-- Оновлення стовпця `EntityID` в таблиці `infectious_cases` на основі даних з таблиці `entities`.
SET SQL_SAFE_UPDATES = 0;
UPDATE infectious_cases ic
JOIN entities e ON ic.Entity = e.Entity AND ic.Code = e.Code
SET ic.EntityID = e.EntityID;
SET SQL_SAFE_UPDATES = 1;

-- Видалення старих стовпців `Entity` та `Code` з таблиці `infectious_cases`.
ALTER TABLE infectious_cases
DROP COLUMN Entity,
DROP COLUMN Code;

-- Додавання обмеження зовнішнього ключа до таблиці `infectious_cases`.
ALTER TABLE infectious_cases
ADD CONSTRAINT fk_entity
FOREIGN KEY (EntityID) REFERENCES entities(EntityID);

