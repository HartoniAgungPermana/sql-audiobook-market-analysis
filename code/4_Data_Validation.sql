/*
========================================================================================
Data Validation For Cleaned Data
========================================================================================

Purpose:
- This script validates the integrity, consistency, and correctness of the cleaned dataset stored in [cleaned_audible_book]. 
- The checks ensure proper formatting, correct data types, absence of nulls, and adherence to expected standards before further use in analysis.

========================================================================================
*/

USE MyDatabase
GO

-- 1. Check extra characters and capitalization in Author column
SELECT Author
FROM cleaned_audible_book;
-- Perfect

-- 2. Check extra characters and capitalization in Narrator column
SELECT Narrator
FROM cleaned_audible_book;
-- Perfect

-- 3. Check extra characters in Time column
SELECT Time
FROM cleaned_audible_book
WHERE Time LIKE '%hr%' 
   OR Time LIKE '%min%' 
   OR Time LIKE '%Less.than.1ute%' 
   OR Time LIKE '%Less than 1 minute%';
-- Perfect

-- 4. Check datatype of Time column
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'cleaned_audible_book'
  AND COLUMN_NAME = 'Time';
-- int -> Perfect

-- 5. Check nulls in Release Date column
SELECT [Release Date]
FROM cleaned_audible_book
WHERE [Release Date] IS NULL;
-- Perfect

-- 6. Check datatype of Release Date column
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'cleaned_audible_book'
  AND COLUMN_NAME = 'Release Date';
-- date -> Perfect

-- 7. Check standardization of Release Date column
SELECT [Release Date]
FROM cleaned_audible_book;
-- Format = YYYY-MM-DD -> Perfect

-- 8. Check standardization and capitalization of Language column
SELECT DISTINCT Language
FROM cleaned_audible_book;
-- Good capitalization and standardization

-- 9. Check datatype of Ratings column
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'cleaned_audible_book'
  AND COLUMN_NAME = 'Ratings';
-- float -> Perfect

-- 10. Check datatype of Total Review column
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'cleaned_audible_book'
  AND COLUMN_NAME = 'Total Review';
-- int -> Perfect

-- 11. Check datatype of Price column
SELECT DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'cleaned_audible_book'
  AND COLUMN_NAME = 'Price';
-- float -> Perfect

-- 12. Final check -> verify all data is loaded correctly
SELECT *
FROM cleaned_audible_book;
-- Perfectly loaded
