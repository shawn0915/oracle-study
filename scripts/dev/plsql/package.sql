-- PACKAGE

-- package head
CREATE OR REPLACE my_pkg
AS
PROCEDURE my_proc(v_test varchar2);
FUNCTION my_func(v_test varchar2) RETURN varchar2;
END;

-- package body
CREATE OR REPLACE package body my_pkg
AS
PROCEDURE my_proc(v_test varchar2)
AS
v_t varchar2(20 CHAR );
BEGIN
v_t := v_test;
dbms_output.put_line('procedure:'||v_test);
END;

FUNCTION my_func(v_test varchar2)
RETURN varchar2
AS
BEGIN
RETURN 'function:' || v_test;
END;

END;
/