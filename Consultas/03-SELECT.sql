USE AdventureWorks
go

SELECT TABLA1.FirstName, TABLA1.LastName
FROM Person.Person AS TABLA1
WHERE TABLA1.BusinessEntityID =  101

SELECT *
FROM Person.Person pe
	INNER JOIN Person.PersonPhone ph ON pe.BusinessEntityID= ph.BusinessEntityID

