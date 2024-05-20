--- DB DEMOSTRATION

SELECT * FROM language

SELECT * FROM country

SELECT * FROM lang_family

SELECT * FROM  countries_languages
go

--- ORDER

SELECT lang_name, num_speakers
FROM language
ORDER BY num_speakers ASC
go

--- TOP, DISTINCT

SELECT DISTINCT location
FROM country
go

SELECT TOP 5 lang_name, num_speakers
FROM language
ORDER BY num_speakers DESC
go

--- COUNT, WHERE

SELECT number = COUNT(*)
FROM language
WHERE morph_type = 'Fusion'
go

SELECT lang_name FROM [countries_languages]
WHERE [country_name] = 'Россия'
go

--- JOINS

SELECT L.lang_name, country_name
FROM
[language] L
INNER JOIN
[countries_languages] CL
ON L.lang_name = CL.lang_name
go

SELECT location, lang_name FROM
country C LEFT JOIN countries_languages CL
ON C.country_ID = CL.country_ID

--- EXCEPT

SELECT *
FROM language

EXCEPT

SELECT *
FROM language
WHERE fam_name = 'Индоевропейская'
go

--- IIF, CASE

SELECT lang_name,
stat = IIF(num_speakers <10000000, 'Под угрозой', 'В безопасности')
FROM language
go

SELECT lang_name,
stat = CASE
	WHEN num_speakers <1000000 THEN 'На грани'
	WHEN num_speakers <10000000 THEN 'Под угрозой'
	ELSE 'В безопасности'
END
FROM language
go

--- VARIABLES
DECLARE
@minspeakers INT

SELECT @minspeakers = MIN(num_speakers)
FROM language

PRINT @minspeakers
go

--- GROUP BY

SELECT COUNT(*) AS [Number], morph_type
FROM language
GROUP BY morph_type
go