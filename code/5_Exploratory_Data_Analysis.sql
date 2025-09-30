/*
===============================================================================================
EXPLORATORY DATA ANALYSIS:
===============================================================================================

What We Covers:
1. Dimension Exploration
2. Date Range Exploration
3. KPI Exploration
4. Ranking Analysis Exploration

===============================================================================================
*/

USE MyDatabase
GO

-- Ovierview the data

SELECT TOP 100 *
FROM cleaned_audible_book

/*
==============================================
1. DIMENSION EXPLORATION
==============================================
*/

-- Retrieve the unique language of the audible book

SELECT DISTINCT Language
FROM cleaned_audible_book

-- Retireve the Author of the book

SELECT Author FROM cleaned_audible_book

-- Retrieve the Narrator of the audible book

SELECT Narrator FROM cleaned_audible_book

/*
==============================================
2. DATE RANGE EXPLORATION
==============================================
*/

-- Explore the oldest and the newest audible book release date

SELECT
	MIN([Release Date]) AS oldest_release_date,
	MAX([Release Date]) AS newest_release_date
FROM cleaned_audible_book

-- Explore the range of the newest and oldest release date in year, month, and day

SELECT
	CAST(DATEDIFF(YEAR, MIN([Release Date]), MAX([Release Date])) AS nvarchar) + ' years' AS range_in_year,
	CAST(DATEDIFF(MONTH, MIN([Release Date]), MAX([Release Date])) AS nvarchar) + ' months' AS range_in_month,
	CAST(DATEDIFF(DAY, MIN([Release Date]), MAX([Release Date])) AS nvarchar) + ' days' AS range_in_day
FROM cleaned_audible_book

/*
==============================================
3. KPI EXPLORATION
==============================================
*/

-- Retrieve the number of Book Title that have been made into audible book version

SELECT
	COUNT(DISTINCT [Book Name]) AS Number_of_Book
FROM cleaned_audible_book

-- Retrieve the number of Author of the book that have been made into audible book version

SELECT
	COUNT(DISTINCT Author) AS Number_of_Author
FROM cleaned_audible_book

-- Retrieve the number of Narrator that narrated the audible book

SELECT
	COUNT(DISTINCT Narrator) AS Number_of_Narrator
FROM cleaned_audible_book

-- Retrieve the Average time in minutes of audible book

SELECT
	AVG(Time) AS avg_time_in_minutes
FROM cleaned_audible_book

-- Retrieve the Total Review of audible book

SELECT
	SUM([Total Review]) AS number_of_review
FROM cleaned_audible_book

-- Retrieve the avg price of audible book

SELECT
	ROUND(AVG(Price), 2) AS avg_price 
FROM cleaned_audible_book

/*
==============================================
4. RANKING ANALYSIS EXPLORATION
==============================================
*/

-- Explore top 10 books that have most version of audible book

SELECT TOP 10
	[Book Name],
	COUNT([Book Name]) AS total_version
FROM cleaned_audible_book
GROUP BY [Book Name]
ORDER BY COUNT([Book Name]) DESC

-- Explore top 10 Authors that have most audible book

SELECT TOP 10
	Author,
	COUNT(Author) AS total_book
FROM cleaned_audible_book
GROUP BY Author
ORDER BY COUNT(Author) DESC
-- from this exploration, we discover that we have 'Various Author' author data, and we dont need this, so lets exclude this out

SELECT TOP 10
	Author,
	COUNT(Author) AS total_book
FROM cleaned_audible_book
WHERE Author <> 'Various Authors'
GROUP BY Author
ORDER BY COUNT(Author) DESC

-- Explore top 10 Narrator that have mosy audible book

SELECT TOP 10
	Narrator,
	COUNT(Narrator) AS total_book
FROM cleaned_audible_book
GROUP BY Narrator
ORDER BY COUNT(Narrator) DESC
-- same as this, we have anonymous, intuitive, and uncredited narrator that we dont need, lets exlude it

SELECT TOP 10
	Narrator,
	COUNT(Narrator) AS total_book
FROM cleaned_audible_book
WHERE Narrator NOT IN ('Anonymous', 'Intuitive', 'uncredited')
GROUP BY Narrator
ORDER BY COUNT(Narrator) DESC