/*
Shows info such as estimated rows, cpu etc
*/
SET SHOWPLAN_ALL ON
GO
SELECT DISTINCT(CITY) FROM Person.Address
GO
SET SHOWPLAN_ALL OFF
