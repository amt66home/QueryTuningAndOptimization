/*
Create an extended event
Start the event
Stop the event
*/
CREATE EVENT SESSION [test] ON SERVER
ADD EVENT sqlserver.query_post_execution_showplan(
ACTION(sqlserver.plan_handle)
WHERE ([sqlserver].[database_name]=N'AdventureWorks2019'))
ADD TARGET package0.ring_buffer
WITH (STARTUP_STATE=OFF)
GO

ALTER EVENT SESSION [test]
ON SERVER
STATE=START


ALTER EVENT SESSION [test]
ON SERVER
STATE=STOP
