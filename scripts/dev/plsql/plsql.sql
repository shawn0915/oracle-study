-- ## PLSQL

-- 开启输出服务
set serveroutput on;

begin
for i in reverse 1..25   -- reverse关键字，可以逆序
loop
dbms_output.put_line(i);
end loop;
end;
/

-- hello world
declare
begin
dbms_output.put_line('Hello');
end;
/








-- 引用型变量：查询并打印7839的姓名和薪水
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





例如，我们之前创建表之前的判断动作中，可能需要删除已存在的表：


declare tbl_cnt number(1);   -- 判断表是否存在
begin
select count(*) into tbl_cnt from user_tables
where table_name ='STUINFO';

if tbl_cnt>0 then  -- 如果存在，执行下面删除语句
execute immediate 'drop table STUINFO';
dbms_output.put_line('已删除');
else
dbms_output.put_line('不存在');
end If;
end;












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

-- TODO

/*
触发器是当特定事件出现时自动执行的存储过程
特定事件可以是执行更新的DML语句和DDL语句
触发器不能被显式调用
触发器的功能：
自动生成数据
自定义复杂的安全权限
提供审计和日志记录
启用复杂的业务逻辑
语法:
CREATE [OR REPLACE] TRIGGER trigger_name
AFTER | BEFORE | INSTEAD OF
[INSERT] [[OR] UPDATE [OF column_list]]
[[OR] DELETE]
ON table_or_view_name
[REFERENCING {OLD [AS] old / NEW [AS] new}]
[FOR EACH ROW]
[WHEN (condition)]

*/

create table dept(
  deptno number primary key,
  dname varchar2(20),
  dnum  number -- 部门编制
)
  /
create table emp(
  empno number primary key,
  ename varchar2(20),
  deptno number
)
  /

insert into dept (deptno,dname,dnum) values(1,'test',1);
insert into dept (deptno,dname,dnum) values(2,'test2',2);

insert into emp (empno,ename,deptno) values(1,'zhangsan',1);
insert into emp (empno,ename,deptno) values(2,'lisi',2);
insert into emp (empno,ename,deptno) values(3,'wangwu',2);

-- 利用触发器维护部门编制
/*
  :new代表新记录
  :old代表旧记录
*/

create or replace trigger  tri_emp
after insert or  delete or update
on emp
for each row
begin
if inserting then
update dept set dnum=dnum+1 where deptno=:new.deptno;
elsif deleting then
update dept set dnum=dnum-1 where deptno=:old.deptno;
elsif updating then
update dept set dnum=dnum-1 where deptno=:old.deptno;
update dept set dnum=dnum+1 where deptno=:new.deptno;
end if;
end;

update emp set deptno=1 where empno=3
delete from emp where empno=3
select * from dept;


declare
v_ename varchar2(20) default 'SCOTT';
v_empno constant number:=7499;
begin
/*
v_ename:='SMITH';
*/
v_empno:=7897;
select ename into v_ename from emp where empno=v_empno;
dbms_output.put_line(v_ename||' say:Hello PL/SQL!');
end;


declare
v_counter number;
v_table_name varchar(20):='T';
begin
select count(*) into v_counter  from user_tables where table_name=v_table_name;
if v_counter>0 then
dbms_output.put_line('您要创建的表【'||v_table_name||'】已经存在,执行删除。');
execute immediate 'drop table '||v_table_name;
else
dbms_output.put_line('表不存在，可以创建。');
end if;
end;
/
create table t(tid int);



--3/.  定义变量，使用%rowtype输出7934雇员的姓名，岗位，薪水和奖金。使用nvl函数处理奖金字段，如果值为空，则输出0.
--nvl(sal,comm);
declare
v_empno emp.empno%type:=7934;
v_emp emp%rowtype;
begin
select * into v_emp from emp where empno=v_empno;
if v_emp.comm!=null then
dbms_output.put_line(v_empno||'雇员的姓名： '||v_emp.ename||',岗位是：'||v_emp.job||'薪水是：'||nvl(v_emp.comm,v_emp.sal));
else
dbms_output.put_line(v_empno||'雇员的姓名： '||v_emp.ename||',岗位是：'||v_emp.job||'薪水是：'||v_emp.sal||' 奖金是：0');
end if;
end;
--5、	定义emp.empno类型的变量，使用选择器接收用户输入的雇员编号，然后查询雇员的名字和职务，对应的主管姓名，所在部门名称，并输出。
declare
v_empno   emp.empno%type:='&empno';
v_emp     emp%rowtype;
begin
select ename,job from emp
                      end;

--6、	使用if-then-else结构，判断7934员工的薪资，如果小于2000，则给该员工加薪20%；如果薪资大于2000但小于2500，则加薪10%；如果大于2500则输出“不提高补助金”。
declare
v_empno   emp.empno%type:='7934';
v_sal     emp.sal%type;
begin
select sal into v_sal from emp where empno=v_empno;
--dbms_output.put_line(v_sal);
if v_sal<2000 then
update emp set sal=v_sal+0.2*v_sal where empno=v_empno;
elsif v_sal<2500 then
update emp set sal=v_sal+0.1*v_sal where empno=v_empno;
else
dbms_output.put_line('不提高补助金');
end if;
end;

--7、	使用选择器接收用户输入的员工编号，使用CASE语句判断员工所在部门名称：
--ACCOUNTING 输出“财务部”；SALES输出“销售部”；OPERATIONS输出“项目部”；RESEARCH输出“开发部”；如果不在以上，则输出“没有这样的部门”。

declare
v_empno emp.empno%type:='&empno';
v_emp emp%rowtype;
begin
select * into v_emp from emp where empno=v_empno;
case
when v_emp.job='CLERK' then
dbms_output.put_line('文员');
when v_emp.job='SALESMAN' then
dbms_output.put_line('销售');
when v_emp.job='ANALYST' then
dbms_output.put_line('研发');
when v_emp.job='MANAGER' then
dbms_output.put_line('经理');
when v_emp.job='PRESIDENT' then
dbms_output.put_line('总裁');
else
dbms_output.put_line('没有找到');
end case;
end;


declare
v_empno emp.empno%type:='&empno';
v_deptno dept.deptno%type;
v_dname  dept.dname%type;
begin
select deptno into v_deptno from emp where empno=v_empno;
select dname into v_dname  from dept where deptno=v_deptno;
dbms_output.put_line(v_dname);
case
when v_dname='ACCOUNTING' then
dbms_output.put_line('财务部');
when v_dname='SALES' then
dbms_output.put_line('销售部');
when v_dname='OPERATIONS' then
dbms_output.put_line('项目部');
when v_dname='RESEARCH' then
dbms_output.put_line('研发部');
else
dbms_output.put_line('没有这样的部门');
end case;
end;