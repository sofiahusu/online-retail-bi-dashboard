/*
===========================================================
ONLINE RETAIL BI PROJECT
STEP 3 - DATA VALIDATION
===========================================================

Purpose:
Validate the transformed dataset before
starting business analysis.
===========================================================
*/

SELECT
COUNT(*) AS Total_Records,
COUNT(DISTINCT InvoiceNo) AS Orders,
COUNT(DISTINCT CustomerID) AS Customers,
COUNT(DISTINCT StockCode) AS Products,
COUNT(DISTINCT Country) AS Countries,
SUM(InvoiceNo LIKE 'C%') AS Cancelled_Invoices,
SUM(Quantity<0) AS Negative_Quantities,
SUM(CustomerID IS NULL) AS Null_Customers
FROM online_retail_clean;

SELECT
SUM(CustomerID='') AS Empty_Customers,
SUM(CustomerID IS NULL) AS Null_Customers
FROM online_retail_clean;