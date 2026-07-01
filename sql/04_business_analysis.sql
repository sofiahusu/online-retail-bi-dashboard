/*
===========================================================
ONLINE RETAIL BI PROJECT
STEP 4 - BUSINESS ANALYSIS
===========================================================

Purpose:
Generate business metrics used later
inside the Power BI dashboards.
===========================================================
*/

-- Total Revenue

SELECT
ROUND(SUM(Revenue),2) AS Total_Revenue
FROM online_retail_clean;

-- Orders

SELECT
COUNT(DISTINCT InvoiceNo) AS Orders
FROM online_retail_clean;

-- Average Order Value

SELECT
ROUND(
SUM(Revenue)/COUNT(DISTINCT InvoiceNo),
2
) AS Average_Order_Value
FROM online_retail_clean;

-- Revenue by Country

SELECT
Country,
ROUND(SUM(Revenue),2) AS Revenue
FROM online_retail_clean
GROUP BY Country
ORDER BY Revenue DESC;

-- Top Products

SELECT
Description,
ROUND(SUM(Revenue),2) AS Revenue
FROM online_retail_clean
GROUP BY Description
ORDER BY Revenue DESC
LIMIT 10;