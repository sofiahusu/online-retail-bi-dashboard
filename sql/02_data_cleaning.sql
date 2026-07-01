/*
===========================================================
ONLINE RETAIL BI PROJECT
STEP 2 - DATA CLEANING & TRANSFORMATION
===========================================================

Purpose:
Create a clean working table and prepare fields
for Business Intelligence analysis.

Transformations:
- Duplicate working table
- Convert UnitPrice to numeric
- Create Revenue column
- Convert InvoiceDate to DATETIME
===========================================================
*/

CREATE TABLE online_retail_clean AS
SELECT *
FROM online_retail_raw;

-- Convert UnitPrice into numeric format

ALTER TABLE online_retail_clean
ADD COLUMN UnitPrice_Num DECIMAL(10,2);

UPDATE online_retail_clean
SET UnitPrice_Num =
CAST(REPLACE(UnitPrice, ',', '.') AS DECIMAL(10,2));

-- Create Revenue

ALTER TABLE online_retail_clean
ADD COLUMN Revenue DECIMAL(12,2);

UPDATE online_retail_clean
SET Revenue =
Quantity * UnitPrice_Num;

-- Convert InvoiceDate

ALTER TABLE online_retail_clean
ADD COLUMN InvoiceDate_DT DATETIME;

UPDATE online_retail_clean
SET InvoiceDate_DT =
STR_TO_DATE(
InvoiceDate,
'%d/%m/%Y %H:%i'
);