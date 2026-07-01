/*
===========================================================
ONLINE RETAIL BI PROJECT
STEP 1 - DATA QUALITY ASSESSMENT
===========================================================

Purpose:
Evaluate the quality of the raw dataset before performing
any cleaning or transformations.

Checks performed:
- Total records
- Distinct invoices
- Distinct customers
- Distinct products
- Distinct countries
- Cancelled invoices
- Missing Customer IDs
- Negative quantities
- Zero prices
===========================================================
*/

SELECT COUNT(*) AS Total_Records
FROM online_retail_raw;

SELECT COUNT(DISTINCT InvoiceNo) AS Total_Invoices
FROM online_retail_raw;

SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM online_retail_raw;

SELECT COUNT(DISTINCT StockCode) AS Total_Products
FROM online_retail_raw;

SELECT COUNT(DISTINCT Country) AS Total_Countries
FROM online_retail_raw;

SELECT COUNT(*) AS Cancelled_Invoices
FROM online_retail_raw
WHERE InvoiceNo LIKE 'C%';

SELECT COUNT(*) AS Missing_Customers
FROM online_retail_raw
WHERE CustomerID IS NULL
   OR CustomerID='';

SELECT COUNT(*) AS Negative_Quantities
FROM online_retail_raw
WHERE Quantity<=0;

SELECT COUNT(*) AS Zero_Prices
FROM online_retail_raw
WHERE UnitPrice='0'
   OR UnitPrice='0,00';