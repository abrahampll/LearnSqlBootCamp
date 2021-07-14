USE AdventureWorks
go

WITH CTE_YEAR AS
 (SELECT YEAR(OrderDate) AS OrderYear, CustomerID
 FROM Sales.SalesOrderHeader )
SELECT OrderYear, count(DISTINCT CustomerID) AS CUST_COUNT
FROM CTE_YEAR 
GROUP BY OrderYear