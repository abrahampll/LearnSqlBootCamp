USE AdventureWorks
GO


-- COUNT() , AVG, SUM(), MAX(), MIN()
SELECT FirstName, COUNT(*)
FROM Person.Person
GROUP BY FirstName


SELECTV CODIGOLOCAL, SUM(VENTA)
FROM TABLASVENTAS
GROUP BY CODIGOLOCAL


SELECT FirstName, LastName, COUNT(1)
FROM Person.Person
GROUP BY FirstName, LastName



SELECT C.CustomerID, C.PersonID, C.AccountNumber, SO.BillToAddressID, SO.CreditCardID
, SUM(SO.SubTotal) SUBT, SUM(SO.TotalDue) TOTALDUE
FROM Sales.Customer C
	INNER JOIN Sales.SalesOrderHeader SO
		ON C.CustomerID = SO.CustomerID
GROUP BY C.CustomerID, C.PersonID, C.AccountNumber, SO.BillToAddressID, SO.CreditCardID


