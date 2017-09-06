
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


CREATE TABLE Users
(
  UserId     INTEGER PRIMARY KEY NOT NULL,
  UserName   VARCHAR(10)         NOT NULL,
  Pwd        VARCHAR(20)         NOT NULL,
  Email      CHAR(16),
  UserRoleId INTEGER             NOT NULL
);
insert into Users(Userid,Username,Pwd,Email,Userroleid)
  select  2,'b','aa','aa@bb.com',002 from dual union
  select  3,'c','bb','ss@aa.com',003 from dual union
  select  4,'d','cc','az@cc.com',004 from dual union
  select  1,'a','as','as@163.com',005 from dual union
  select  5,'s','as','sd@126.com',006 from dual ;