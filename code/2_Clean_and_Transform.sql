/*
===================================================================
Cleaning and Transforming Data
===================================================================

Script Purpose:
    - Verify correctness of raw data
    - Remove noise/unwanted characters
    - Transform data into a clean, standardized, and aggregate-ready dataset
*/

USE MyDatabase;
GO

/* ===============================================================
   1. NAME COLUMN
=================================================================*/

-- 1.1 Check duplicates and nulls (keep, since not true duplicates)
SELECT *
FROM (
    SELECT *, COUNT(name) OVER (PARTITION BY name) AS total_count
    FROM raw_audible_book
) AS s
WHERE total_count > 1 AND name IS NULL;

-- 1.2 Check unwanted spaces (none found)
SELECT name
FROM raw_audible_book
WHERE LEN(name) <> LEN(TRIM(name));

/* ===============================================================
   2. AUTHOR COLUMN
=================================================================*/

-- 2.1 Check correctness (unwanted "Writtenby:", No spaces between first name and last name)
SELECT DISTINCT author
FROM raw_audible_book;

/*
Cleaning Method
- Used REPLACE to remove unwanted prefixes.  
- Applied COLLATE adjustments to ensure spaces were inserted between first, middle, and last names. 
*/

-- 2.2 Clean unwanted characters and insert spaces
SELECT
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
	END AS author
FROM (
    SELECT REPLACE(author, 'Writtenby:', '') AS author
    FROM raw_audible_book
) AS s;

/* ===============================================================
   3. NARRATOR COLUMN
=================================================================*/

-- 3.1 Check correctness (unwanted "Narratedby:", No spaces between first name and last name)
SELECT DISTINCT narrator
FROM raw_audible_book;

/*
Cleaning Method
- Used REPLACE to remove unwanted prefixes.  
- Applied COLLATE adjustments to ensure spaces were inserted between first, middle, and last names. 
*/

-- 3.2 Clean unwanted characters and insert spaces
SELECT
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
		END AS narrator
FROM (
    SELECT REPLACE(narrator, 'Narratedby:', '') AS narrator
    FROM raw_audible_book
) AS s;

/* ===============================================================
   4. TIME COLUMN
=================================================================*/

-- 4.1 Checking the correctness
SELECT
	time
FROM raw_audible_book
/*
The time column displayed highly inconsistent formats, mixing plural/singular units, missing components, and anomalies.  
Below are the observed patterns:
| Pattern                | Case Description                                         |
|-------------------------|----------------------------------------------------------|
| `... hrs and ... mins` | Both hour and minute units are plural                     |
| `... hrs and ... min`  | Hour plural, minute singular                              |
| `... hrs`              | Hours only, plural form                                  |
| `... hr`               | Hours only, singular form                                |
| `... hr and ... mins`  | Hour singular, minute plural                              |
| `... hr and ... min`   | Both singular                                            |
| `... mins`             | Minutes only, plural form                                |
| `... min`              | Minutes only, singular form                              |
| `Less.than.1ute`       | Anomaly, corrupted value for < 1 minute duration         |
| `Less than 1 minute`   | Explicit anomaly for very short durations                 |  

Cleaning Method:
1. Applied `CASE` statements to handle each formatting pattern.  
2. Replaced all text characters with `"."` as delimiters, resulting in a standardized `hour.minute` format (e.g., `1.30`).  
3. Used `PARSENAME` to extract hour and minute values.  
4. Converted everything into minutes as the consistent unit of measurement
*/

-- 4.2 Standardize duration (convert all to minutes)
SELECT
    CASE
        WHEN time LIKE '%.%' THEN CAST(PARSENAME(time, 2) AS INT) * 60 + CAST(PARSENAME(time, 1) AS INT)
        ELSE CAST(time AS INT)
    END AS time_minutes,
    og_time
FROM (
    SELECT
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
        time AS og_time
    FROM raw_audible_book
) AS s;

/* ===============================================================
   5. RELEASE_DATE COLUMN
=================================================================*/

-- 5.1 Checking is there NULL data
SELECT
	release_date
FROM raw_audible_book
WHERE release_date IS NULL
-- No null data

-- 5.2 Checking date format
SELECT
	release_date
FROM raw_audible_book
-- All good in dd-mm-yy

-- 5.3 Convert to DATE
SELECT
    CONVERT(date, release_date, 3) AS cleaned_release_date,
    release_date                    AS dirty_release_date
FROM raw_audible_book;

/* ===============================================================
   6. LANGUAGE COLUMN
=================================================================*/

-- 6.1 Checking data standardization
SELECT DISTINCT language
FROM raw_audible_book
--Not Capitalized
--bad standardization (e.g. mandarin_chinese)

-- 6.2 Standardizing data and capitalize language)
SELECT DISTINCT
    CASE
        WHEN language = 'mandarin_chinese' THEN 'Mandarin Chinese'
        ELSE UPPER(LEFT(language, 1)) + LOWER(SUBSTRING(language, 2, LEN(language)))
    END AS language
FROM raw_audible_book;

/* ===============================================================
   7. STARS COLUMN
=================================================================*/

-- 7.1 Checking stars column quality
SELECT DISTINCT
	stars
FROM raw_audible_book
-- Data stored as NVARCHAR
-- Bad standardization
-- Inconsistent style (e.g Not Rated Yet)
-- Have 2 metrics in a column

-- 7.2 Clean ratings & extract reviews
SELECT
    CAST(SUBSTRING(stars, 1, CHARINDEX(' ', stars) - 1) AS FLOAT) AS ratings,
    CAST(REPLACE(REPLACE(REPLACE(SUBSTRING(stars, CHARINDEX(' ', stars) + 1, LEN(stars) - CHARINDEX(' ', stars)), ' ratings',''), ' rating',''), ',', '') AS INT) AS total_review
FROM (
    SELECT
        CASE WHEN stars LIKE '%out of 5 stars%' THEN TRIM(REPLACE(stars,'out of 5 stars',''))
             ELSE '0 0'
        END AS stars
    FROM raw_audible_book
) AS s;

/* ===============================================================
   8. PRICE COLUMN
=================================================================*/

-- 8.1 Checking price quality

SELECT
	price
FROM raw_audible_book
-- Stored as NVARCHAR
-- Stored with thousand separators, which SQL misinterprets as decimals (causing double decimals).  
-- All values were in INR (Indian Rupees), which limited global comparability.  

-- 8.2 Convert to numeric, clean thousand separators, and transfrom from INR into USD (1 USD = 87.31 INR)
SELECT
    name,
    CASE WHEN price = 'Free' THEN 0 ELSE ROUND(CAST(TRIM(REPLACE(price, ',','')) AS FLOAT) / 87.31, 1) END AS price,
    price AS og_price
FROM raw_audible_book;
