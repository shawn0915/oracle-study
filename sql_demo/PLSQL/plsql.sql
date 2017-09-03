/*
DECLARE
BEGIN

EXCEPTION
WHEN EX_NAME1 THEN
WHEN EX_NAME2 THEN
WHEN OTHERS THEN
END;
/
*/

DECLARE
Pass_Score constant INTEGER:=60;
Adddress VARCHAR2(30):='北京海淀区';
BEGIN
dbms_output.put_line<Pass_Score>;
dbms_output.put_line<Adddress>;
-- EXCEPTION
-- WHEN .. THEN ..
-- WHEN .. THEN ..
-- WHEN OTHERS THEN ..
END;
/