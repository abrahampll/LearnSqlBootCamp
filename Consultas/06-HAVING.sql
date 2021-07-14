USE AdventureWorks
GO


SELECT FirstName, COUNT(1)
FROM Person.Person 
WHERE  FirstName = 'Teresa'
GROUP BY FirstName
HAVING COUNT(*) = 22

GO 


SELECT SalesPersonID, CAST(OrderDate AS VARCHAR),
	RIGHT('0' +  CAST(MONTH(OrderDate) AS VARCHAR),2), SUM(Subtotal)
FROM Sales.SalesOrderHeader
GROUP BY 
	SalesPersonID, OrderDate
HAVING SUM(SubTotal) > 100000