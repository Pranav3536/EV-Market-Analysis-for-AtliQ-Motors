/*==================================================
   EV Market Analysis for AtliQ Motors
   Business Queries - Part 1
==================================================*/


-- 1. Total Number of EV Makers

SELECT
    COUNT(DISTINCT Maker) AS Total_Makers
FROM atliq_ev;


-- 2. Total EV Sales Across All States

SELECT
    SUM(Electric_vehicles_sold_bystates) AS Total_EV_Sales
FROM atliq_ev;


-- 3. Top 10 States by EV Sales

SELECT
    State,
    SUM(Electric_vehicles_sold_bystates) AS EV_Sales
FROM atliq_ev
GROUP BY State
ORDER BY EV_Sales DESC
LIMIT 10;


-- 4. Top 5 EV Makers in the 2-Wheeler Category

SELECT
    Maker,
    SUM(Electric_vehicles_sold_maker) AS EV_Sales
FROM atliq_ev
WHERE Vehicle_category = '2-Wheelers'
GROUP BY Maker
ORDER BY EV_Sales DESC
LIMIT 5;


-- 5. Average EV Penetration by State

SELECT
    State,
    ROUND(AVG(`EV_Penetration_%`), 2) AS Avg_EV_Penetration
FROM atliq_ev
GROUP BY State
ORDER BY Avg_EV_Penetration DESC;


-- 6. Highest EV Sales Recorded in a Single State

SELECT
    State,
    MAX(Electric_vehicles_sold_bystates) AS Highest_EV_Sales
FROM atliq_ev
GROUP BY State
ORDER BY Highest_EV_Sales DESC
LIMIT 1;
