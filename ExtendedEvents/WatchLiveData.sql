/*
Returns live data from a running extended event called Test
To keep loading new data execute it
*/

SELECT
event_data.value('(event/@name)[1]', 'varchar(50)') AS event_name,
event_data.value('(event/action[@name="plan_handle"]/value)
[1]',
'varchar(max)') as plan_handle,
event_data.query('event/data[@name="showplan_xml"]/value/*') as
showplan_xml,
event_data.value('(event/action[@name="sql_text"]/value)[1]',
'varchar(max)') AS sql_text
FROM( SELECT evnt.query('.') AS event_data
FROM
( SELECT CAST(target_data AS xml) AS target_data
FROM sys.dm_xe_sessions AS s
JOIN sys.dm_xe_session_targets AS t
ON s.address = t.event_session_address
WHERE s.name = 'test'
AND t.target_name = 'ring_buffer'
) AS data
CROSS APPLY target_data.nodes('RingBufferTarget/event') AS
xevent(evnt)
) AS xevent(event_data)
