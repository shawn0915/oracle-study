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

create table emp(
  empno number primary key,
  ename varchar2(20),
  deptno number
)
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
