/*
====================================================================================================
ADVANCE DATA ANALYTICS
====================================================================================================

What we cover:
- Book Popularity vs Quality Comparation Analysis
- Author Productivity vs Quality Comparation Analysis
- Price Segmentation Analysis
- Language Part-to-Whole Analysis.
- Temporal Overtime Analysis

Problem Question:
1. Is there a significant discrepancy between audiobook ratings and total engagement? Do the most popular books also have the highest ratings?  
2. How are ratings distributed across low- and high-engagement audiobooks?  
3. What are the differences between popular and niche books in terms of key metrics?  
4. Does the distribution of audiobook engagement follow the Pareto principle?  
5. How does the top 1% market share compare with the remaining 99%?  
6. What is the relationship between an author’s total released audiobooks and their total engagement?  
7. How does an author’s productivity (number of books) correlate with their average ratings?  
8. Are there authors who achieve high engagement despite releasing only a few books?  
9. Do authors with massive engagement also maintain strong ratings?  
10. Does price influence audiobook engagement?  
11. Does price affect audiobook ratings?  
12. What proportion of audiobooks are published in each language, and how does this compare across languages?  
13. How have audiobook trends evolved over time? Are there signs of growth or decline?  
14. How have audiobook quality trends changed over time?  
*/


USE MyDatabase
GO

/*
================================================================================================================================================
1. Is there a significant discrepancy between audiobook ratings and total engagement? Do the most popular books also have the highest ratings? 
================================================================================================================================================
*/

SELECT
	[Book Name],
	[Total Review],
	Ratings
FROM cleaned_audible_book
ORDER BY [Total Review] DESC;

/*
================================================================================================================================================
2. How are ratings distributed across low- and high-engagement audiobooks?  
================================================================================================================================================
*/

-- Checking ratings distribution for low-engagement audiobook (Total review < 150)
SELECT
	Ratings,
	COUNT([Book Name]) as count_of_book
FROM cleaned_audible_book
WHERE [Total Review] <> 0  AND [Total Review] < 150
GROUP BY Ratings
ORDER BY  Ratings DESC;

-- Checking ratings distribution for High-engagement audiobook (Total review >= 150)
SELECT
	Ratings,
	COUNT([Book Name]) as count_of_book
FROM cleaned_audible_book
WHERE [Total Review] <> 0  AND [Total Review] >= 150
GROUP BY Ratings
ORDER BY  Ratings DESC;

/*
================================================================================================================================================
3. What are the differences between popular and niche books in terms of key metrics?  
================================================================================================================================================
*/

-- Popular books > 500 engagement, 
-- Unpopular book <= 500 engagement
-- We filtered out audiobooks without ratings since it will turn down the average ratings.

SELECT
	'Popular Books' AS category,
	COUNT([Book Name]) AS number_of_books,
	SUM([Total Review]) AS total_engagement,
	ROUND(AVG(CAST([Total Review] AS float)), 2) AS engagement_per_book,
	ROUND(AVG(Ratings), 2) AS avg_ratings,
	ROUND(AVG(Price), 2) AS avg_price
FROM cleaned_audible_book
WHERE Ratings <> 0 AND [Total Review] > 500
UNION ALL
SELECT
	'Niche Books' AS category,
	COUNT([Book Name]) AS number_of_books,
	SUM([Total Review]) AS total_engagement,
	ROUND(AVG(CAST([Total Review] AS float)), 2) AS engagement_per_book,
	ROUND(AVG(Ratings), 2) AS avg_ratings,
	ROUND(AVG(Price), 2) AS avg_price
FROM cleaned_audible_book
WHERE Ratings <> 0 AND [Total Review] <= 500;

/*
================================================================================================================================================
4. Does the distribution of audiobook engagement follow the Pareto principle?  
================================================================================================================================================
*/

-- Pareto principle: 80% of total engagement is generated only by 20% of audiobooks
-- Analyze is 80% of total engagement is generated only by 20% of audiobooks or not
-- Total audiobooks: 87489; 20% of audiobooks: 17497

WITH cumulative_analysis AS (
SELECT
	[Book Name],
	[Total Review],
	SUM([Total Review]) OVER () AS total_engagement_generated_by_all_books,
	ROUND(CAST(SUM([Total Review]) OVER (ORDER BY [Total Review] DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS FLOAT) / SUM([Total Review]) OVER () * 100, 2) AS total_engagement_cumulative_percentage,
	ROW_NUMBER() OVER (ORDER BY [Total Review] DESC) AS row_number
FROM cleaned_audible_book
)
SELECT
	row_number,
	[Book Name],
	[Total Review],
	total_engagement_cumulative_percentage
FROM cumulative_analysis
WHERE total_engagement_cumulative_percentage <= 80;

/*
========================================================================
5. How does the top 1% market share compare with the remaining 99%?
========================================================================
*/

-- 1% of audiobooks: 875 audiobooks

WITH market_share AS (
SELECT
	[Book Name],
	[Total Review],
	Price,
	ROW_NUMBER() OVER (ORDER BY [Total Review] DESC) AS row_index
FROM cleaned_audible_book
)
SELECT
	'Top 1% Market' AS market_category,
	COUNT([Book Name]) AS number_of_book,
	SUM([Total Review]) AS total_engagement,
	ROUND(AVG(CAST([Total Review] AS float)), 2) AS engagement_per_book,
	ROUND(AVG(Price), 2) AS avg_price
FROM market_share
WHERE row_index <= 875
UNION ALL
SELECT
	'The Rest of Market' AS market_category,
	COUNT([Book Name]) AS number_of_book,
	SUM([Total Review]) AS total_engagement,
	ROUND(AVG(CAST([Total Review] AS float)), 2) AS engagement_per_book,
	ROUND(AVG(Price), 2) AS avg_price
FROM market_share
WHERE row_index > 875;

/*
========================================================================
6. What is the relationship between an author’s total released audiobooks and their total engagement? 
========================================================================
*/

-- Since we only focused on single author, we filtered out audiobooks with multiple author

-- Order By highest total audibooks -> determine is author with many released audiobooks has high engagement too
SELECT
	Author,
	COUNT(Author) AS number_of_audible_book,
	SUM([Total Review]) AS total_engagement
FROM cleaned_audible_book
WHERE Author NOT LIKE '%,%' AND Author NOT LIKE '%Production%' AND Author NOT LIKE '%Studio%' AND Author NOT LIKE '%Various%'
GROUP BY Author
ORDER BY number_of_audible_book DESC;


-- Order By highest total engagement -> determine is author with high engagement has many released audiobooks too
SELECT
	Author,
	COUNT(Author) AS number_of_audible_book,
	SUM([Total Review]) AS total_engagement
FROM cleaned_audible_book
WHERE Author NOT LIKE '%,%' AND Author NOT LIKE '%Production%' AND Author NOT LIKE '%Studio%' AND Author NOT LIKE '%Various%'
GROUP BY Author
ORDER BY total_engagement DESC;

/*
========================================================================================================
7. How does an author’s productivity (number of books) correlate with their average ratings?  
========================================================================================================
*/
-- Since we only focused on single author, we filtered out audiobooks with multiple author
-- We filtered out audiobooks without ratings since it will turn down the average ratings.

-- Order By highest total audibooks -> determine is author with many released audiobooks has high ratings too
SELECT
	Author,
	COUNT(Author) AS number_of_audible_book,
	ROUND(AVG(Ratings), 2) AS avg_ratings
FROM cleaned_audible_book
WHERE Author NOT LIKE '%,%' AND Author NOT LIKE '%Production%' AND Author NOT LIKE '%Studio%' AND Author NoT LIKE '%Various%' AND [Total Review] <> 0
GROUP BY Author
ORDER BY number_of_audible_book DESC;


-- Order By highest avg ratings -> determine is author with high ratings has many released audiobooks too
SELECT
	Author,
	COUNT(Author) AS number_of_audible_book,
	SUM([Total Review]) AS total_engagement,
	AVG(Ratings) AS avg_ratings
FROM cleaned_audible_book
WHERE Author NOT LIKE '%,%' AND Author NOT LIKE '%Production%' AND Author NOT LIKE '%Studio%' AND Author NoT LIKE '%Various%' AND [Total Review] <> 0
GROUP BY Author
ORDER BY avg_ratings ASC;

/*
========================================================================================================
8. Are there authors who achieve high engagement despite releasing only a few books? 
========================================================================================================
*/

SELECT
	Author,
	COUNT(Author) AS number_of_audible_book,
	SUM([Total Review]) AS engagement
FROM cleaned_audible_book
WHERE Author NOT LIKE '%,%' AND Author NOT LIKE '%Production%' AND Author NOT LIKE '%Studio%' AND Author NOT LIKE '%Various%'
GROUP BY Author
ORDER BY engagement DESC;

/*
========================================================================================================
9. Do authors with massive engagement also maintain strong ratings? 
========================================================================================================
*/
-- We will check is there any author with massive engagement (> 500 Total Review) has bad ratings (< 4.0 stars)

SELECT
	Author,
	SUM([Total Review]) AS total_engagement,
	ROUND(AVG(Ratings), 2) AS avg_ratings
FROM cleaned_audible_book
WHERE Author NOT LIKE '%,%' AND Author NOT LIKE '%Production%' AND Author NOT LIKE '%Studio%' AND Ratings <> 0
GROUP BY Author
HAVING SUM([Total Review]) > 500 AND AVG(Ratings) < 4.0
ORDER BY total_engagement DESC;

/*
========================================================================================================
10. Does price influence audiobook engagement? 
========================================================================================================
*/
-- We will segment the audiobooks by its price:
	-- Free: price = $0;
	-- Low Price: $0 > price <= $5;
	-- Mid Price: $5 > price <= $15;
	-- High Price: price > $15.
-- We will analyze engagement of each segment to determine the price influence.

WITH price_analysis AS (
SELECT
	CASE
		WHEN Price = 0 THEN 'Free'
		WHEN Price > 0 AND Price <= 5 THEN 'Low Price'
		WHEN Price > 5 AND Price <= 15 THEN 'Mid Price'
		ELSE 'High Price'
	END AS price_segmentation,
	[Total Review]
FROM cleaned_audible_book)
SELECT
	price_segmentation,
	COUNT(price_segmentation) AS number_of_audible_book,
	SUM([Total Review]) AS total_engagement,
	ROUND(AVG(CAST([Total Review] AS FLOAT)), 2) AS engagement_per_book
FROM price_analysis
GROUP BY price_segmentation;

/*
========================================================================================================
11. Does price affect audiobook ratings? 
========================================================================================================
*/
-- We will segment the audiobooks by its price:
	-- Free: price = $0;
	-- Low Price: $0 > price <= $5;
	-- Mid Price: $5 > price <= $15;
	-- High Price: price > $15.
-- We will analyze engagement of each segment to determine the price influence.
-- We filtered out the unratings audiobooks

WITH price_analysis AS (
SELECT
	CASE
		WHEN Price = 0 THEN 'Free'
		WHEN Price > 0 AND Price <= 5 THEN 'Low Price'
		WHEN Price > 5 AND Price <= 15 THEN 'Mid Price'
		ELSE 'High Price'
	END AS price_segmentation,
	Ratings
FROM cleaned_audible_book
WHERE Ratings <> 0)
SELECT
	price_segmentation,
	COUNT(price_segmentation) AS number_of_audible_book,
	ROUND(AVG(Ratings), 2) AS avg_ratings
FROM price_analysis
GROUP BY price_segmentation;

/*
========================================================================================================
12. What proportion of audiobooks are published in each language, and how does this compare across languages?
========================================================================================================
*/

WITH part_to_whole AS (
SELECT
	language,
	[Total Review],
	Ratings,
	COUNT(Language) OVER () AS number_of_book
FROM cleaned_audible_book
)
SELECT
	Language,
	COUNT(Language) AS number_of_books,
	CAST(ROUND(CAST(COUNT(Language) AS FLOAT)/number_of_book * 100, 3) AS nvarchar) + '%' AS used_percentage,
	SUM([Total Review]) AS total_engagement,
	ROUND(AVG(CAST([Total Review] AS float)), 2) AS engagement_rate_per_book
FROM part_to_whole
GROUP BY Language, number_of_book
ORDER BY ROUND(CAST(COUNT(Language) AS FLOAT)/number_of_book * 100, 3) DESC

/*
========================================================================================================
13. How have audiobook trends evolved over time? Are there signs of growth or decline?
========================================================================================================
*/

SELECT
	YEAR([Release Date]) AS year,
	LEFT(DATENAME(MONTH,[Release Date]), 3) AS month,
	COUNT([Book Name]) AS number_of_books,
	SUM([Total Review]) AS total_engagement
FROM cleaned_audible_book
GROUP BY YEAR([Release Date]), LEFT(DATENAME(MONTH,[Release Date]), 3), DATEPART(MONTH,[Release Date])
ORDER BY YEAR([Release Date]),DATEPART(MONTH,[Release Date])

/*
========================================================================================================
14. How have audiobook quality trends changed over time?
========================================================================================================
*/

SELECT
	YEAR([Release Date]) AS year,
	LEFT(DATENAME(MONTH,[Release Date]), 3) AS month,
	AVG(Ratings) AS avg_rating
FROM cleaned_audible_book
WHERE Ratings <> 0
GROUP BY YEAR([Release Date]), LEFT(DATENAME(MONTH,[Release Date]), 3), DATEPART(MONTH,[Release Date])
ORDER BY YEAR([Release Date]),DATEPART(MONTH,[Release Date])