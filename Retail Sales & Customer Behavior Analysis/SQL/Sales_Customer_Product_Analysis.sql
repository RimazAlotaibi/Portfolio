

-- What is the Average Basket Value?
 SELECT COUNT(DISTINCT i.TransactionID) AS Total_Transactions , ROUND(SUM(i.Quantity * i.UnitPriceSAR * (1 - i.DiscountPct / 100.0)),2) AS Total_Sales, ROUND(
        SUM(i.Quantity * i.UnitPriceSAR * (1 - i.DiscountPct / 100.0)) / COUNT(DISTINCT t.TransactionID),2) AS Average_Basket_Value
    FROM Transactio AS t
 JOIN Transaction_Items AS i ON t.TransactionID = i.TransactionID
 WHERE t.Status = 'Completed';


 -- Do customers spend more in-store or online?


 SELECT t.SalesChannel , ROUND(SUM(i.Quantity * i.UnitPriceSAR *(1 - i.DiscountPct / 100.0))/ COUNT(DISTINCT t.TransactionID), 2 ) AS Average_Basket_Value
 FROM Transactio  AS t
 JOIN Transaction_Items AS i ON t.TransactionID = i.TransactionID
 WHERE t.Status = 'Completed'
 GROUP BY t.SalesChannel;



-- Who are the most frequent customers?


SELECT TOP 10 CustomerID,count(*) AS Total_Purchases FROM Transactio 
WHERE Status = 'Completed'
GROUP BY CustomerID
ORDER BY Total_Purchases DESC;




-- Top 10 Customers by Spending

SELECT TOP 10
    t.CustomerID,
    COUNT(DISTINCT t.TransactionID) AS Total_Purchases,
    ROUND(SUM(
        i.Quantity * i.UnitPriceSAR *
        (1 - i.DiscountPct / 100.0)
    ), 2) AS Total_Spent

FROM Transactio t
JOIN Transaction_Items i
    ON t.TransactionID = i.TransactionID

WHERE t.Status = 'Completed'

GROUP BY t.CustomerID
ORDER BY Total_Spent DESC;



-- Last Purchase Date

SELECT TOP 10
    CustomerID,
MAX(TransactionDate) AS Last_Purchase
FROM Transactio
WHERE Status = 'Completed'
GROUP BY CustomerID
ORDER BY Last_Purchase DESC;



SELECT TOP 10
    CustomerID,
MAX(TransactionDate) AS Last_Purchase,
DATEDIFF(
        DAY,
        MAX(TransactionDate),
        '2026-09-30'
    ) AS Recency_Days
FROM Transactio
WHERE Status = 'Completed'
GROUP BY CustomerID
ORDER BY Recency_Days DESC;




-- RFM Analysis



SELECT TOP 10
    t.CustomerID,
DATEDIFF(
        DAY,
        MAX(TransactionDate),
        '2026-09-30'
    )  AS Recency,

    COUNT(DISTINCT t.TransactionID) AS Frequency,

    ROUND(SUM(
        i.Quantity * i.UnitPriceSAR *
        (1 - i.DiscountPct / 100.0)
    ), 2) AS Monetary

FROM Transactio t
JOIN Transaction_Items i
    ON t.TransactionID = i.TransactionID

WHERE t.Status = 'Completed'
GROUP BY t.CustomerID
ORDER BY Monetary DESC;









-- Customer Segmentation

SELECT
    CustomerID,
    DATEDIFF(DAY, MAX(TransactionDate),
        '2026-09-30') AS Recency_Days,

    CASE
        WHEN DATEDIFF(DAY, MAX(TransactionDate),
            '2026-09-30') <= 30 THEN 'Active'

        WHEN DATEDIFF(DAY, MAX(TransactionDate),
            '2026-09-30') <= 90 THEN 'At Risk'

        ELSE 'Inactive'
    END AS Customer_Segment

FROM Transactio
WHERE Status = 'Completed'
GROUP BY CustomerID
ORDER BY Recency_Days DESC;




-- Count Customers by Segment

SELECT
    Customer_Segment,
    COUNT(*) AS Total_Customers
FROM (
    SELECT
        CustomerID,
        CASE
            WHEN DATEDIFF(DAY, MAX(TransactionDate),
                '2026-09-30') <= 30 THEN 'Active'
            WHEN DATEDIFF(DAY, MAX(TransactionDate),
                '2026-09-30') <= 90 THEN 'At Risk'
            ELSE 'Inactive'
        END AS Customer_Segment
    FROM Transactio
    WHERE Status = 'Completed'
    GROUP BY CustomerID
) AS CustomerSegments

GROUP BY Customer_Segment
ORDER BY Total_Customers DESC;


-- Check Customers Without Completed Purchases

SELECT COUNT(*) AS Customers_Without_Purchases
FROM Customers AS c
LEFT JOIN Transactio AS t
ON c.CustomerID = t.CustomerID
    AND t.Status = 'Completed'
WHERE t.TransactionID IS NULL;





-- Average Purchase Frequency

SELECT
    COUNT(*) AS Total_Purchases,
    COUNT(DISTINCT CustomerID) AS Total_Customers,

    ROUND(
        COUNT(*) * 1.0 /
        COUNT(DISTINCT CustomerID), 2
    ) AS Avg_Purchase_Frequency

FROM Transactio
WHERE Status = 'Completed';





-- Average Customer Spending

SELECT
    ROUND(
        SUM(i.Quantity * i.UnitPriceSAR *
        (1 - i.DiscountPct / 100.0))
        / COUNT(DISTINCT t.CustomerID), 2
    ) AS Avg_Customer_Spending

FROM Transactio AS t
JOIN Transaction_Items AS i
    ON t.TransactionID = i.TransactionID

WHERE t.Status = 'Completed';





-- Identify VIP, Loyal, At Risk, and Inactive Customers


WITH RFM AS (
    SELECT
        t.CustomerID,

        DATEDIFF(DAY, MAX(t.TransactionDate),
            '2026-09-30') AS Recency,

        COUNT(DISTINCT t.TransactionID) AS Frequency,

        ROUND(SUM(
            i.Quantity * i.UnitPriceSAR *
            (1 - i.DiscountPct / 100.0)
        ), 2) AS Monetary

    FROM Transactio t
    JOIN Transaction_Items i
        ON t.TransactionID = i.TransactionID
    WHERE t.Status = 'Completed'
    GROUP BY t.CustomerID
)

SELECT *,
    CASE
        WHEN Recency <= 30
            AND Frequency >= 12
            AND Monetary >= 1150 THEN 'VIP'

        WHEN Recency > 90 THEN 'Inactive'

        WHEN Recency > 30 THEN 'At Risk'

        WHEN Frequency >= 12 THEN 'Loyal'

        ELSE 'Active'
    END AS Customer_Segment

FROM RFM
ORDER BY Monetary DESC;


-- Top 10 Best-Selling Products


SELECT TOP 10
    p.ProductName,
    p.Category,
    SUM(i.Quantity) AS Units_Sold,

    ROUND(SUM(
        i.Quantity * i.UnitPriceSAR *
        (1 - i.DiscountPct / 100.0)
    ), 2) AS Total_Sales

FROM Transaction_Items i
JOIN Products p
    ON i.ProductID = p.ProductID
JOIN Transactio t
    ON i.TransactionID = t.TransactionID

WHERE t.Status = 'Completed'

GROUP BY p.ProductName, p.Category
ORDER BY Total_Sales DESC;



-- Which Product Categories Generate the Most Sales?


SELECT
    p.Category,
    SUM(i.Quantity) AS Units_Sold,

    ROUND(SUM(
        i.Quantity * i.UnitPriceSAR *
        (1 - i.DiscountPct / 100.0)
    ), 2) AS Total_Sales

FROM Transaction_Items AS i
JOIN Products AS p
    ON i.ProductID = p.ProductID
JOIN Transactio AS t
    ON i.TransactionID = t.TransactionID

WHERE t.Status = 'Completed'

GROUP BY p.Category
ORDER BY Total_Sales DESC;

