/*
==============================================================
EXTRACTING DATA
==============================================================

1. Script Purpose:
   This script creates a new table for the dataset and then insert the dataset into the created table using 'BULK INSERT'
*/

USE MyDatabase

-- Create the table
CREATE TABLE raw_audible_book (
	name NVARCHAR(300),
	author NVARCHAR(150),
	narrator NVARCHAR(150),
	time NVARCHAR(50),
	release_date NVARCHAR(50),
	language NVARCHAR(50),
	stars NVARCHAR(50),
	price NVARCHAR(50)
)

-- Bulk Insert dataset into the table
BULK INSERT raw_audible_book
FROM 'C:\Users\harto\OneDrive\Dokumen\DATA ANALYST PORTOFOLIO PROJECT\5. Audible Book Data Cleaning With SQL\archive (5)\audible_uncleaned.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    TABLOCK,
    CODEPAGE = '65001',      -- UTF-8 encoding
    DATAFILETYPE = 'char'    -- ensure text is treated properly
);
