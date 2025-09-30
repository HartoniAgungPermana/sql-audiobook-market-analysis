/*
=======================================================================
DDL Script: Create Table For Cleaned Data
=======================================================================

Script Purpose:
   This script creates a new table for the cleaned and transformed data.
   Since this is for a portfolio project (static dataset), we optimize 
   for readability and clarity instead of performance.
*/

USE MyDatabase;
GO

WITH processed_data AS (
    SELECT
        name,
        REPLACE(author,   'Writtenby:',  '') AS author,
        REPLACE(narrator, 'Narratedby:', '') AS narrator,

        -- Standardize duration into minutes (string first, converted later)
        CASE
            WHEN time = 'Less.than.1ute'         THEN '1'
            WHEN time = 'Less than 1 minute'     THEN '1'
            WHEN time LIKE '%hrs%' AND time NOT LIKE '%min%'  THEN CAST(CAST(REPLACE(TRIM(REPLACE(time,' hrs','')),' ','.') AS INT) * 60 AS NVARCHAR)
            WHEN time LIKE '%hrs%' AND time LIKE '%mins%'     THEN REPLACE(TRIM(REPLACE(REPLACE(time,'hrs and ',''),' mins','')),' ','.')
            WHEN time LIKE '%hrs%' AND time LIKE '%min%'      THEN REPLACE(TRIM(REPLACE(REPLACE(time,'hrs and ',''),' min','')),' ','.')
            WHEN time LIKE '%hr%'  AND time NOT LIKE '%min%'  THEN '60'
            WHEN time LIKE '%hr%'  AND time LIKE '%mins%'     THEN REPLACE(TRIM(REPLACE(REPLACE(time,'hr and ',''),' mins','')),' ','.')
            WHEN time LIKE '%hr%'  AND time LIKE '%min%'      THEN REPLACE(TRIM(REPLACE(REPLACE(time,'hr and ',''),' min','')),' ','.')
            WHEN time LIKE '%mins%'AND time NOT LIKE '%hr%'   THEN REPLACE(TRIM(REPLACE(time,' mins','')),' ','.')
            WHEN time LIKE '%min%' AND time NOT LIKE '%hr%'   THEN REPLACE(TRIM(REPLACE(time,' min','')),' ','.')
            ELSE time
        END AS time,

        -- Convert DD-MM-YY format to SQL date
        CONVERT(date, release_date, 3) AS release_date,

        -- Normalize language names
        CASE 
            WHEN language = 'mandarin_chinese' THEN 'Mandarin Chinese'
            ELSE UPPER(LEFT(language, 1)) + LOWER(SUBSTRING(language, 2, LEN(language)))
        END AS language,

        -- Extract stars (default 0 if malformed)
        CASE 
            WHEN stars LIKE '%out of 5 stars%' THEN TRIM(REPLACE(stars, 'out of 5 stars', ''))
            ELSE '0 0'
        END AS stars,

        -- Convert price
        CASE 
            WHEN price = 'Free' THEN 0
            ELSE ROUND(CAST(TRIM(REPLACE(price, ',','')) AS FLOAT) / 87.31, 1)
        END AS price
    FROM raw_audible_book
)
SELECT
    name AS [Book Name],

    -- Fix spacing in Author names (add space before uppercase letters)
    CASE
		WHEN author LIKE '%div.%' THEN 'Various Authors'
		ELSE
		TRIM((
			SELECT STRING_AGG(
				CASE WHEN c COLLATE Latin1_General_BIN LIKE '[A-Z]' AND n > 1 THEN ' ' + c ELSE c END, ''
			)
			FROM (
				SELECT SUBSTRING(author, v.number, 1) AS c, v.number AS n
				FROM master.dbo.spt_values AS v
				WHERE v.type = 'P' AND v.number BETWEEN 1 AND LEN(author)
			) AS t
		))
	END AS Author,

    -- Fix spacing in Narrator names (same logic as Author)
    CASE
		WHEN narrator LIKE '%div.%' THEN 'Various Authors'
		ELSE
			TRIM((
				SELECT STRING_AGG(
					CASE WHEN c COLLATE Latin1_General_BIN LIKE '[A-Z]' AND n > 1 THEN ' ' + c ELSE c END, ''
				)
				FROM (
					SELECT SUBSTRING(narrator, v.number, 1) AS c, v.number AS n
					FROM master.dbo.spt_values AS v
					WHERE v.type = 'P' AND v.number BETWEEN 1 AND LEN(narrator)
				) AS t
			))
	END AS Narrator,

    -- Convert cleaned time string into total minutes
    CASE 
        WHEN time LIKE '%.%' THEN CAST(PARSENAME(time, 2) AS INT) * 60 + CAST(PARSENAME(time, 1) AS INT)
        ELSE CAST(time AS INT)
    END AS Time,

    release_date AS [Release Date],
    language AS Language,

    -- Split stars column into numeric rating + total reviews
    CAST(SUBSTRING(stars, 1, CHARINDEX(' ', stars, 1) - 1) AS FLOAT) AS Ratings,
    CAST(REPLACE(REPLACE(REPLACE(
            SUBSTRING(stars, CHARINDEX(' ', stars, 1) + 1, LEN(stars) - CHARINDEX(' ', stars, 1)),
            ' ratings', ''), ' rating', ''), ',', '') AS INT)  AS [Total Review],

    price AS Price
INTO cleaned_audible_book
FROM processed_data;
