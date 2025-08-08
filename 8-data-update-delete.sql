-- Пусть запросы на обновление и удаление данных будут для таблицы PLANNING

-- Обновление данных (30% записей)
-- Например, увеличим длительность приема на 15 минут
UPDATE PLANNING
SET DUREE = DUREE + 15
WHERE PLANNING_ID IN (
    SELECT PLANNING_ID
    FROM PLANNING
    ORDER BY HEURE
    LIMIT (SELECT COUNT(*) * 0.3 FROM PLANNING)
);

-- Удаление данных (30% записей)
-- Теперь удалим обновленные записи
DELETE FROM PLANNING
WHERE PLANNING_ID IN (
    SELECT PLANNING_ID 
    FROM PLANNING
    ORDER BY HEURE
    LIMIT (SELECT COUNT(*) * 0.3 FROM PLANNING)
);