-- Project: Retail Sales & Inventory Analytics Dashboard 

============================================
Query 1 :(KPI)
SELECT
    SUM(Revenue) AS Total_Revenue,
    SUM(Cost) AS Total_Cost,
    SUM(Margin) AS Total_Profit,
    SUM(Units) AS Total_Units_Sold
FROM Retail_FMCG_Sales;

==============================================

Query 2 : Monthly Revenue Trend
SELECT
    YEAR(Invoice_Date) AS Year,
    MONTH(Invoice_Date) AS Month,
    SUM(Revenue) AS Total_Revenue
FROM Retail_FMCG_Sales
GROUP BY YEAR(Invoice_Date), MONTH(Invoice_Date)
ORDER BY Year, Month;

================================================
Query 3 : Revenue & Profit by Brand
SELECT
    Brand,
    SUM(Revenue) AS Total_Revenue,
    SUM(Margin) AS Total_Profit
FROM Retail_FMCG_Sales
GROUP BY Brand
ORDER BY Total_Revenue DESC;

====================================================

Query 4 : High Revenue but Low Margin Brands
SELECT
    Brand,
    SUM(Revenue) AS Total_Revenue,
    SUM(Margin) AS Total_Profit
FROM Retail_FMCG_Sales
GROUP BY Brand
HAVING SUM(Revenue) > 500000
ORDER BY Total_Profit ASC;

=======================================================

Query 5 : Low Stock Analysis
SELECT
    Brand,
    Stock_On_Hand,
    Reorder_Level
FROM Retail_FMCG_Sales
WHERE Stock_On_Hand <= Reorder_Level
ORDER BY Stock_On_Hand;

========================================================

Query 6 : Average Stock by Store Format
SELECT
    Store_Format,
    AVG(Stock_On_Hand) AS Average_Stock,
    AVG(Reorder_Level) AS Average_Reorder_Level
FROM Retail_FMCG_Sales
GROUP BY Store_Format
ORDER BY Average_Stock DESC;

===========================================================

Query 7 : Average Lead Time by Brand
SELECT
    Brand,
    AVG(Lead_Time_Days) AS Average_Lead_Time
FROM Retail_FMCG_Sales
GROUP BY Brand
ORDER BY Average_Lead_Time DESC;

============================================================

Query 8 : Lead Time by Category
SELECT
    Category,
    AVG(Lead_Time_Days) AS Average_Lead_Time
FROM Retail_FMCG_Sales
GROUP BY Category
ORDER BY Average_Lead_Time DESC;

=============================================================

Query 9 : Loyalty Customer Analysis
SELECT
    Loyalty_Flag,
    SUM(Revenue) AS Total_Revenue,
    SUM(Margin) AS Total_Profit
FROM Retail_FMCG_Sales
GROUP BY Loyalty_Flag;

===============================================================

Query 10 : Revenue by Age Group
SELECT
CASE
WHEN Customer_Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Customer_Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Customer_Age BETWEEN 36 AND 45 THEN '36-45'
ELSE '46+'
END AS Age_Group,
SUM(Revenue) AS Total_Revenue
FROM Retail_FMCG_Sales
GROUP BY
CASE
WHEN Customer_Age BETWEEN 18 AND 25 THEN '18-25'
WHEN Customer_Age BETWEEN 26 AND 35 THEN '26-35'
WHEN Customer_Age BETWEEN 36 AND 45 THEN '36-45'
ELSE '46+'
END
ORDER BY Total_Revenue DESC;

================================================================

Query 11 : Sales Channel Performance
SELECT
    Channel,
    SUM(Revenue) AS Total_Revenue,
    SUM(Margin) AS Total_Profit
FROM Retail_FMCG_Sales
GROUP BY Channel
ORDER BY Total_Revenue DESC;

=================================================================

Query 12 : Payment Mode Analysis
SELECT
    Payment_Mode,
    COUNT(*) AS Total_Transactions,
    SUM(Revenue) AS Total_Revenue
FROM Retail_FMCG_Sales
GROUP BY Payment_Mode
ORDER BY Total_Revenue DESC;

===================================================================

Query 13 : Store Format Performance
SELECT
    Store_Format,
    SUM(Revenue) AS Total_Revenue,
    SUM(Margin) AS Total_Profit
FROM Retail_FMCG_Sales
GROUP BY Store_Format
ORDER BY Total_Revenue DESC;

====================================================================

Query 14 : Top 10 Revenue Cities
SELECT TOP 10
    City,
    SUM(Revenue) AS Total_Revenue
FROM Retail_FMCG_Sales
GROUP BY City
ORDER BY Total_Revenue DESC;

======================================================================

Query 15 : Revenue by Customer Gender
SELECT
    Customer_Gender,
    SUM(Revenue) AS Total_Revenue,
    SUM(Margin) AS Total_Profit
FROM Retail_FMCG_Sales
GROUP BY Customer_Gender
ORDER BY Total_Revenue DESC;

========================================================================

Query 16 : Inventory Risk by Category
SELECT
    Category,
    COUNT(*) AS Low_Stock_Items
FROM Retail_FMCG_Sales
WHERE Stock_On_Hand <= Reorder_Level
GROUP BY Category
ORDER BY Low_Stock_Items DESC;

===========================================================================

Query 17 : Store Format Performance by City
SELECT
    City,
    Store_Format,
    SUM(Revenue) AS Total_Revenue,
    SUM(Margin) AS Total_Profit
FROM Retail_FMCG_Sales
GROUP BY City, Store_Format
ORDER BY City, Total_Revenue DESC;

=============================================================================

Query 18 : Revenue & Margin by Category 
SELECT
    Category,
    SUM(Revenue) AS Total_Revenue,
    SUM(Margin) AS Total_Profit
FROM Retail_FMCG_Sales
GROUP BY Category
ORDER BY Total_Revenue DESC;

==============================================================================

Query 19 : Average Selling Price by Brand 
SELECT
    Brand,
    AVG(Selling_Price) AS Average_Selling_Price
FROM Retail_FMCG_Sales
GROUP BY Brand
ORDER BY Average_Selling_Price DESC;

===============================================================================

Query 20 : Top 10 Brands by Units Sold 
SELECT TOP 10
    Brand,
    SUM(Units) AS Total_Units_Sold
FROM Retail_FMCG_Sales
GROUP BY Brand
ORDER BY Total_Units_Sold DESC;