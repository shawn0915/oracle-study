-- subprogram 子程序

-- PROCEDURE

CREATE OR REPLACE PROCEDURE sayhello
as
begin
dbms_output.put_line('say sth.');
end;
/

-- 调用
exec SAYHELLO;

-- FUNCTION


create or replace function welcome
return varchar2
as
begin
return 'hello, dalian.';
end;
/

-- 调用
select welcome from dual;


