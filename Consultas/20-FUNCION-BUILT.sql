--- CATEGORIAS => SCALAR , AGREGACION , VENTANA, ROWSET
 
 USE AdventureWorks
 GO

 SELECT  SalesOrderID, YEAR(OrderDate) ORDERYEAR
 FROM Sales.SalesOrderHeader

SELECT ABS(-1.0) , ABS(0.0), ABS(1.0);
SELECT CAST(SYSDATETIME() AS DATE ) AS [CURRENT_DATE];
SELECT SYSDATETIME()
SELECT DB_NAME() AS [CURRENT DATABASE];

-- FUNCION ESCALAR OPERA SOBRE UNA FILA Y EL RESULTADO
-- SE DEVUELVE PARA CADA FILA, operan y devuelven su resultado 
-- POR CADA FILA 
SELECT NAME , SUBSTRING(NAME,1,5) [OBTIENE_1_5] ,
GETDATE () as fechahoy
FROM Production.Product

-- FUNCION DE AGREGADO

SELECT H.AccountNumber,COUNT(*) 
FROM Sales.SalesOrderHeader H
GROUP BY H.AccountNumber

-- FUNCION DE VENTANA
SELECT P.ProductID,P.Name, P.ListPrice, 
	P.ProductSubcategoryID
	, RANK () OVER (
			PARTITION BY P.ProductID 
			ORDER BY P.ListPrice DESC
		) 
FROM Production.Product P


