SELECT NOM || ' ' ||  PRENOM || ' ' || COALESCE(PATRONYME, '') AS "ФИО",
    NE_LE AS "Дата рождения",
    COUNT(*) - 1 AS "Количество однофамильцев"
FROM PATIENTS
WHERE NE_LE IS NOT NULL
GROUP BY NOM, PRENOM, PATRONYME, NE_LE
HAVING COUNT(*) > 2 AND COUNT(*) <= 5;