-- Запрос без прямого обращения к таблицам возможен через создание представлений, например:

-- Создание представления для пациентов
CREATE VIEW PATIENTS_VIEW AS
SELECT 
    PATIENTS_ID,
    NOM || ' ' || PRENOM || ' ' || COALESCE(PATRONYME, '') AS FULL_NAME,
    POL,
    NE_LE
FROM PATIENTS;

-- Создание представления для расписания
CREATE VIEW PLANNING_VIEW AS
SELECT 
    pl.PLANNING_ID AS "id",
    pv.FULL_NAME AS "ФИО пациента",
    md.NOM || ' ' ||  md.PRENOM AS "ФИО врача",
    md.SPECIALISATION AS "Специализация врача",
    pc.NAME AS "Название кабинета",
    pl.HEURE AS "Начало приема",
    pl.DUREE AS "Длительность приема в минутах"
FROM PLANNING pl
JOIN PL_CABINETS pc
ON pl.PL_CABINETS_ID = pc.PL_CABINETS_ID
JOIN MEDECINS md
ON pl.MEDECINS_ID = md.MEDECINS_ID
JOIN PATIENTS_VIEW pv
ON pl.PATIENTS_ID = pv.PATIENTS_ID;

-- Запрос к представлениям
SELECT * FROM PLANNING_VIEW;