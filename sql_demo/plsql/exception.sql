
-- 系统例外

/*
Zero_Divide   ( 被零除)

*/
set serveroutput on
declare
pnum number;
begin

pnum := 1/0;

exception
when Zero_Divide then dbms_output.put_line('1: 0不能做被除数');
dbms_output.put_line('2: 0不能做被除数');
when Value_error then dbms_output.put_line('算术错');
when others then dbms_output.put_line('其他例外');
end;
/


set serveroutput on
-- 测试异常处理
declare
vnum number;
begin
vnum := 1 / 0;
dbms_output.put_line(' 正常结束 ');
-- 处理异常
exception
when zero_divide then dbms_output.put_line(' 异常：被0除！ ');
end;
/


-- ========================

/*
自定义例外：
在declare节中定义例外
out_of   exception ;

在可行语句中引起例外
raise out_of ；

在Exception节处理例外
when Out_of then …

 */

-- 查询50号部门的员工姓名
set serveroutput on

declare
cursor cemp is select ename from emp where deptno=50;
pename emp.ename%type;

-- 自定义例外
no_emp_found exception;
begin
open cemp;
-- 取一个员工
fetch cemp into pename;
if cemp%notfound then
raise no_emp_found;
end if;

/*
抛异常后光标可能没有关闭
oracle在遇到抛异常后会自动关闭光标
但，为了保险起见，手动关闭光标
  if cemp%isopen then
    close cemp;
  end if;
*/
close cemp;

exception
when no_emp_found then dbms_output.put_line('没有找到员工');
when others then dbms_output.put_line('其他例外');

end;
/




set serveroutput on
-- 测试异常处理
declare
-- 声明一个异常的类型
my_exception exception;
begin

-- 抛出异常（应是满足某条件时才抛出异常）
raise my_exception;

exception
-- 处理指定类型的异常
when my_exception then dbms_output.put_line(' 自定义的异常 ');
end;
/