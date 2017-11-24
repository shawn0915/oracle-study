-- ## 触发器 trigger


-- 查看当前用户创建的所有触发器：
select * from user_triggers;

-- 查看当前用户在指定表中创建的触发器：
select * from user_triggers where table_name='emp';


-- 临时禁用触发器：
alter trigger tri_name disable;
-- 启用触发器：
alter trigger tri_name enable;
-- 启用、禁用特定表上所有的触发器：
alter table tab_name [enable | disable]  all triggers;
-- 删除触发器：
drop trigger tri_name;

/*
插入一条记录后，自动打印“成功插入一个员工”


*/

create or replace trigger firstTrigger
after insert
on emp
begin
dbms_output.put_line("成功插入一个员工");
end;
/

======================


-- 触发器的语法

/*
触发器的语法

CREATE [OR REPLACE] TRIGGER
{BEFORE|AFTER}
{DELETE|INSERT|UPDATE[OF列名]}
ON 表名
[FRO EACH ROW[WHEN(条件)]]
PLSQL块

*/


================

/*
确认数据（涨后的工资不能少于涨前的薪水）

--行级触发器
*/
create or REPLACE trigger checksal
before update
  on emp
for each row
begin

--触发语句 :old   :new 代表一行
--if 涨后的<涨前的薪水 then
if :new.sal < :old.sal THEN
raise_application_error(-20001,'涨后的薪水不能少于涨前的薪水'||'涨前的薪水：'||:new.sal||'涨后的薪水：'||:old.sal);
end if;
end;
/


======================



/*
实施复杂的安全性检查

限制非工作时间向数据库插入数据：

周末：
sysdate
select to_char(sysdate,'day') from dual;

in ('星期六','星期日')

上班前,下班后
'hh24'
to_number(to_char('hh24')) not between 9 and 18

--语句级触发器
*/

create or REPLACE trigger securityEmy
before insert
on emp
begin

if to_char(sysdate,'day') in  ('星期六','星期日','星期二') or
to_number(to_char('hh24')) not between 9 and 18 then
RAISE_application_error(-20002,'不能在非工作时间插入数据');


end if;

end;
/



create or replace trigger tri_dml
before
delete or insert or update of sal
on emp
for each row
begin
if inserting then
dbms_output.put_line('新增员工：编号'||:New.empno||',姓名'||:New.ename);
elsif updating then
dbms_output.put_line('加薪了！姓名'||:Old.ename||'原薪资'||:Old.sal||'，修改为'||:New.sal);
elsif deleting then
if :Old.empno=7839 then
-- dbms_output.put_line('KING信息无法修改！');
-- rollback;
RAISE_APPLICATION_ERROR(-20010,'KING信息无法修改！');
end if;
dbms_output.put_line('删除员工：编号'||:Old.empno||',姓名'||:Old.ename);
end if;
end;


create or replace view vie_empinfo
as
  select  e.empno,e.ename,e.sal,d.dname,d.loc
  from emp  e,dept d
  where e.deptno=d.deptno;



create or replace trigger tri_viw_empinf
instead of
delete
  on vie_empinfo
for each row
begin
dbms_output.put_line('不允许进行删除操作！');
end;


create or replace trigger tri_viw_empinf
instead of
update
  on vie_empinfo
for each row
begin
-- dbms_output.put_line('不允许进行删除操作！');
update emp set sal=:New.sal where empno=:Old.empno;
update dept set loc=:New.loc where deptno=
                                   (select deptno from emp where empno=:Old.empno);
end;



/*
创建行级触发器，当修改了emp表的sal或comm列并且薪资进行了调整之后：
如果sal薪资增长了，就提示“yyyy年mm月dd日 HH:mi:ss **涨工资了，加薪**”；
如果sal薪资降低了，就提示“yyyy年mm月dd日 HH:mi:ss ***被扣工资了，扣除了**”；
如果comm奖金增长了，就提示“yyyy年mm月dd日 HH:mi:ss **发奖金了，金额**”；
如果comm奖金降低了，就提示“yyyy年mm月dd日 HH:mi:ss ***被扣奖金了，扣除了**”。

*/

create or replace trigger tri_sal_comm
after
update of sal,comm
on emp
for each row
begin
if nvl(:old.sal,0)<:new.sal
then
dbms_output.put_line(to_char(sysdate,'yyyy"年"mm"月"dd"日" HH:mi:ss')||:old.ename||'加薪'||(:new.sal-nvl(:old.sal,0)));
elsif nvl(:old.sal,0)>:new.sal then
dbms_output.put_line(to_char(sysdate,'yyyy"年"mm"月"dd"日" HH:mi:ss')||:old.ename||'扣除了'||(:new.sal-nvl(:old.sal,0)));
end if;
if nvl(:old.comm,0)>:new.comm
then
dbms_output.put_line(to_char(sysdate,'yyyy"年"mm"月"dd"日" HH:mi:ss')||:old.ename||'奖金扣除了'||(:new.comm-nvl(:old.comm,0)));
elsif nvl(:old.comm,0)<:new.comm then
dbms_output.put_line(to_char(sysdate,'yyyy"年"mm"月"dd"日" HH:mi:ss')||:old.ename||'奖金加了'||(:new.comm-nvl(:old.comm,0)));
end if;
end;

-- 编写一个触发器sal_chk，在插入员工信息时对工资进行有效性检测，如果是在RESEARCH部门，则工资最少为2000，如果小于2000，自动修正为2000。
create view emp_sal
as
  select * from emp;

create or replace trigger sal_chk
before
insert
on emp
for each row
declare
dno dept.deptno%type;
begin
select deptno into dno from dept where dname='RESEARCH';
if :new.deptno=dno and :new.sal<2000
then
:new.sal:=2000;
end if;
end;