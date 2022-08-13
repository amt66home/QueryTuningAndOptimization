/*
Will return current running queries and their plan handles
*/
SELECT * FROM sys.dm_exec_requests
CROSS APPLY sys.dm_exec_query_plan(plan_handle)
