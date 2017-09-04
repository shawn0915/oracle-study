/*
游标类似jdbc中ResultSet,逐行处理查询结果，以编程的方式访问数据
游标的类型:隐式游标，显式游标，REF 游标
1.隐式游标：
在PL/SQL中使用DML语句时自动创建隐式游标
隐式游标自动声明、打开和关闭，其名为 SQL
通过检查隐式游标的属性可以获得最近执行的DML 语句的信息
隐式游标的属性有：
%FOUND – SQL 语句影响了一行或多行时为 TRUE
%NOTFOUND – SQL 语句没有影响任何行时为TRUE
%ROWCOUNT – SQL 语句影响的行数
%ISOPEN  - 游标是否打开，始终为FALSE
*/
declare
v_empno emp.empno%type:='&请输入编号';
v_sal emp.sal%type:='&请输入薪资';
begin
update emp set sal= v_sal where empno=v_empno;
if SQL%FOUND then
dbms_output.put_line('数据已更新!');
commit;
end if;
dbms_output.put_line('受影响的行数:'||SQL%ROWCOUNT);
end;
select * from emp;

/*
显示游标:需要声明,开启和关闭
声明游标: cursor 游标名称 is select statement
游标的操作过程: 声明游标--->打开游标-->利用循环提前行--->关闭游标
*/
declare
v_row emp%rowtype;
cursor my_cur is select * from emp where sal<2000; -- 声明游标
begin
-- 打开游标
open my_cur;
loop
fetch my_cur into v_row;--提取行
exit when my_cur%NOTFOUND;
dbms_output.put_line('编号:'||v_row.empno||',姓名:'||v_row.ename||',薪水:'||v_row.sal);
end loop;
close my_cur; -- 关闭游标
end;

-- 使用while循环遍历游标(不推荐)
declare
v_row emp%rowtype;
cursor my_cur is select * from emp where sal<2000; -- 声明游标
begin
-- 打开游标
open my_cur;
fetch my_cur into v_row;-- 提取行
while my_cur%FOUND
loop
dbms_output.put_line('编号:'||v_row.empno||',姓名:'||v_row.ename||',薪水:'||v_row.sal);
fetch my_cur into v_row;-- 提取行
end loop;
close my_cur; -- 关闭游标
end;

-- for循环(推荐)
declare
cursor my_cur is select * from emp where sal<2000; -- 声明游标
begin
for v_row in  my_cur
loop
dbms_output.put_line('编号:'||v_row.empno||',姓名:'||v_row.ename||',薪水:'||v_row.sal);
end loop;
end;
/*
带参数的游标
声明显式游标时可以带参数以提高灵活性
声明带参数的显式游标的语法如下：
	CURSOR <cursor_name>(<param_name> <param_type>)
     IS select_statement
*/
declare
v_ename varchar2(10);
cursor my_cur(name varchar2) is select * from emp where ename like '%'||v_ename||'%'; -- 声明带参数的游标
begin
v_ename:='&请输入名称';
for v_row in  my_cur(v_ename)
loop
dbms_output.put_line('编号:'||v_row.empno||',姓名:'||v_row.ename||',薪水:'||v_row.sal);
end loop;
end;

/*
使用显示游标更新行
允许使用游标删除或更新活动集中的行
声明游标时必须使用 SELECT … FOR UPDATE语句
    CURSOR <cursor_name> IS
	  SELECT statement FOR UPDATE;

	UPDATE <table_name>
	SET <set_clause>
	WHERE CURRENT OF <cursor_name>
*/
-- 员工工资<1500,加薪200
select * from emp where sal<1500
declare
cursor my_cur is select * from emp where sal<1500 for update; -- 声明游标
begin
for v_row in  my_cur
loop
update emp set sal=sal+200 where current of my_cur;
end loop;
commit;
end;

/*
REF 游标和游标变量用于处理运行时动态执行的 SQL 查询
创建游标变量需要两个步骤：
声明 REF 游标类型
声明 REF 游标类型的变量
用于声明 REF 游标类型的语法为：
	TYPE <ref_cursor_name> IS REF CURSOR
	[RETURN <return_type>];
*/
declare
-- 声明Ref游标类型
type ref_mycur_type is ref cursor;
-- 声明Ref类型的游标变量
my_cur ref_mycur_type;
v_row emp%rowtype;
begin
open my_cur for select * from emp where sal<1500;
loop
fetch my_cur into v_row;-- 提取行
exit when my_cur%NOTFOUND;
dbms_output.put_line('编号:'||v_row.empno||',姓名:'||v_row.ename||',薪水:'||v_row.sal);
end loop;
close  my_cur;
end;
-- 动态执行SQL(动态统计指定表的总记录数)
declare
v_count number;
v_sql varchar2(200);
v_table varchar2(20):='&请输入表名';
begin
v_sql:='select count(*) from '||v_table;
execute immediate v_sql into v_count;
dbms_output.put_line('总记录数:'||v_count);
end;

