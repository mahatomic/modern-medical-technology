SELECT pc.NAME AS "Название кабинета",
	md.NOM || ' ' ||  md.PRENOM AS "ФИО врача",
    md.SPECIALISATION AS "Специализация врача",
    pt.NOM || ' ' ||  pt.PRENOM || ' ' || COALESCE(pt.PATRONYME, '') AS "ФИО пациента"
FROM PLANNING pl
JOIN PL_CABINETS pc
ON pl.PL_CABINETS_ID = pc.PL_CABINETS_ID
JOIN MEDECINS md
ON pl.MEDECINS_ID = md.MEDECINS_ID
JOIN PATIENTS pt
ON pl.PATIENTS_ID = pt.PATIENTS_ID
WHERE DATE(pl.HEURE) = CURRENT_DATE
ORDER BY pc.NAME, md.NOM, md.PRENOM, md.SPECIALISATION, pt.NOM, pt.PRENOM, pt.PATRONYME;