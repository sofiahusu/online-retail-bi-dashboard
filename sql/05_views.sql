/*
===========================================================
ONLINE RETAIL BI PROJECT
STEP 5 - ANALYTICAL VIEWS
===========================================================

Purpose:
Create SQL views that prepare the cleaned dataset for
Power BI reporting.

Views created:
- vw_sales: valid sales transactions only
- vw_dashboard: analytical view with date attributes
===========================================================
*/

-- View 1: Valid sales transactions

CREATE OR REPLACE VIEW vw_sales AS
SELECT *
FROM online_retail_clean
WHERE InvoiceNo NOT LIKE 'C%'
  AND Quantity > 0
  AND Revenue > 0;


-- View 2: Dashboard-ready analytical view

CREATE OR REPLACE VIEW vw_dashboard AS
SELECT
    InvoiceNo,
    InvoiceDate_DT,
    YEAR(InvoiceDate_DT) AS Year,
    MONTH(InvoiceDate_DT) AS Month,
    MONTHNAME(InvoiceDate_DT) AS MonthName,
    QUARTER(InvoiceDate_DT) AS Quarter,
    Country,
    CustomerID,
    Description,
    Quantity,
    UnitPrice_Num,
    Revenue
FROM vw_sales;