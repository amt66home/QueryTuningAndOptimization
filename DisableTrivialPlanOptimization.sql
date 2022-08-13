/*
Simple queries that don't require cost estimation, avoiding the expensive full optimization, use TRIVIAL plan
optimization.  To test using full optimization use query hint for trace flag 8757
Note this trace flag is only supported as per this article:
http://support.microsoft.com/kb/2801413
*/
select * from sales.SalesOrderHeader
where SalesOrderID = 43666
option (querytraceon 8757)
