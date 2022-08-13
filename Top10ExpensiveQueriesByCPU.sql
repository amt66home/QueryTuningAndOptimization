/*
Returns the top 10 most expensive queries by CPU usage
*/

SELECT TOP 10
total_worker_time/execution_count AS avg_cpu_time, plan_handle,
query_plan
FROM sys.dm_exec_query_stats
CROSS APPLY sys.dm_exec_query_plan(plan_handle)
ORDER BY avg_cpu_time DESC
