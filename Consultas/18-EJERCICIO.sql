/* ESCRIBA UNA CONSULTA QUE UTILICE 
UNA SUB-CONSULTA PARA OBTENER LAS ÓRDENES 
MÁS RECIENTES POR CADA CLIENTE PARA UN MES Y UN AÑO EN PARTICULAR
*/

USE AdventureWorks
GO


SELECT * 
FROM Sales.SalesOrderHeader SOHEXT
WHERE /*CustomerID =  29825 AND  */
OrderDate = 
	(SELECT MAX(OrderDate) ULTIMAORDERN 
		FROM Sales.SalesOrderHeader SOHINT
		WHERE SOHINT.CustomerID= SOHEXT.CustomerID -- CustomerID = 29825
		)
ORDER BY OrderDate
GO

SELECT * 
FROM Sales.SalesOrderHeader SOHEXT
WHERE /*CustomerID =  29825 AND  */
OrderDate = 
	(SELECT MAX(OrderDate) ULTIMAORDERN 
		FROM Sales.SalesOrderHeader SOHINT
		WHERE SOHINT.CustomerID= SOHEXT.CustomerID -- CustomerID = 29825
		AND SOHINT.OrderDate BETWEEN '20140301' AND '20140331'
		)
AND SOHEXT.OrderDate BETWEEN  '20140301' AND '20140331'
GO 
--ORDER BY OrderDate

SELECT * FROM SALES.SalesOrderHeader
WHERE OrderDate BETWEEN  '20140301' AND '20140331' 
GO

--SELECT * FROM Sales.SalesOrderDetail

SELECT CUSTOMERID,MAX(OrderDate) FROM SALES.SalesOrderHeader
WHERE OrderDate BETWEEN '20140301' AND '20140331'
GROUP BY CUSTOMERID



SELECT SalesOrderID,
	SOD.SalesOrderDetailID, LineTotal
, (SELECT AVG(LineTotal) 
	FROM Sales.SalesOrderDetail
	WHERE SalesOrderID= SOD.SalesOrderID),
	(SELECT SUM(LineTotal)
	FROM Sales.SalesOrderDetail
	WHERE SalesOrderID= SOD.SalesOrderID)
FROM Sales.SalesOrderDetail SOD

SELECT * FROM Sales.SalesOrderHeader


SELECT SOH.CustomerID,
(SELECT MAX(LineTotal) 
	FROM Sales.SalesOrderDetail
	WHERE SalesOrderID= SOD.SalesOrderID)
FROM Sales.SalesOrderHeader SOH
	INNER JOIN Sales.SalesOrderDetail SOD
		ON SOH.SalesOrderID = SOD.SalesOrderID

--###########
-- FUNCIONES DE TABLA SE PUEDE ASOCIAR AL AVG, SUM,COUNT