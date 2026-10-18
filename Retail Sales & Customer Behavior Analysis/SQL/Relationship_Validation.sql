-- Check Relationships


-- Transactions without valid customers
SELECT t.*
FROM Transactio AS t
LEFT JOIN Customers AS c
    ON t.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;

-- Transactions without valid stores
SELECT t.*
FROM Transactio AS t
LEFT JOIN Stores AS s
    ON t.StoreID = s.StoreID
WHERE s.StoreID IS NULL;

-- Items without valid transactions
SELECT i.*
FROM Transaction_Items AS i
LEFT JOIN Transactio AS t
    ON i.TransactionID = t.TransactionID
WHERE t.TransactionID IS NULL;

-- Items without valid products
SELECT i.*
FROM Transaction_Items AS i
LEFT JOIN Products AS p
    ON i.ProductID = p.ProductID
WHERE p.ProductID IS NULL;
