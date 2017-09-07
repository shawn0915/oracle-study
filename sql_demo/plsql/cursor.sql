-- cursor



declare
v_empno emp.empno%type:=&eno;
v_name emp.ename%type;
v_flag number:=10;
begin
select ename into v_name from emp where empno=v_empno;
-- dbms_output.put_line(v_flag);
v_flag:=v_flag/0;
exception
when NO_DATA_FOUND then
dbms_output.put_line('您查询的'||v_empno||'员工不存在！');
when TOO_MANY_ROWS then
dbms_output.put_line('返回数据太多！');
when others then
dbms_output.put_line('发生不明异常！');
end;


declare
v_hiredate emp.hiredate%type:=to_date('1981-12-3','yyyy-mm-dd');
v_name emp.ename%type;
begin
select ename into v_name from emp where hiredate=v_hiredate;
dbms_output.put_line(v_name);
exception
when TOO_MANY_ROWS then
dbms_output.put_line('返回数据太多！');
end;




declare
v_empno emp.empno%type:=&eno;
v_emp emp%rowtype;
can_not_search exception;
begin

if v_empno=7839 then
raise can_not_search;
end if;

select * into v_emp from emp where empno=v_empno;

dbms_output.put_line(v_emp.ename||'  '||v_emp.job);
exception
when can_not_search then
-- dbms_output.put_line('无权查看该用户！');
RAISE_APPLICATION_ERROR(-20010,'无权查看该用户！');
end;


declare


begin
update emp set sal=sal+100 where deptno=20;
if SQL%found then
dbms_output.put_line('有数据');
end if;
if SQL%notfound then
dbms_output.put_line('没有数据');
end if;
dbms_output.put_line('加薪【'||SQL%rowcount||'】人！');

if SQL%isOPEN then
dbms_output.put_line('游标打开！');
else
dbms_output.put_line('游标关闭！');
end if;
end;




declare
v_empno emp.empno%type:=&eno;
v_emp emp%rowtype;
begin
select * into v_emp from emp where empno=v_empno;
if SQL%found then
dbms_output.put_line('有数据');
end if;
if SQL%notfound then
dbms_output.put_line('没有数据');
end if;
end;




declare
cursor cur_emp is select * from emp where deptno=&dno; -- 1、声明游标
v_emp emp%rowtype;
begin
-- 2、打开游标
open cur_emp;

-- 3、提取游标数据
loop
fetch cur_emp into v_emp;
exit when cur_emp%notfound;
dbms_output.put_line(v_emp.empno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.sal||'  '||v_emp.deptno);
end loop;

-- 4、关闭游标
close cur_emp;
end;



declare
cursor cur_emp is select * from emp where deptno=&dno; -- 1、声明游标
v_emp emp%rowtype;
begin
-- 2、打开游标
open cur_emp;
fetch cur_emp into v_emp;
-- 3、提取游标数据
while cur_emp%found loop
dbms_output.put_line(v_emp.empno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.sal||'  '||v_emp.deptno);
if v_emp.sal<2000 then
update emp set sal=sal+100 where current of cur_emp;
end if;
fetch cur_emp into v_emp;
end loop;
-- 4、关闭游标
close cur_emp;
end;




declare
cursor cur_emp(v_deptno emp.deptno%type) is select * from emp where deptno=v_deptno for update; --1、声明游标
v_emp emp%rowtype;
begin
-- 2、打开游标
-- open cur_emp;
-- fetch cur_emp into v_emp;
-- 3、提取游标数据
-- while cur_emp%found loop
--   dbms_output.put_line(v_emp.empno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.sal||'  '||v_emp.deptno);
--   fetch cur_emp into v_emp;
-- end loop;
-- 4、关闭游标
-- close cur_emp;
for v_emp in cur_emp(10) loop
dbms_output.put_line(v_emp.empno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.sal||'  '||v_emp.deptno);
if v_emp.sal<2000 then
update emp set sal=sal+100 where current of cur_emp;
end if;
end loop;


for v_emp in cur_emp(20) loop
dbms_output.put_line(v_emp.empno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.sal||'  '||v_emp.deptno);
if v_emp.sal<2000 then
update emp set sal=sal+100 where current of cur_emp;
end if;
end loop;

for v_emp in cur_emp(30) loop
dbms_output.put_line(v_emp.empno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.sal||'  '||v_emp.deptno);
if v_emp.sal<2000 then
update emp set sal=sal+100 where current of cur_emp;
end if;
end loop;
end;


declare
type ref_cur_test is ref cursor ;
v_cur ref_cur_test;
v_emp emp%rowtype;
v_dept dept%rowtype;
begin
open v_cur for select * from emp;
loop
fetch v_cur into v_emp;
exit when v_cur%notfound;
dbms_output.put_line(v_emp.empno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.sal||'  '||v_emp.deptno);
end loop;
close v_cur;

open v_cur for select * from dept;
loop
fetch v_cur into v_dept;
exit when v_cur%notfound;
dbms_output.put_line(v_dept.deptno||'  '||v_dept.dname||'  '||v_dept.loc);
end loop;
close v_cur;
end;




declare

type ref_cur_test is ref cursor
return emp%rowtype;
v_cur ref_cur_test;
v_dept dept%rowtype;
v_emp emp%rowtype;
begin
open v_cur for select * from emp;
loop
fetch v_cur into v_emp;
exit when v_cur%notfound;
dbms_output.put_line(v_emp.empno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.sal||'  '||v_emp.deptno);
end loop;
close v_cur;

open v_cur for select * from emp where sal>5000;
loop
fetch v_cur into v_emp;
exit when v_cur%notfound;
dbms_output.put_line(v_emp.empno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.sal||'  '||v_emp.deptno);
end loop;
close v_cur;

open v_cur for select * from dept;
loop
fetch v_cur into v_dept;
exit when v_cur%notfound;
dbms_output.put_line(v_dept.deptno||'  '||v_dept.dname||'  '||v_dept.loc);
end loop;
close v_cur;
end;





declare
v_empsbydept sys_refcursor;
cursor v_curdept is select deptno,dname,loc,cursor(select * from emp where deptno=A.deptno) from dept A;
v_deptno dept.deptno%type;
v_dname dept.dname%type;
v_dloc dept.loc%type;
v_emp emp%rowtype;
begin
open v_curdept;
loop
fetch v_curdept into v_deptno,v_dname,v_dloc,v_empsbydept ;
exit when v_curdept%notfound;
dbms_output.put_line(v_deptno||'  '||v_dname||'  '||v_dloc);
dbms_output.put_line('下属员工：');
loop
fetch  v_empsbydept into    v_emp;
exit when v_empsbydept%notfound;
dbms_output.put_line(v_emp.empno||'  '||v_emp.ename||'  '||v_emp.job||'  '||v_emp.sal||'  '||v_emp.deptno);
end loop;
end loop;
close v_curdept;
end;




-- 光标: 使用游标查询员工姓名和工资，并打印

/*
光标的属性：
%isopen 是否被打开
%rowcount 行数
%notfound 是否有值
*/

set serveroutput on

declare
-- 光标
cursor cemp is select ename,sal from emp;
pename emp.ename%type;
psal   emp.sal%type;
begin
open cemp;
loop
-- 从集合中取值
fetch cemp into pename,psal;
-- ****
exit when cemp%notfound;

dbms_output.put_line(pename||'的薪水是'||psal);

end loop;
close cemp;
end;
/