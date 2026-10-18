SELECT * FROM Transactio

SELECT
    Status,
    COUNT(*) AS Total_Transactions
FROM Transactio
GROUP BY Status
ORDER BY Total_Transactions DESC;


-- Sales Channel Distribution
SELECT SalesChannel , COUNT(*) AS Total_Transactions
FROM Transactio 
GROUP BY SalesChannel
ORDER BY Total_Transactions DESC;

SELECT * FROM Products


-- Product Category Distribution

SELECT
    Category,
    COUNT(*) AS Total_Products
FROM Products
GROUP BY Category
ORDER BY Total_Products DESC;


