--
-- Copyright (c) 1988, 2005, Oracle.  All Rights Reserved.
--
-- NAME
--   glogin.sql
--
-- DESCRIPTION
--   SQL*Plus global login "site profile" file
--
--   Add any SQL*Plus commands here that are to be executed when a
--   user starts SQL*Plus, or uses the SQL*Plus CONNECT command.
--
-- USAGE
--   This script is automatically run
--

-- Loc: $ORACLE_HOME/sqlplus/admin/glogin.sql

set feedback on
define _editor=vi
-- prompt
set termout off
define gname=idle
column global_name new_value gname
SELECT LOWER (USER) || '@' || SUBSTR ( GLOBAL_NAME, 1, DECODE ( dot, 0, LENGTH (GLOBAL_NAME), dot - 1 )) GLOBAL_NAME FROM ( SELECT GLOBAL_NAME, INSTR (GLOBAL_NAME, '.') dot FROM GLOBAL_NAME );
set sqlprompt '&gname> '
set termout on