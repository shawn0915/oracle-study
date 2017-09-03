-- ## PLSQL


-- hello world
set serveroutput on
declare
begin
dbms_output.put_line('Hello');
end;
/

--引用型变量：查询并打印7839的姓名和薪水
set serveroutput on

declare
--定义变量
pename emp.ename% TYPE;
psal emp.sal% TYPE;

BEGIN

--查询
select ename,sal into pename,psal from emp where empno=7839;

--打印
dbms_output.put_line(pename||'的薪水是' ||psal);


end;
/


========================


--IF语句

set serveroutput on

accept num prompt 'please input number';

declare
pnum NUMBER := &num;
if pnum = 0 then
dbms_output.put_line('您输入的是0');
elsif pnum = 1 then
dbms_output.put_line('您输入的是1');
elsif pnum = 2 then
dbms_output.put_line('您输入的是2');
else
dbms_output.put_line('您输入的是3');
end if;

end;
/


========================



--光标: 使用游标查询员工姓名和工资，并打印

/*
光标的属性：
%isopen 是否被打开
%rowcount 行数
%notfound 是否有值
*/

set serveroutput on

declare
--光标
cursor cemp is select ename,sal from emp;
pename emp.ename%type;
psal   emp.sal%type;
begin
open cemp;
loop
--从集合中取值
fetch cemp into pename,psal;
--****
exit when cemp%notfound;

dbms_output.put_line(pename||'的薪水是'||psal);

end loop;
close cemp;
end;
/

========================


--系统例外

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

========================

--自定义例外： 查询50号部门的员工姓名

set serveroutput on

declare
cursor cemp is select ename from emp where deptno=50;
pename emp.ename%type;

--自定义例外
no_emp_found exception;
begin
open cemp;
--取一个员工
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



========================


--循环： 打印1~10

set serveroutput on

declare
pnum number := 1;
begin
loop
--退出 成立退出 不成立循环
exit when pnum > 10;

--隐式转换
dbms_output.put_line(pnum);

pnum := pnum + 1;

end loop;
end;
/



========================



/*
示例1：
统计每年入职的员工个数

可能的sql：
select to_char(hiredate,'yyyy') from emp;
*/


set serveroutput on
/
declare
cursor cemp is SELECT to_char(hiredate,'yyyy') FROM emp;
phiredate VARCHAR2(4);

--计数器
count80 NUMBER:=0;
count81 NUMBER:=0;
count82 NUMBER:=0;
count87 NUMBER:=0;

BEGIN
open cemp;
loop
--取一个员工
fetch cemp into phiredate;
exit when cemp%notfound;

--判断
if phiredate = '1980' THEN count80:= count80+1;
elsif phiredate = '1981' THEN count81:= count81+1;
elsif phiredate = '1982' THEN count82:= count82+1;
else count87:= count87+1;
end if;

end loop;
CLOSE cemp;

--输出
dbms_output.put_line('total:'||(count80+count81+count82+count87));
dbms_output.put_line('1980:'||count80);
dbms_output.put_line('1981:'||count81);
dbms_output.put_line('1982:'||count82);
dbms_output.put_line('1987:'||count87);
end;
/

========================

/*
实例2：
为员工涨工资。从最低工资调起每人涨10%，但工资总额不能超过50,000
请计算涨工资的人数和涨工资后的工资总额，并输出涨工资人数和工资总额


分析：
员工：
select empno,sal
from emp
order by sal;

if(count(sal)<50000)
  then

涨工资的人数和涨工资后的工资总额
countemp
1.对sal进行累加:新的工资总额=旧的工资+sal*0.1;
  四则运算，比查询db更有效率

2.sum(sal):查询数据库
*/

set serveroutput on
declare
--员工
cursor cemp is SELECT empno,sal FROM emp order by sal;
pempno emp.empno% TYPE;
psal emp.sal% TYPE;

--长工资的人数
countEmp NUMBER:=0;
--工资总额
salTotal number;

begin

--涨前工资总额
select sum(sal) into salTotal from emp;

open cemp;
loop
--退出条件
--工资总额>50,000
exit when salTotal>50000;
--取一个员工
FETCH cemp INTO pempno,psal;
exit when cemp%notfound;

--涨工资
update emp set sal=sal*1.1 where empno=pempno;
--人数
countEmp:=countEmp+1;
--工资总额
salTotal:=salTotal+psal*0.1;

end loop;
CLOSE cemp;

COMMIT;

--输出
dbms_output.put_line('涨工资的人数：'||countEmp);
dbms_output.put_line('工资总额：'||salTotal);

end;
/


===============

--存储过程

/*
	--存储过程
		create [or replace] PROCEDURE 过程名(参数列表)
		AS
			PLSQL子程序体;

调用存储过程：
1.exec(execute) sayHelloWorld();
  --独立调用

2.begin
    sayHelloWorld();
    sayHelloWorld();
  end;
  /
  --在另外的plsql中调用



*/

create or REPLACE PROCEDURE sayHelloWorld
as
--相当于declare
begin
dbms_output.put_line('Hello world');
end;
/



=================

--带参数的存储过程

/*

给指定的员工涨100的工资，并打印涨前和涨后的薪水


	--存储过程
		create [or replace] PROCEDURE 过程名(参数列表)
		AS
			PLSQL子程序体;


带参数的存储过程

不要在过程中commit和rollback
在调用过程后可以实现commit和rollback

*/

create or REPLACE PROCEDURE raiseSalary(eno in NUMBER)
as
--变量
psal emp.sal% TYPE;

begin

--得到涨前薪水
select sal into psal from emp where empno= eno;

--涨工资
update emp set sal=sal+100 where empno= eno;

--问题：要不要commit??
--不要在存储过程中,commit or rollback

--打印
dbms_output.put_line('涨前：'||psal||',涨后'||(psal+100));
end;
/



========================

--out参数

/*
查询某个员工的姓名 月薪 职位



*/

create or REPLACE PROCEDURE queryEmpInfo(eno in NUMBER,
pename out varchar2,
psal   out NUMBER,
pjob   out VARCHAR2)
as
begin
select ename,sal,empjob INTO pename,psal, pjob FROM emp WHERE empno=eno;

end;
/

========================

--out参数中使用光标

/*
out参数中使用光标

根据员工的员工号查询员工信息，要求返回员工所有信息

使用光标作为out参数
1.创建一个包：mypackage
2.在该报中定义一个自定义类型：empcursor 类型为游标
            一个存储过程： queryemp


====================

查询某个部门中所有员工的所有信息

--包头
CREATE OR REPLACE
PACKAGE MYPACKAGE AS

  type empcursor is ref cursor;
  procedure queryEmpList(dno in number,empList out empcursor);
--用empList out empcursor  来代替 多个out
END MYPACKAGE;
==============================================

--包体
CREATE OR REPLACE
PACKAGE BODY MYPACKAGE AS

  procedure queryEmpList(dno in number,empList out empcursor) AS
  BEGIN

      open empList for select * from emp where deptno=dno;

  END queryEmpList;

END MYPACKAGE;


*/

--声明包结构
CREATE OR REPLACE PACKAGE mypackage
as
type empcursor is REF CURSOR;
procedure queryemp(eid in NUMBER, empinfo out empcursor)
end mypackage;

--创建包体

create or REPLACE
PACKAGE BODY mypackage as

PROCEDURE queryemp (eid in NUMBER, empinfo out empcursor)
as
BEGIN
open empinfo for select * from emp where empno= eid;
--empinfo 把光标当作集合
end queryemp;

END mypackage;