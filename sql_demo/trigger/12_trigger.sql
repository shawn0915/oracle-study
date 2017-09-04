-- ## 触发器 trigger


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

