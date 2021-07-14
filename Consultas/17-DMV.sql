
SELECT session_id,login_time, PROGRAM_NAME
FROM sys.dm_exec_sessions
WHERE is_user_process = 55

SP_WHO2 -- 1 AL 50 SON SESION DEL MOTOR 


SELECT  m.physical_memory_in_use_kb, m.memory_utilization_percentage
FROM sys.dm_os_process_memory m;

SELECT * FROM  sys.dm_exec_connections;


