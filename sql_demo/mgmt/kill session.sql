SELECT
  object_id,
  session_id
FROM v$locked_object;

SELECT
  username,
  sid,
  SERIAL#
FROM v$session;

SELECT
  username,
  sid,
  SERIAL#
FROM v$session
WHERE sid = '47';

ALTER SYSTEM KILL SESSION '47,1441';