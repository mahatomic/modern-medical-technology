-- Создание таблицы пациентов
CREATE TABLE PATIENTS (
    PATIENTS_ID INTEGER PRIMARY KEY,
    NOM VARCHAR(50) NOT NULL,
    PRENOM VARCHAR(50) NOT NULL,
    PATRONYME VARCHAR(50),
    POL VARCHAR(1) CHECK (POL IN ('0', '1')),
    NE_LE DATE,
    GOD_ROGDEN VARCHAR(4)
);

-- Создание таблицы врачей
CREATE TABLE MEDECINS (
    MEDECINS_ID INTEGER PRIMARY KEY,
    NOM VARCHAR(50) NOT NULL,
    PRENOM VARCHAR(50) NOT NULL,
    SPECIALISATION VARCHAR(50) NOT NULL
);

-- Создание таблицы кабинетов
CREATE TABLE PL_CABINETS (
    PL_CABINETS_ID INTEGER PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL
);

-- Создание таблицы расписания
CREATE TABLE PLANNING (
    PLANNING_ID INTEGER PRIMARY KEY,
    PATIENTS_ID INTEGER REFERENCES PATIENTS(PATIENTS_ID) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    HEURE TIMESTAMP NOT NULL,
    DUREE INTEGER NOT NULL CHECK (DUREE > 0),
    MEDECINS_ID INTEGER REFERENCES MEDECINS(MEDECINS_ID) 
        ON UPDATE CASCADE ON DELETE CASCADE,
    PL_CABINETS_ID INTEGER REFERENCES PL_CABINETS(PL_CABINETS_ID) 
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- Заполнение таблицы пациентов
INSERT INTO PATIENTS VALUES
(1, 'Иванов', 'Иван', 'Иванович', '0', '1990-05-15', '1990'),
(2, 'Петрова', 'Мария', 'Сергеевна', '1', '1991-01-20', '1991'),
(3, 'Сидоров', 'Алексей', 'Петрович', '0', '1985-07-10', '1985'),
(4, 'Кузнецова', 'Елена', 'Владимировна', '1', '1990-12-30', '1990'),
(5, 'Смирнов', 'Дмитрий', 'Александрович', '0', '1991-02-01', '1991'),
(6, 'Октенберг', 'Элиза', NULL, '1', '1991-01-21', '1991'),
(7, 'Иванов', 'Иван', 'Иванович', '0', '1990-05-15', '1990'),
(8, 'Иванов', 'Сергей', 'Петрович', '0', '1988-07-22', '1988'),
(9, 'Федорова', 'Ольга', 'Николаевна', '1', '1988-03-25', '1988'),
(10, 'Иванов', 'Иван', 'Иванович', '0', '1990-05-15', '1990');

-- Заполнение таблицы врачей
INSERT INTO MEDECINS VALUES
(1, 'Соколов', 'Андрей Михайлович', 'Терапевт'),
(2, 'Волкова', 'Ольга Николаевна', 'Хирург'),
(3, 'Лебедев', 'Михаил Анатольевич', 'Невролог'),
(4, 'Козлова', 'Анна Андреевна', 'Кардиолог');

-- Заполнение таблицы кабинетов
INSERT INTO PL_CABINETS VALUES
(1, 'Кабинет 101'),
(2, 'Кабинет 205'),
(3, 'Кабинет 310'),
(4, 'Кабинет 415');

-- Заполнение таблицы расписания
INSERT INTO PLANNING VALUES
(1, 1, TIMESTAMP '2025-08-07 09:00:00', 60, 1, 1),
(2, 2, TIMESTAMP '2025-08-07 15:00:00', 45, 2, 2),
(3, 3, TIMESTAMP '2025-08-07 11:00:00', 40, 3, 3),
(4, 4, TIMESTAMP '2025-08-07 10:00:00', 60, 1, 1),
(5, 5, TIMESTAMP '2025-08-07 16:00:00', 45, 2, 2),
(6, 6, TIMESTAMP '2025-08-08 10:00:00', 40, 3, 3),
(7, 7, TIMESTAMP '2025-08-08 09:30:00', 30, 1, 1),
(8, 8, TIMESTAMP '2025-08-11 11:25:00', 35, 4, 4),
(9, 1, TIMESTAMP '2025-08-12 16:30:00', 30, 1, 3),
(10, 9, TIMESTAMP '2025-08-12 13:30:00', 30, 4, 3),
(11, 3, TIMESTAMP '2025-08-13 12:15:00', 45, 2, 1),
(12, 10, TIMESTAMP '2025-08-14 18:25:00', 35, 4, 2);