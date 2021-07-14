USE AdventureWorks
GO


SELECT h.CustomerID, MONTH(h.OrderDate) AS OrderMonth, d.OrderQty
, SUM(d.OrderQty)
FROM Sales.SalesOrderHeader h
 INNER JOIN Sales.SalesOrderDetail D
 ON h.SalesOrderID = d.SalesOrderID
WHERE YEAR(h.OrderDate) = 2011 AND H.CustomerID = 30117
GROUP BY  h.CustomerID, h.OrderDate, d.OrderQty
ORDER BY H.CustomerID

SELECT h.CustomerID, MONTH(h.OrderDate) AS OrderMonth, d.OrderQty
, SUM(d.OrderQty) OVER (PARTITION BY H.customerId )
FROM Sales.SalesOrderHeader h
 INNER JOIN Sales.SalesOrderDetail D
 ON h.SalesOrderID = d.SalesOrderID
WHERE YEAR(h.OrderDate) = 2011 
ORDER BY CustomerID 


-- PARTITION BY EQUIVALE A HACER UN AGRUPAMIENTO 
-- SINO SE ASIGNA SE ASUME QUE ES EL TOTLAL 
SELECT CustomerID, SalesOrderID ,SubTotal,
100 * SubTotal / SUM(SubTotal) OVER (PARTITION BY CUSTOMERID) AS CUSTOMERTOTAL,
100 * SubTotal  / SUM(SubTotal) OVER () AS TOTAL
FROM Sales.SalesOrderHeader 

GO
-- SELECT SUM(SubTotal)  FROM Sales.SalesOrderHeader 

--SELECT ProductID
	

SELECT c.ProductCategoryID, d.OrderQty, YEAR(d.SalesOrderID) 
, SUM(d.OrderQty) OVER (
	PARTITION BY c.ProductCategoryID
	ORDER BY h.OrderDate
	ROWS BETWEEN UNBOUNDED PRECEDING 
	AND CURRENT ROW) AS RunningQty	
FROM Sales.SalesOrderDetail d
INNER JOIN Sales.SalesOrderHeader h ON d.SalesOrderID = h.SalesOrderID
INNER JOIN Production.Product p ON d.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory c ON p.ProductSubcategoryID = c.ProductSubcategoryID


SELECT ProductID, OrderQty, YEAR(ModifiedDate),SalesOrderId,
	SUM(OrderQty) OVER ( PARTITION BY SalesOrderId
		ORDER BY ModifiedDate
		ROWS BETWEEN UNBOUNDED PRECEDING
		AND CURRENT ROW) AS RunningQty
FROM Sales.SalesOrderDetail 


SELECT ProductID, OrderQty, YEAR(ModifiedDate),SalesOrderId,
	SUM(OrderQty) OVER ( PARTITION BY SalesOrderId
		ORDER BY ModifiedDate
		ROWS BETWEEN UNBOUNDED PRECEDING
		AND CURRENT ROW) AS RunningQty
FROM Sales.SalesOrderDetail 



SELECT * FROM  Sales.SalesOrderDetail  c 




SELECT * FROM SYS.COLUMNS c 
INNER JOIN SYS.TABLES t ON c.object_id = t.object_id
WHERE c.NAME like 'OrderDate%'
SELECT * FROM SYS.TABLES






