USE AdventureWorks

GO

-- DROP VIEW  [HumanResources].[vEmpleados] 

CREATE VIEW [HumanResources].[vEmpleados] 
AS
SELECT p.FirstName + ' ' + p.LastName AS Nombre, JobTitle AS Cargo
FROM HumanResources.Employee e
  JOIN Person.Person p
   ON e.BusinessEntityID=p.BusinessEntityID;

GO

SELECT * FROM HumanResources.vEmpleados
WHERE Cargo = 'Tool Designer'

GO


CREATE VIEW SALES.SODSOH
AS
SELECT SOD.SalesOrderID NOMBRE1, SOH.SalesOrderID NOMBRE2 FROM
SALES.SalesOrderDetail SOD
INNER JOIN Sales.SalesOrderHeader SOH
	ON SOD.SalesOrderID=SOH.SalesOrderID


SELECT * FROM Sales.SalesOrderHeader
WHERE SalesOrderID  IN (SELECT NOMBRE1 FROM SALES.SODSOH)