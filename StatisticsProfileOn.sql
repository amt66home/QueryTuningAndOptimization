/*
 Gives detailed info on the execution
*/
SET STATISTICS PROFILE ON
SELECT * FROM Sales.SalesOrderDetail
WHERE OrderQty * UnitPrice > 25000
GO
SET STATISTICS PROFILE OFF
