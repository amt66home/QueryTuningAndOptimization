/*
 Gives detailed info on the execution
 Parse and compile time refers to the time it takes SQL Server to optimize the query
*/
SET STATISTICS PROFILE ON
SELECT * FROM Sales.SalesOrderDetail
WHERE OrderQty * UnitPrice > 25000
GO
SET STATISTICS PROFILE OFF
