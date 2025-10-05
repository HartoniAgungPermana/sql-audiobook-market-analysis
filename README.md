# 📊 **End-to-End Audiobook Market Analysis with SQL and Tableau**

This project presents an end-to-end analysis of the audiobook market, transforming a raw, unstructured dataset of over 87,000 titles into a strategic business intelligence report. The central objective was to uncover the key drivers of success in a highly concentrated market and provide data-driven recommendations for authors and publishers.

The project showcases a complete data analytics workflow, including:

- **Data Cleaning and Transformation (ETL)** using advanced **SQL** to handle complex inconsistencies in text, dates, and numerical data.

- **In-depth Data Analysis** to answer 14 critical business questions regarding market dynamics, author productivity, pricing strategy, and consumer behavior.

- **Insight Generation and Visualization** using **Tableau** to build compelling charts and visuals that translate complex data into clear, actionable stories.

The final output is not just an analysis but a strategic guide, delivering actionable recommendations designed to help stakeholders navigate the audiobook landscape, optimize their release strategies, and maximize audience engagement.

---

# 📑 **Table of Contents**
 
1. [**Executive Summary**](#executive-summary)
2. [**Recommendations**](#recommendations)
3. [**Dataset**](#dataset) 
4. [**Problem Statement**](#problem-statement)  
5. [**Project Workflow**](#project-workflow)  
6. [**Tools**](#tools)
7. [**Data Preparation**](#data-preparation)
8. [**Data Cleaning and Transformation**](#data-cleaning-and-transformation)  
9. [**Data Validation**](#data-validation)
10. [**Analysis, Visualization, and Interpretation**](#analysis-visualization-and-interpretation-of-findings)
11. [**What I Learned**](#what-i-learned)
12. [**Challenges I Faced**](#challenges-i-faced)


📌 *You can skip the technical part if you only want to focus on the analysis and insights interpretation*

# **Executive Summary**

The audiobook market is not a level playing field, it's a **"winner-takes-most" arena** where an exceptionally small number of titles capture the vast majority of listener attention. Our analysis of over 87,000 audiobooks reveals that success is not driven by volume or prolific output, but by a strategic focus on **impact, production quality, and perceived value**. While the market appears saturated, significant opportunities exist for those who understand these core dynamics.

The central finding is a stark market concentration that far exceeds the traditional 80/20 rule: a mere **1.26% of audiobooks generate 80% of all user engagement**. This elite group of titles dominates the landscape, leaving tens of thousands of others struggling for visibility

This dynamic is shaped by several key factors:

1. **Impact Over Volume**: Author success is not correlated with the number of books published. In fact, many of the most engaging authors, like James Clear (*Atomic Habits*), have only a few titles. This proves that a single, high-impact "tentpole" release is far more valuable than a large catalog of mediocre ones.

2. **Production Quality is Paramount**: High ratings are not guaranteed by great content alone. Our analysis uncovered instances where celebrated books received poor audiobook ratings, suggesting that the listener's experience are shaped by **narration, audio engineering, and adaptation**—is just as crucial as the source material itself.

3. **Pricing Signals Value**: Price is a powerful lever for shaping consumer perception. While **free audiobooks serve as an effective tool for acquisition**, among paid titles, a higher price point strongly correlates with both higher ratings and greater engagement per book. The market does not reward a race to the bottom; instead, it demonstrates a willingness to pay a premium for titles perceived to be of higher quality and exclusivity.

4. **Untapped Niche Opportunities**: While the English-language market is fiercely competitive, there are passionate, underserved audiences in other languages. Markets like Hindi and Tamil show exceptionally high engagement rates per book, representing a clear opportunity for strategic expansion and capturing a loyal listener base.


# **Recommendations**

Based on the data-driven insights from this analysis, the following strategic recommendations are proposed for authors, publishers, and other stakeholders looking to succeed in the audiobook market:

### 1.  **Focus on "Tentpole" Releases with High-Impact Marketing**

- **The Finding**: The market operates on a "winner-takes-most" dynamic, where less than 2% of audiobooks generate the majority of audience engagement. A "long-tail" strategy of releasing many average-quality books is unlikely to yield significant engagement.

- **Recommendation**: Instead of spreading resources thinly across a large catalog, concentrate investment on developing and marketing a smaller number of high-potential "tentpole" titles. A significant pre-launch and post-launch marketing budget is critical to break through the noise and land a book within the top-performing percentile, where the vast majority of engagement occurs.

### 2. **Prioritize Quality and Production Value Over Volume**

- **The Finding**: The analysis shows that author productivity (number of books) does not guarantee engagement or high ratings. Furthermore, even highly acclaimed content can receive poor ratings if the audio adaptation is lacking (e.g., poor narration or production).

- **Recommendation**: Invest heavily in production quality. This includes selecting professional narrators whose style matches the content, ensuring high-fidelity audio engineering, and creating a seamless listening experience. A single, flawlessly produced audiobook is more valuable for building an author's reputation and driving engagement than multiple, mediocre releases.

### 3. **Implement a Strategic Pricing Model**

- **The Finding**: Free audiobooks are effective at generating high engagement per title, likely due to their accessibility. However, among paid titles, there is a clear positive correlation between price, average ratings, and engagement per book. Customers perceive higher-priced audiobooks as being of higher quality.

- **Recommendation:**
	- **Use "Free" as a Tool**: Offer a book for free strategically—either as a limited-time promotion to build buzz or as a lead magnet to introduce new listeners to an author's work.

	- **Don't Underprice Premium Content**: For high-quality, well-produced audiobooks, do not compete on price. A premium price point can reinforce the perception of value and attract a more committed audience. The data suggests the market is willing to pay for quality and exclusivity

### 4. **Explore Underserved, High-Engagement Language Markets**

- **The Finding**: While English dominates the market in sheer volume, languages like Hindi and Tamil show exceptionally high engagement rates per book. This points to passionate, underserved audiences.

- **Recommendation**: For publishers with a strong English-language catalog, consider investing in high-quality translations and adaptations for these niche markets. The cost of entry may be lower, and the potential for capturing a highly engaged user base is significant. This represents a clear market opportunity for strategic expansion beyond the saturated English-speaking world.

# **Dataset**

The dataset was sourced from **Kaggle**, containing detailed information on audiobook names, authors, narrators, reviews, ratings, release dates, durations, languages, and prices.  

📂 You can access the dataset [`here: audible_uncleaned.csv`](dataset/audible_uncleaned.csv).
It contains **87,489 rows** and **8 columns**.

# **Problem Statement**  

The following questions guided the analysis:  

1. Is there a significant discrepancy between audiobook ratings and total engagement? Do the most popular books also have the highest ratings?  
2. How are ratings distributed across low- and high-engagement audiobooks?  
3. What are the differences between popular and niche books in terms of key metrics?  
4. Does the distribution of audiobook engagement follow the **Pareto principle**?  
5. How does the **top 1% market share** compare with the remaining 99%?  
6. What is the relationship between an author’s total released audiobooks and their total engagement?  
7. How does an author’s productivity (number of books) correlate with their average ratings?  
8. Are there authors who achieve high engagement despite releasing only a few books?  
9. Do authors with massive engagement also maintain strong ratings?  
10. Does **price** influence audiobook engagement?  
11. Does **price** affect audiobook ratings?  
12. What proportion of audiobooks are published in each language, and how does this compare across languages?  
13. How have audiobook trends evolved over time? Are there signs of growth or decline?  
14. How have audiobook **quality trends** changed over time?  

# **Project Workflow**  

The project followed a structured analytical workflow:  

1. 🔄 **Data Preparation**
2. 🧹 **Data Cleaning and Transformation**  
3. ✅ **Data Validation**  
4. 📊 **Data Analysis**  
5. 📈 **Data Visualization**  
6. 🔎 **Interpretation of Findings**  

# **Tools**  

To carry out this analysis, the following tools were used:  

- 🛠️ **SQL**: Core language for data cleaning, transformation (ETL), querying, and analysis.  
- 💻 **SQL Server Management Studio (SSMS)**: The IDE used for developing and managing SQL Server scripts.  
- 📊 **Tableau**: Visualization platform for building charts and extracting insights.
- 🌐 **Git & GitHub**: For version control, collaboration, and project tracking.

# **Data Preparation**

The raw dataset was stored in **CSV format** and imported into SQL Server using `BULK INSERT`.  

👉 You can access my data extraction code [`here: 1. Extract Data.sql`](code/1_Extract_Data.sql)

# **Data Cleaning and Transformation**  

Before cleaning, we explored the raw dataset to identify major issues.  

📊 **Raw Data Overview**  

![alt text](<images/fig.1 raw data checking.png>)
<p align="center"><b>Fig.1 Overview of The Raw Dataset.</center></b></p>

🔎 **Issues identified in the raw dataset:**  
- **Author & Narrator** → Contained extra special characters and lacked separators between first and last names.  
- **Time** → Stored as text (`NVARCHAR`), with inconsistent units of measurement.  
- **Release Date** → Stored as text instead of `DATETIME`.  
- **Language** → Inconsistent spellings and formats across rows.  
- **Stars** → Mixed values (ratings + number of reviews), inconsistent formatting, and extra characters.  
- **Price** → Included thousand separators, not stored as numeric.  

⚠️ These inconsistencies needed to be fixed before any reliable analysis could be performed.

👉 For in-dept techinal cleaning method, you can access my sql code [`here: 2. Clean and Transform.sql`](code/2_Clean_and_Transform.sql)

> ***For attached SQL code, i have added features to hide and collapsed the code if you want to dig deeper in technical method***

### **3.1 Cleaning Name Column**  

We will check is there any duplicates value, null value, unwanted spaces, or any other anomaly in `name` column. `COUNT WINDOW FUNCTION` was used to address the duplivates value while `TRIM` was used to determine the unwwanted spaces. 

<details>
<summary><code>Click to see the SQL cleaning code</code></summary>

```sql
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
```
</details>
We dont spot any anomaly. So we will keep the name column.

### **3.2 Cleaning Author Column**  

From **Fig.1**, we observed that every record in the **author** column contained the prefix `"Writtenby:"`.  
Additionally, author names were concatenated without spaces (e.g., `"RickRiordan"` instead of `"Rick Riordan"`).  

🛠️ **Cleaning Approach:**  
- Used `REPLACE` to remove unwanted prefixes.  
- Applied `COLLATE` adjustments to ensure spaces were inserted between first, middle, and last names.  

<details>
<summary><code>Click to see the SQL cleaning code</code></summary>

```sql
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
```
</details>

### **3.3 Cleaning Narrator Column**  

Similar to the author column, the **narrator** column contained the prefix `"Narratedby:"`, and names were improperly joined without spaces (e.g., `"EmmaTalon"` instead of `"Emma Talon"`).  

🛠️ **Cleaning Approach:**  
- Used `REPLACE` to strip unwanted prefixes.  
- Applied `COLLATE` adjustments to restore spacing between name components. 

<details>
<summary><code>Click to see the SQL cleaning code</code></summary>

```sql
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
```
</details>

### **3.4 Cleaning time Column**

The **time** column displayed highly inconsistent formats, mixing plural/singular units, missing components, and anomalies.  
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
| `Less.than.1ute`       | Anomaly — corrupted value for < 1 minute duration         |
| `Less than 1 minute`   | Explicit anomaly for very short durations                 |  

🛠️ **Cleaning Approach:**  
1. Applied `CASE` statements to handle each formatting pattern.  
2. Replaced all text characters with `"."` as delimiters → resulting in a standardized `hour.minute` format (e.g., `1.30`).  
3. Used `PARSENAME` to extract hour and minute values.  
4. Converted everything into **minutes** as the consistent unit of measurement

<details>
<summary><code>Click to see the SQL cleaning code</code></summary>

```sql
-- Standardize duration (convert all to minutes)
SELECT
    CASE
        WHEN time LIKE '%.%' THEN CAST(PARSENAME(time, 2) AS INT) * 60 + CAST(PARSENAME(time, 1) AS INT)
        ELSE CAST(time AS INT)
    END AS time,
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
```
</details>

### **3.5 Cleaning Release Date Column**  

The **release date** column was originally stored as an `NVARCHAR` type, which is not suitable for time-based analysis.  
Additionally, the values were formatted in **dd-mm-yyyy** style, requiring explicit format specification during conversion.  

🛠️ **Cleaning Approach:**  
- Converted the column from `NVARCHAR` → `DATETIME`.  
- Applied the correct format mapping to ensure all dates were standardized.

<details>
<summary><code>Click to see the SQL cleaning code</code></summary>

```sql
SELECT
    CONVERT(date, release_date, 3) AS cleaned_release_date
FROM raw_audible_book;
```
</details>

### **3.6 Cleaning Language Column**  

The **language** column contained inconsistent formatting:  
- Some entries were not properly capitalized.  
- An anomaly `"mandarin_chinese"` used an underscore instead of a space.  

🛠️ **Cleaning Approach:**  
- Applied a `CASE` statement to specifically handle anomalies.  
- Used a combination of `UPPER`, `LOWER`, and `SUBSTRING` functions to enforce proper capitalization.  

<details>
<summary><code>Click to see the SQL cleaning code</code></summary>

```sql
-- Check the standardization of the data (not standardized)
SELECT DISTINCT language FROM raw_audible_book

-- Standardizing the data (standardize case + Mandarin Chinese)
SELECT DISTINCT
    CASE
        WHEN language = 'mandarin_chinese' THEN 'Mandarin Chinese'
        ELSE UPPER(LEFT(language, 1)) + LOWER(SUBSTRING(language, 2, LEN(language)))
    END AS language
FROM raw_audible_book;
```
</details>

### **3.7 Cleaning Stars Column**  

The **stars** column contained **two metrics combined into one**:  
- **Ratings** (e.g., `"4.3 out of 5 stars"`)  
- **Total Reviews** (numeric counts)  
It also included inconsistent styles such as `"Not Rated Yet"`.  

🛠️ **Cleaning Approach:**  
- Applied `CASE` statements to handle different cases (`ratings` vs. `not rated`).  
- Used combination of `REPLACE`, `SUBSTRING`, `CHARINDEX`, and `LEN` functions to **split the metrics** into two clean columns:  
  - **Ratings**  
  - **Total Reviews**  

<details>
<summary><code>Click to see the SQL cleaning code</code></summary>

```sql
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
```
</details>

### **3.8 Cleaning Price Column**  

The **price** column had multiple issues:  
- Stored with **thousand separators**, which SQL misinterprets as decimals (causing double decimals).  
- All values were in **INR (Indian Rupees)**, which limited global comparability.  

🛠️ **Cleaning Approach:**  
- Removed **thousand separators** to ensure proper numeric conversion.  
- Converted all prices from **INR → USD** for international standardization. 

<details>
<summary><code>Click to see the SQL cleaning code</code></summary>

```sql
SELECT
    name,
    CASE WHEN price = 'Free' THEN 0 ELSE ROUND(CAST(TRIM(REPLACE(price, ',','')) AS FLOAT) / 87.31, 1) END AS price,
    price AS og_price
FROM raw_audible_book;
```
</details>

**the currency value follows the market when this project created, it may vary in the future*

## **4. Load The Cleaned Data As A New Table** 

After completing the data cleaning process, it is important to save the results into a new, dedicated table. its a best practices since its: 
- **Preserve the raw data**: By creating a new table (instead of overwriting), the original dataset remains untouched. This ensures reproducibility and allows us to trace back any issues if needed. 
- **Improve efficiency**: Downstream queries (exploration and visualization) can run directly on the cleaned dataset without repeating the cleaning steps each time, which saves time and computing resources. 
- **Data integrity**: Separating the cleaned table reduces the risk of accidentally introducing errors into the raw source data. 
- **Reusability**: Other analysts, dashboards, or workflows can use the cleaned table as a reliable starting point, ensuring consistent results across the project. 

In real-world data analytics pipelines, this approach mirrors best practices where data is stored in multiple layers (e.g., *raw → cleaned → transformed*) to maintain both integrity and usability. You can access the full script [`here: 3. DDL Cleaned Data.sql`](code/3_DDL_Cleaned_Data.sql)

The **top 24 rows** of the cleaned dataset are shown below:  

![alt text](<images/fig.2 ovrv cleaned data.png>)  
<p align="center"><b>Fig.2 Overview of Cleaned Data</center></b></p>  

# **Data Validation**

To ensure the cleaned data was correct and consistent, I performed validation checks:  
👉 Full SQL script: [`4. Data_Validation.sql`](code/4_Data_Validation.sql)

# **Analysis, Visualization, and Interpretation of Findings**

Each question from the **Problem** section is analyzed using **SQL** queries, with results visualized in **Tableau**. The combination of SQL output and visualization is then interpreted to uncover meaningful business insights.  

👉 For in-dept techinal cleaning method, you can access my sql code [`here: 6. Advance Data Analysis.sql`](code/6_Advance_Data_Analysis.sql)

***For attached SQL code, i have added features to hide and collapsed the code if you want to dig deeper in technical method***

---

## **1. Is there a significant discrepancy between audiobook ratings and total engagement? Do the most popular books also have the highest ratings?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

To identify potential discrepancies between **ratings** and **total engagement**, I retrieved the following attributes:  

- 🎧 `Book Name`  
- 👥 `Total Review` (engagement)  
- ⭐ `Ratings`  

The results were then ordered by engagement (highest → lowest) and visualized as a **scatter plot** to highlight the relationship between the two metrics. 


```sql
SELECT
	[Book Name],
	[Total Review],
	Ratings
FROM cleaned_audible_book
ORDER BY [Total Review] DESC
```
</details>

![alt text](<images/fig.3 ratings vs engagement.png>)
<p align="center"><b>Fig.3 Audio Books Distribution by Ratings and Engagement</b></p>

### **🔑 Insights**
- 📈 **Positive Correlation**: In general, the more engagement an audiobook receives, the higher its ratings tend to be.  
- 🌟 **High-engagement = High-quality**: Popular audiobooks usually sustain strong ratings, showing their popularity is backed by genuine quality rather than hype.  
- ⚖️ **Low-engagement variability**: Audiobooks with fewer reviews show more scattered ratings. Some score highly, but these are less reliable since they are based on very few reviews.  
- 🏆 **Standout performers**: A handful of titles (e.g., *Atomic Habits*, *Sapiens*, *Ikigai*) achieve both massive engagement **and** near-perfect ratings. Their credibility is strong because their 5/5 scores are supported by **thousands of reviews**, not just a few.  
- 📈 This analysis suggests that **engagement and ratings move together**, with highly engaged audiobooks being both **popular and trusted** by listeners. Meanwhile, books with low engagement may appear “good” in ratings, but such averages should be interpreted cautiously due to limited sample sizes.

## **2. How are ratings distributed across low- and high-engagement audiobooks?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

Since this analysis focuses on the **average ratings** of audiobooks, titles with no ratings were excluded.  
To examine the distribution, we aggregated audiobook counts (`COUNT`) grouped by their rating levels.  

👉 **Classification Rule:**  
- **Low Engagement**: fewer than **150 total reviews**  
- **High Engagement**: at least **150 total reviews**  

This classification allows us to compare how ratings are distributed between niche titles and widely popular books.

```sql
-- Lets check for the book with low engagement
SELECT
	Ratings,
	COUNT([Book Name]) as count_of_book
FROM cleaned_audible_book
WHERE [Total Review] <> 0  AND [Total Review] < 150
GROUP BY Ratings
ORDER BY  Ratings DESC

-- Lets check for the book with high engagement
SELECT
	Ratings,
	COUNT([Book Name]) as count_of_book
FROM cleaned_audible_book
WHERE [Total Review] <> 0  AND [Total Review] >= 150
GROUP BY Ratings
ORDER BY  Ratings DESC
```
</details>


![alt text](<images/fig.4 ratings distribution low engagement books.png>)
<p align="center"><b>Fig.4 Ratings Distribution of Low Engagement Audio Books</b></p>

![alt text](<images/fig.5 ratings distribution high engagement books.png>)
<p align="center"><b>Fig.5 Ratings Distribution of High Engagement Audio Books</b></p>

### **🔑Insights**

- 📊 **Engagement Concentration**: A large proportion of audiobooks fall into the **low-engagement** category. This suggests that user attention is concentrated on a relatively small pool of popular titles, leaving the majority struggling to gain attentions in the market.  

- 🎭 **Variability in Ratings**: Low-engagement books show a **broad spread of ratings**. While many achieve strong ratings, a notable share also performs poorly. Still, the overall trend leans toward **positive ratings**, even for niche titles.  

- ⚖️ **Quality vs. Popularity**: High ratings are present in both groups. However, **poorly rated books only found in the low-engagement category**, highlighting that niche books face a greater risk of mixed reception.  

- ⭐ **Clustering of Quality**: High-engagement audiobooks display a **tight clustering around very high ratings (4.5–5)**. This consistency suggests that high-engagement books also tend to deliver strong user satisfaction. In contrast, low-engagement books reveal **greater variability**, signaling diverse market reception and quality perceptions.  

## **3. What are the differences between popular and niche books in terms of key metrics?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

Since this analysis focuses on the **average ratings and engagement of audiobooks**, any titles with no ratings are excluded.  
- **Popular books** are defined as those with more than **500 total reviews**.  
- **Niche books** are defined as those with **500 or fewer reviews**.  

We then compared key performance metrics between the two groups using aggregate functions, combining both queries with a `UNION ALL`. 

```sql
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
```
</details>

| Category       | Number of Books | Total Engagement | Engagement per Book | Avg Ratings | Avg Price |
|----------------|-----------------|------------------|----------------------|-------------|-----------|
| Popular Books  | 93              | 147,996          | 1,591.35             | 4.59        | 8.87      |
| Niche Books    | 14,979          | 177,758          | 11.87                | 4.46        | 7.90      |


### **🔑Insights**

- 📊 **Imbalance in Distribution**: The dataset reveals a **stark imbalance** — only 93 popular books compared to 14,979 niche titles. Engagement is therefore **heavily concentrated** on a tiny fraction of the catalog.  

- 🔄 **Total Engagement vs. Distribution**: While niche books collectively generate slightly more total engagement (177,758 vs. 147,996), this is **spread across thousands of titles**, making their individual impact minimal. In other hand popular audiobooks **generate 147996 total engagement only by 93 books**, making the engagement highly concentrated at popular books.

- 🎯 **Engagement Efficiency**: Popular books dominate with an **average of 1,591 engagements per title**, compared to only **11.87 for niche books**. This underscores that **audience attention clusters strongly** around popular titles.

- ⭐ **Ratings Quality**: Popular books hold a modest edge in ratings (4.59 vs. 4.46). Though the difference is small, it suggests that **popular titles are not only more visible but also slightly better perceived**.  

- 📈 **Overall Takeaway**: Popularity and engagement are **strongly correlated**. A small number of books capture the **lion’s share of attention**, outperforming niche titles in both **volume** and **perceived quality**.  

## **4. Does audiobook engagement follow the Pareto Principle (80/20 Rule)?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

The **Pareto Principle** states that roughly **80% of effects come from 20% of causes**.  
In this context, we want to test whether **80% of total engagement (reviews)** is generated by only **20% of audiobooks**.  

To validate this, we:  
- Retrieved each audiobook’s **`Book Name`** and **`Total Review`**.  
- Applied **window functions** to calculate cumulative engagement percentages.  
- Used a **CTE** to structure the query for readability and performance.

```sql
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
WHERE total_engagement_cumulative_percentage <= 80
```
</details>

| Row Number | Book Name               | Total Review | Cumulative Engagement % |
|------------|-------------------------|--------------|--------------------------|
| …          | …                       | …            | …                        |
| 1102       | Gardens of the Moon     | 37           | 79.95                   |
| 1103       | Kingdom of Ash          | 37           | 79.96                   |
| 1104       | A Walk in the Woods     | 37           | 79.98                   |
| 1105       | The Red Pyramid         | 37           | 79.99                   |
| 1106       | A Court of Mist and Fury| 37           | 80.00                   |

*(… indicates additional rows above)*

### **🔑Insights:**

- 📊 From the total **87489 audio books** in the dataset, **80% of the total engagement** generated only by **1106 audio books**, which is **less than 20% of the audio books**, meaning the Pareto Principle is not only satisfied but even more extreme in this dataset. 
- 🎯 Engagement in the Audiobooks dataset is **extremely concentrated**. While Pareto’s rule suggests 20% of audio books should drive ~80% of total engagement, in this dataset just **1.26% of audiobooks** already generate **80% of total engagement**.
- 🏆 It indicates a **winner-takes-most market**: a tiny elite of highly popular audio books dominate audience attention, while the vast majority of books struggle to attract reviews.

## **5. How does the **top 1% market share** compare with the remaining 99%?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

Since the dataset contains a total of **87,489 audiobooks**, we compare the **top 1% of audiobooks** (approximately 875 books) ranked by total engagement with the **remaining 99% of the market**.  

To achieve this, we first assign a `ROW_INDEX` ordered by `Total Review` to track the position of each audiobook.  

Next, we divide the dataset into two groups using a `WHERE` clause:  
- 🔝 **Top 1% Market**: audiobooks with `ROW_INDEX` less than or equal to 875.  
- 📚 **Rest of the Market**: audiobooks with `ROW_INDEX` greater than 875.  

We then apply **Aggregate Functions** to calculate key metrics for each group (such as total engagement, number of book, engagement per book, and average price). Finally, we use `UNION ALL` to combine the two groups into a single output, making the comparison straightforward and efficient. 

<details>
<summary><code>Click to see the SQL analysis code</code></summary>

```sql
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
WHERE row_index > 875
```
</details>
</details>

| Market Category   | Number of Books | Total Engagement | Engagement per Book | AVG Price |
|-------------------|----------------|------------------|----------------------|-----------|
| Top 1% Market     | 875            | 250860           | 286.7                | 7.97      |
| The Rest of Market| 86614          | 74894            | 0.86                 | 6.39      |

### **🔑Insights:**

- ⚡ The total engagement generated by the **top 1%** is significantly higher, with **250,860 engagements**, compared to only **74,894 engagements** from the remaining 99% of the market.  
- 📊 On a **per-book basis**, the **top 1% dominates** with an average of **286.7 engagements per book**, while the rest of the market averages only **0.86 engagements per book**.  
- 💰 The top 1% market is also slightly **more expensive**, with an average price of **$7.97**, compared to **$6.39** for the rest of the market.  
- 🏆 These findings suggest that **engagement is highly concentrated within the top 1% of popular books**, and these books command a **price premium** due to their higher demand and popularity.

## **6. What is the relationship between an author’s total released audiobooks and their total engagement?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

To analyze the relationship between the total engagement and the number of audiobooks per author, we retrieved the `Author` field, aggregated engagement using `SUM([Total Review])`, and counted the number of audiobooks using `COUNT(Author)`.  
Since the focus is on single authors, books written by multiple authors or production/studio entities were excluded using the `WHERE` clause. The results were then visualized with a scatter plot.  

```sql
SELECT
	Author,
	COUNT(Author) AS number_of_audible_book,
	SUM([Total Review]) AS total_engagement
FROM cleaned_audible_book
WHERE Author NOT LIKE '%,%' AND Author NOT LIKE '%Production%' AND Author NOT LIKE '%Studio%' AND Author NOT LIKE '%Various%'
GROUP BY Author
ORDER BY number_of_audible_book DESC
```
</details>

![alt text](<images/fig.6 author engagement vs productivity.png>)
<p align="center"><b>Fig.6 Author Total Engagement Vs. Author Productivity</b></p>

### **🔑Insights**

- 📚 Many authors have published a **large number of audiobooks** but generate **very little engagement** (<100 reviews). Some even released **over 400 books with no engagement at all**.  
- 🌟 In contrast, a few authors achieved **exceptionally high engagement with only a handful of books**. For example, **James Clear**, the author of *Atomic Habits*, generated **25,142 total engagements with only 3 audiobooks**.  
- 📈 When sorting by **engagement rather than productivity**, **the most impactful authors tend to have relatively few books**.  
- 🔀 **Engagement is not strongly correlated with productivity** (number of books published). Instead, it is primarily driven by the **popularity and influence of the author**.  

## **7. How does an author’s productivity (number of books) correlate with their average ratings?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

Since the focus is on **authors’ average ratings**, we excluded audiobooks with **no ratings** (as many of these are re-released versions with different narrators).  
We also filtered out books written by **multiple authors** or by **production/studio entities** to focus only on **individual author performance**.  

To analyze the relationship, we retrieved the `Author` field, calculated the **average rating** using `AVG(Ratings)`, and counted the **number of audiobooks** using `COUNT(Author)`. The results were visualized with a **scatter plot**.

```sql
SELECT
	Author,
	COUNT(Author) AS number_of_audible_book,
	ROUND(AVG(Ratings), 2) AS avg_ratings
FROM cleaned_audible_book
WHERE Author NOT LIKE '%,%' AND Author NOT LIKE '%Production%' AND Author NOT LIKE '%Studio%' AND Author NoT LIKE '%Various%' AND [Total Review] <> 0
GROUP BY Author
ORDER BY number_of_audible_book DESC
```
</details>

![alt text](<images/fig.7 author ratings vs productivity.png>)
<p align="center"><b>Fig.7 Author Ratings Vs. Author Productivity</b></p>

### **🔑Insights**

- 📚 Authors with a **large number of released audiobooks** generally maintain **good ratings (often >4.5)**.  
- 🌟 Many authors with **only a few audiobooks** also achieve **strong ratings**, showing that **quality is not necessarily tied to productivity**.  
- 📉 When sorting by **average rating (low → high)**, authors with **poor ratings tend to have very few audiobooks published**.  
- ✅ Productivity alone does not guarantee higher ratings. However, 🚫 **authors with consistently poor ratings almost always have a very limited number of releases**.  

## **8. Are there authors who achieve high engagement despite releasing only a few books?**

This question builds on the findings from **Problem #6**, where we explored the relationship between the number of released audiobooks and total engagement.  
The SQL code and visualization used to analyze this were the same as those shown in **Fig.6**.  

---

### 🔑 **Insights**

- 🌟 Several **superstar authors** stand out by generating **massive engagement** despite releasing only a handful of books.  
  - ✨ For example, **James Clear** (author of *Atomic Habits*) achieved **25,142 total engagements** with only **3 audiobooks released**.  
  - 🖊️ Other authors in this category include **Morgan Housel, J. K. Rowling, and Yuval Noah Harari**.  
- 📈 This highlights that **popularity and book impact** are the primary drivers of engagement, rather than the sheer **quantity of audiobooks released**.  
- ✅ The audiobook market rewards **quality and author reputation** far more than **volume of production**.   

## **9. Are authors with massive engagement also highly rated?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

To validate whether authors associated with massive engagement also receive high ratings, we filter for popular authors with poor ratings.  
- 📊 We define **massive engagement** as authors with more than **500 total engagements** (`SUM([Total Review])`).  
- ⭐ We define a **good rating** as an average rating **above 4.0 stars**.  

Thus, our query highlights authors who are popular (high engagement) but have relatively **low ratings (< 4.0)**.

```sql
SELECT
	Author,
	SUM([Total Review]) AS total_engagement,
	ROUND(AVG(Ratings), 2) AS avg_ratings
FROM cleaned_audible_book
WHERE Author NOT LIKE '%,%' AND Author NOT LIKE '%Production%' AND Author NOT LIKE '%Studio%' AND Ratings <> 0
GROUP BY Author
HAVING SUM([Total Review]) > 500 AND AVG(Ratings) < 4.0
ORDER BY total_engagement DESC
```
</details>

| Author          | total_engagement | avg_ratings |
|-----------------|------------------|-------------|
| Michelle Obama  | 2928             | 3.17        |
| Lori Gottlieb   | 566              | 3.75        |
| Sun Tzu         | 540              | 3.89        |

### 🔑 **Insights**

- ✅ The majority of authors with massive engagement tend to have **strong ratings**.  
- ⚠️ However, **Michelle Obama**, **Lori Gottlieb**, and **Sun Tzu** stand out as **exceptions**, with **average ratings below 4.0** despite having high engagement.  
- 📚 Interestingly, in the context of **physical books**, all three authors are **highly acclaimed**:  
  - 👩‍💼 *Michelle Obama* — *Becoming*  
  - 🧠 *Lori Gottlieb* — *Maybe You Should Talk to Someone*  
  - 🏯 *Sun Tzu* — *The Art of War*  
- 🎧 This discrepancy suggests that the lower ratings may not reflect the **quality of the content itself** but rather issues with the **audio adaptation** (e.g., narration, production quality, or overall listening experience). 

## **10. Does the Price of Audiobooks Affect Total Engagement?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

To analyze the relationship between audiobook prices and customer engagement, we segmented audiobooks into four price categories:

- 🆓 **Free** (Price = 0)  
- 💵 **Low Price** (≤ 5 USD)  
- 💰 **Mid Price** (> 5 USD and ≤ 15 USD)  
- 💎 **High Price** (> 15 USD)  

We used a `CASE` statement to assign each audiobook into a price segment, then aggregated the results to summarize engagement levels across categories.  

```sql
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
```
</details>

| Price Segmentation | Number of Audiobooks | Total Engagement | Engagement per Book |
|--------------------|-----------------------|------------------|----------------------|
|  Low Price       | 31,763               | 60,977           | 1.92                 |
|  Free            | 338                  | 4,079            | 12.07                |
|  High Price      | 2,075                | 14,885           | 7.17                 |
|  Mid Price       | 53,313               | 245,813          | 4.61                 |

### 🔑 **Insights**

- 📊 **Book distribution by price:**  
  The largest segment is **Mid Price** (53,313 books), followed by **Low Price** (31,763 books), **High Price** (2,075 books), and **Free** (338 books).

- 🔄 **Total engagement vs. number of books:**  
  Total engagement is largely driven by the number of books in each category. More books in a segment generally result in higher overall engagement.

- 🎯 **Engagement per book:**  
  When measuring **engagement per book** (total engagement ÷ number of books), **Free audiobooks** stand out with **12.07 engagements per book**, followed by **High Price** with **7.17 engagements per book**. Despite having fewer books overall, these two categories generate the highest engagement per title.

- 📈 **Market behavior:**  
  Free and high-priced books show the strongest engagement per book, even though they contribute the lowest total engagement. This suggests that the market shows strong interest in these categories—either due to accessibility (free) or perceived premium value (high price).

- 🚫 **Excluding free books:**  
  Among paid categories, engagement per book increases with price. This indicates that customers may perceive higher-priced audiobooks as higher-quality or more valuable compared to cheaper ones.

- ✅ **Conclusion:**  
  Price significantly affects engagement. **Free audiobooks** attract high engagement per title because they are easy to access. Once payment is required, however, customers appear more engaged with **higher-priced** audiobooks, suggesting that premium pricing can drive stronger interest due to perceived quality and exclusivity.

## **11. Does the Price of Audiobooks Affect Average Ratings?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

This analysis uses a similar approach to **Problem #10**, but instead of measuring total engagement, we calculate the average ratings of audiobooks. To ensure accuracy, we exclude all audiobooks that do not have any ratings.

```sql
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
GROUP BY price_segmentation
```
</details>

| Price Segmentation | Number of Audiobook | AVG Ratings |
|--------------------|------------------------|-------------|
| Low Price          | 2718                   | 4,4         |
| Free               | 207                    | 4,24        |
| High Price         | 663                    | 4,51        |
| Mid Price          | 11484                  | 4,47        |

### 🔑 **Insights**

- 🥇 **Highest-rated segment:** The **highest average rating** is observed in the **High Price** segment (4.51), followed by **Mid Price** (4.47), **Low Price** (4.40), and **Free** (4.24).  

- 📊 **Price vs. ratings trend:** While the differences between segments are relatively small, there is a **clear positive relationship** between price and average ratings.  

- 🎧 **Quality perception:** This trend suggests that **higher-priced audiobooks tend to deliver better quality**, or at least meet consumer expectations more consistently.  

- ⚖️ **Free segment drawback:** Free audiobooks, despite being more accessible, receive the **lowest ratings**, possibly due to lower production quality or limited content depth.  

- ✅ **Conclusion:** Overall, the results reinforce the idea that the market perceives **premium-priced audiobooks as higher quality**, aligning with consumer expectations of *“you get what you pay for.”*

## **12. Which Language Dominates the Audiobook Market?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

In this section, we perform a part-to-whole analysis to understand language dominance in the audiobook market.  
We evaluate three key metrics for each language:

1️⃣ **Usage Percentage** – the share of books released in a given language.  
2️⃣ **Total Engagement** – the cumulative number of reviews (as a proxy for engagement).  
3️⃣ **Engagement Rate per Book** – average engagement per book.  

To achieve this, we use a `CTE` and `WINDOW FUNCTION` to calculate the total number of books and then derive the share for each language. The results are visualized using bar charts for each metric.

<details>
<summary><code>Click to see the SQL analysis code</code></summary>

```sql
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
```
</details>
</details>

![alt text](<images/top 10 most used language.png>)

![alt text](<images/top 5 most engagement.png>)

![alt text](<images/top 5 most engagemnet rate.png>)

### 🔑 **Insights**

- 🌍 **English** dominates audiobook content, accounting for **70.8%** of all titles. The next significant language is **German** at **9.4%**, while the rest of the languages each account for **less than 4%**.  
- 📊 In terms of **total engagement**, English leads by a large margin, which aligns with its overwhelming presence in the dataset.  
- 🔥 However, when looking at **engagement rate per book**, **Hindi (21.2)** and **Tamil (14.83)** outperform all other languages, despite representing only **0.4%** and **0.18%** of total usage.  
- ✨ This shows that while **English dominates in volume and overall engagement**, **Hindi and Tamil dominate in quality of engagement per audiobook**, making them important niche markets.  

## **13. How have audiobook trends evolved over time? Are there signs of growth or decline?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

To analyze audiobook trends over time, we aggregate two key metrics:  
📚 **Number of audiobooks released** using `COUNT([Book Name])`  
⭐ **Total engagement** using `SUM([Total Review])`  

Because we want to observe **monthly trends**, we extract the year and month information from `Release Date` using `YEAR` and `DATENAME`. To improve readability, we apply `LEFT` to abbreviate the month name.  

⚠️ Since month names are stored as `NVARCHAR`, ordering them alphabetically would not reflect the chronological order. To solve this, we use `DATEPART` to extract the **month number**, which is applied only in the `ORDER BY` clause (not in the `SELECT` clause).  

📈 Line chart will be used to visualize the trends.

```sql
SELECT
	YEAR([Release Date]) AS year,
	LEFT(DATENAME(MONTH,[Release Date]), 3) AS month,
	COUNT([Book Name]) AS number_of_books,
	SUM([Total Review]) AS total_engagement
FROM cleaned_audible_book
GROUP BY YEAR([Release Date]), LEFT(DATENAME(MONTH,[Release Date]), 3), DATEPART(MONTH,[Release Date])
ORDER BY YEAR([Release Date]),DATEPART(MONTH,[Release Date])
```
</details>

![alt text](<images/fig.8 total book and engagement overtime.png>)
<p align="center"><b>Fig. 8 Released Audio Books and Total Engagement Overtime</b></p>

### 🔑 **Insights:**

- 🟢 **Early market (≈1998–2012):** Both releases and engagement are very low and flat—consistent with a **nascent audiobook catalog** and limited adoption.  

- 🚀 **Demand boom (≈2013–2018):** Engagement accelerates **faster** than releases and peaks around **2018**. This suggests demand outpaced supply and/or a few breakout titles drove outsized attention.  

- 📦 **Supply catches up (≈2019–2020):** The **number of releases** keeps rising to a high around **2020**, while **engagement** is already past its peak. This divergence implies **attention dilution** (more titles splitting the same audience) and a likely **decline in engagement per book** compared with 2018.  

- 📉 **Recent years (2021+): sharp drop**: Both lines collapse, with engagement near zero. This almost certainly reflects **data recency effects** (new titles haven’t had time to accumulate reviews) and/or dataset coverage limits—not a real market crash.  

- ⏳ **Lead–lag relationship:** Engagement typically lags releases, and peaks in engagement **precede** peaks in release volume. This fits the idea that audiences respond after titles have had time to spread.  

## **14. How have audiobook quality trends evolved over time?**

<details>
<summary><code>Expand Analysis Approach</code></summary>

To determine audiobook **quality**, we aggregate the average ⭐ `Ratings` using `AVG`.  
Since we only want meaningful data, we **filtered out all audiobooks with no reviews**.  

📅 Similar to **Problem #13**, we use `YEAR` and `DATENAME` to extract the **year** and **month** from `Release Date`, while `DATEPART` ensures the data is ordered **chronologically**. 

```sql
SELECT
	YEAR([Release Date]) AS year,
	LEFT(DATENAME(MONTH,[Release Date]), 3) AS month,
	AVG(Ratings) AS avg_rating
FROM cleaned_audible_book
WHERE Ratings <> 0
GROUP BY YEAR([Release Date]), LEFT(DATENAME(MONTH,[Release Date]), 3), DATEPART(MONTH,[Release Date])
ORDER BY YEAR([Release Date]),DATEPART(MONTH,[Release Date])  
```
</details>

![alt text](<images/fig.9 quality trends overtime.png>)
<p align="center"><b>Fig.9 Quality Trends Overtime</b></p>

### 🔑 **Insights:**

- 📊 **Quality is remarkably stable**: Average ratings stay in a tight band **(~4.4–4.7/5)** across 1998–2023, reflecting consistently positive customer sentiment with **no long-term decline**.  

- ⚖️ **Early years show more volatility**: In the late 1990s–early 2000s, ratings fluctuate more due to **small sample sizes**—fewer titles and reviews make yearly averages swing widely.  

- 📉➡️📈 **Mild mid-2010s softening, then rebound**: Ratings drift slightly downward through the mid-2010s, recover around 2016, dip again, and then tick upward in the early 2020s.  

- 🎯 **Ratings are “compressed” near the top**: Even if quality shifts, the average chart looks flat due to **rating compression, positivity bias, and ceiling effects**. Ratings are informative, but not a perfect measure of quality trends.  

- 🚀 **Catalog growth didn’t drag quality down**: Despite the surge in audiobook releases (see **Problem #13**), average ratings stayed high—suggesting strong **editorial standards** or consumer filtering, where weaker titles fail to gather enough ratings to affect the mean. 

---

# **What I Learned**

Throughout this project, I sharpened my understanding of the **audiobook market** and enhanced my skills in **SQL** and **Tableau**—especially in **data manipulation, data analysis, and data visualization**.  
Here are some of the most important and specific takeaways:

- 🧹 **Effective Data Cleaning**  
  Data cleaning is essential for transforming raw datasets into **business-ready data**. Without it, datasets remain noisy and full of anomalies, which prevents effective **aggregation, filtering, grouping, and ordering**. By carefully cleaning the data, I ensured the analysis could generate **reliable and meaningful insights**.

- ⚙️ **Advanced SQL usage**  
  Leveraging SQL functions creatively allowed me to **clean, validate, and aggregate** data efficiently—making queries both accurate and optimized for performance.

- 🎯 **Strategic analytical skills**  
  I strengthened my ability to:  
  - Spot anomalies in the data  
  - Select the best cleaning methods  
  - Identify which aspects to analyze for **market insights**  
  - Design effective visualizations that maximize clarity  
  - Translate data into **impactful, actionable stories**

- 📖 **Storytelling optimization**  
  At its core, data is just **numbers and text**—raw, overwhelming, and often confusing. To make analysis **understandable and persuasive**, storytelling is key. Instead of merely presenting SQL queries, tables, or charts, I built a **narrative story** that transforms complex results into **clear insights** for stakeholders who may not have technical expertise.

---

# **Challenges I Faced**

This project was not without difficulties, but each challenge provided valuable learning opportunities:

- 🛠️ **Poor data quality**  
  The dataset contained many anomalies, requiring the design of robust cleaning strategies. Handling these inconsistencies was one of the most challenging but rewarding parts of the project.

- 🔍 **Complex data analysis**  
  Defining effective approaches to solve analytical problems was demanding but crucial. It pushed me to think critically about **methodology** and how best to present insights.

- ⚖️ **Balancing breadth and depth**  
  I had to constantly balance between going **deep into detailed analysis** and maintaining a **broad overview** of the data landscape. Striking this balance ensured that insights were comprehensive yet focused.

---

