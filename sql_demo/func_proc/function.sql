/*
函数和过程都是子程序;
优点:1.模块化 2.可重用性 3.可维护性 4.安全性
函数是可以返回值的命名的 PL/SQL 子程序。
创建函数的语法：
CREATE [OR REPLACE] FUNCTION
  <function name> [(param1,param2)]
RETURN <datatype>  IS|AS
  [local declarations]
BEGIN
  Executable Statements;
  RETURN result;
EXCEPTION
  Exception handlers;
END;
*/

create or replace function fun_hello
return varchar2 is
begin
return 'hello world';
end;
-- 调用方式1(使用select语句调用)
select to_char(sysdate,'yyyy-MM-dd') from dual
select fun_hello from dual
-- 使用程序块调用
declare
v_str varchar2(20);
begin
v_str:=fun_hello();
dbms_output.put_line(v_str);
end;

-- 带参数的存储过程
create or replace function fun_hello2(params varchar2)
return varchar2 is
begin
return 'hello,'||params;
end;
select fun_hello2('zhangsan') from dual
-- 调用
declare
v_name varchar2(10):='&请输入名称';
v_str varchar2(20);
begin
v_str:=fun_hello2(v_name);
dbms_output.put_line(v_str);
end;

-- 计算总页数
create or replace function getTotalPages(tableName varchar2,pageSize number)
return number is
totalRows number;-- 总记录数
totalPages number;-- 总页数
v_sql varchar2(200);
begin
-- 查询总记录数
v_sql:='select count(*) from '||tableName;
execute immediate v_sql into  totalRows;
-- 计算总页数(总记录数%分页单位==0?总记录数/分页单位:总记录数/分页单位+1)
if mod(totalRows,pageSize)=0  then
totalPages:=totalRows/pageSize;
else
totalPages:=floor(totalRows/pageSize)+1;
end if;
return totalPages;
end;

create or replace function getTotalPages2(tableName varchar2,pageSize number)
return number is
totalRows number;-- 总记录数
totalPages number;-- 总页数
v_sql varchar2(200);
begin
-- 查询总记录数
v_sql:='select count(*) from '||tableName;
execute immediate v_sql into  totalRows;
-- 计算总页数(总记录数%分页单位==0?总记录数/分页单位:总记录数/分页单位+1)
totalPages:= ceil(totalRows/pageSize);
return totalPages;
end;
-- 调用
select getTotalPages2('emp',3) from dual
