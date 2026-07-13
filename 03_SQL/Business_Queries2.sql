/*------------------------------------------------
   Business Queries - Part 2
-------------------------------------------------*/

-- 7. Top 5 Makers in the 4-Wheeler Category

SELECT
    Maker,
    SUM(Electric_vehicles_sold_maker) AS EV_Sales
FROM atliq_ev
WHERE Vehicle_category = '4-Wheelers'
GROUP BY Maker
ORDER BY EV_Sales DESC
LIMIT 5;


-- 8. Number of EV Makers by Vehicle Category

SELECT
    Vehicle_category,
    COUNT(DISTINCT Maker) AS Number_of_Makers
FROM atliq_ev
GROUP BY Vehicle_category;


-- 9. Top 5 States with the Lowest EV Sales

SELECT
    State,
    SUM(Electric_vehicles_sold_bystates) AS Total_EV_Sales
FROM atliq_ev
GROUP BY State
ORDER BY Total_EV_Sales ASC
LIMIT 5;

-- 10. Number of EV Makers by Fiscal Year

SELECT
    Fiscal_year,
    COUNT(DISTINCT Maker) AS Total_EV_Makers
FROM atliq_ev
GROUP BY Fiscal_year
ORDER BY Fiscal_year;

-- 11. States with Total Vehicle Sales Above the Overall Average

SELECT
    State,
    SUM(Total_vehicles_sold) AS Total_Vehicle_Sales
FROM atliq_ev
GROUP BY State
HAVING SUM(Total_vehicles_sold) >
(
    SELECT AVG(Total_vehicles_sold)
    FROM atliq_ev
)
ORDER BY Total_Vehicle_Sales DESC;


-- 12. Market Share of Top 5 EV Makers

SELECT
    Maker,
    ROUND(
        SUM(Electric_vehicles_sold_maker) * 100 /
        (
            SELECT SUM(Electric_vehicles_sold_maker)
            FROM atliq_ev
        ),
        2
    ) AS Market_Share_Percentage
FROM atliq_ev
GROUP BY Maker
ORDER BY Market_Share_Percentage DESC
LIMIT 5;

