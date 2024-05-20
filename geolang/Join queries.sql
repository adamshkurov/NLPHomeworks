SELECT * FROM [language]
GO

SELECT *
FROM [language]
WHERE [num_speakers]>100000000
ORDER BY [num_speakers] ASC
GO

SELECT *
FROM [language]
WHERE [num_speakers]>100000000 AND [morph_type]='Agglut'
ORDER BY [num_speakers] ASC
GO

SELECT * FROM [countries_languages]
WHERE [country_name] = '������'
GO

SELECT L.lang_name, country_name
FROM
[language] L
INNER JOIN
[countries_languages] CL
ON L.lang_name = CL.lang_name
GO

SELECT *
FROM
[language] L LEFT JOIN [lang_family] LF
on L.fam_name = LF.fam_name
where L.fam_name = '��������'

SELECT * FROM
country C LEFT JOIN countries_languages CL
on C.country_ID = CL.country_ID

