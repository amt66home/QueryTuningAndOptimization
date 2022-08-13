/*
  Shows the XML plan which, if you click on the link will give you the graphical plan
*/
SET SHOWPLAN_XML ON
GO
SELECT DISTINCT(City) FROM Person.Address
GO
SET SHOWPLAN_XML OFF
