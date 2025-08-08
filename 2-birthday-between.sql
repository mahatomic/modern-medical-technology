-- Вариант 1. Фильтрация через BETWEEN
SELECT NOM || ' ' ||  PRENOM || ' ' || COALESCE(PATRONYME, '') AS "ФИО", 
	CASE POL WHEN '0' THEN 'М' ELSE 'Ж' END AS "Пол",
    NE_LE AS "Дата рождения"
FROM PATIENTS
WHERE NE_LE BETWEEN '1990-01-01' AND '1991-02-01';

-- Вариант 2. Фильтрация через операторы сравнения
SELECT NOM || ' ' ||  PRENOM || ' ' || COALESCE(PATRONYME, '') AS "ФИО", 
	CASE POL WHEN '0' THEN 'М' ELSE 'Ж' END AS "Пол",
    NE_LE AS "Дата рождения"
FROM PATIENTS
WHERE NE_LE >= '1990-01-01' AND NE_LE <= '1991-02-01';