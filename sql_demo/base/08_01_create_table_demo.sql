
/*
create table
create sequence
create trigger
*/

CREATE TABLE myadmin
(
  id NUMBER PRIMARY KEY NOT NULL ,
  name VARCHAR2(50) NOT NULL ,
  pwd VARCHAR2(50) NOT NULL ,
  info VARCHAR2(200)
)
/

create sequence seq_myadmin_id
/


CREATE OR REPLACE trigger tri_myadmin_id
before INSERT
on myadmin
for each row
  BEGIN
   SELECT seq_myadmin_id.nextval into :NEW.id FROM dual;
  end;
/


INSERT into myadmin(name,pwd,info) values('admin','abc','超级管理员');
insert into myadmin(name,pwd) values('jay','abc');

insert into myadmin(name,pwd,info) values('a','abc','普通用户');
insert into myadmin(name,pwd,info) values('b','abc','普通用户');
insert into myadmin(name,pwd,info) values('c','abc','普通用户');
insert into myadmin(name,pwd,info) values('d','abc','普通用户');
insert into myadmin(name,pwd,info) values('e','abc','普通用户');
insert into myadmin(name,pwd,info) values('f','abc','普通用户');
insert into myadmin(name,pwd,info) values('g','abc','普通用户');