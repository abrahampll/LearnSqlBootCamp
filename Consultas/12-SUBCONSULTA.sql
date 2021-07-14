USE AdventureWorks
GO

SELECT MAX(SalesOrderID)  AS UltimaOrder
FROM Sales.SalesOrderHeader


SELECT SalesOrderID, ProductID, UnitPrice, OrderQty
FROM Sales.SalesOrderDetail
WHERE SalesOrderID =  75123

GO

SELECT SalesOrderID, ProductID, UnitPrice, OrderQty
FROM Sales.SalesOrderDetail oExt
WHERE oExt.SalesOrderID= (SELECT MAX(OrderDate)
	FROM Sales.SalesOrderHeader oInt);

SELECT CustomerID, SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader oExt
WHERE oExt.OrderDate= (SELECT MAX(OrderDate)
	FROM Sales.SalesOrderHeader oInt 
	WHERE oInt.CustomerID = oExt.CustomerID);


SELECT *
FROM Sales.SalesOrderDetail
WHERE SalesOrderID IN (SELECT SalesOrderID FROM Sales.SalesOrderHeader)
GO


SELECT * FROM Sales.SalesOrderDetail SOD
	INNER JOIN SALES.SalesOrderHeader SOH
		ON SOD.SalesOrderID = SOH.SalesOrderID
GO


SELECT SalesOrderID, LineTotal,
(SELECT AVG(LineTotal) FROM Sales.SalesOrderDetail) AS AVGLINEATOTAL
FROM Sales.SalesOrderDetail

GO

DECLARE @VALOR INT = (SELECT AVG(LineTotal) FROM Sales.SalesOrderDetail)
SELECT SalesOrderID, LineTotal,
LineTotal - @VALOR
FROM Sales.SalesOrderDetail

SELECT SalesOrderID, LineTotal,
LineTotal - (SELECT AVG(LineTotal) FROM Sales.SalesOrderDetail) AS VALOR 
FROM Sales.SalesOrderDetail


SELECT  SalesOrderID, 
OrderDate, TotalDue , 
(	SELECT COUNT(SalesOrderDetailID)
	FROM SALES.SalesOrderDetail SOD
	WHERE SOD.SalesOrderID = SOH.SalesOrderID
)
FROM Sales.SalesOrderHeader SOH


SELECT SalesOrderID, CustomerID, OrderDate
FROM Sales.SalesOrderHeader
WHERE CustomerID IN  (SELECT CustomerID FROM Sales.Customer
WHERE TerritoryID = 1)