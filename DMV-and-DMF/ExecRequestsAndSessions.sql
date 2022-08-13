/*
Request show  cpu time etc for currently running queries
If you want to test this, create a query window, run select @@spid to get the spid for the session_id 
then run a query in the same window. At same time run the query on the exec requests dmv passing the spid
in as below.
*/

-- Session 1
SELECT @@SPID

DBCC FREEPROCCACHE
DBCC DROPCLEANBUFFERS
GO
SELECT * FROM Production.Product p1 CROSS JOIN Production.Product p2

-- Session 2
/*
Assuming session 1 returned 73 as the spid, run this till the first one is finished and returns no rows.
When the query has completed the first one will have no rows returned and you will be left with the stats 
for the session from the second query.
*/
SELECT cpu_time, reads, total_elapsed_time, logical_reads, row_count
FROM sys.dm_exec_requests
WHERE session_id = 73
GO
SELECT cpu_time, reads, total_elapsed_time, logical_reads, row_count
FROM sys.dm_exec_sessions
WHERE session_id = 73
