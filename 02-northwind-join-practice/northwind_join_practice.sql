/*
    Northwind JOIN Practice
    Database: Northwind
*/

-- ============================================================
-- Q26 - Customers and their orders using INNER JOIN
-- ============================================================
SELECT
    c.CustomerID,
    c.CompanyName,
    o.OrderID,
    o.OrderDate
FROM Customers AS c
INNER JOIN Orders AS o
    ON c.CustomerID = o.CustomerID;


-- ============================================================
-- Q27 - Customers and their orders using LEFT JOIN
-- ============================================================
SELECT
    c.CustomerID,
    c.CompanyName,
    o.OrderID,
    o.OrderDate
FROM Customers AS c
LEFT JOIN Orders AS o
    ON c.CustomerID = o.CustomerID;
