CREATE TABLESPACE T_SHAWN
  logging
datafile  '/u01/app/oracle/oradata/XE/T_SHAWN.dbf'
  size 200m
  autoextend on
next 200m maxsize 2048m
  extent management local
;


-- DROP TABLESPACE T_SHAWN INCLUDING CONTENTS AND DATAFILES;


CREATE USER SHAWN
  IDENTIFIED BY "SHAWN"
DEFAULT TABLESPACE T_SHAWN
-- QUOTA 50M ON USERS
TEMPORARY TABLESPACE TEMP
-- 口令过期，登录后立即更改口令
-- password expire
-- 账户锁定
-- account lock
;

GRANT CONNECT TO SHAWN;
-- RESOURCE: 表、序列、过程（procedure）、触发器（trigger）、索引（index）等
GRANT RESOURCE TO SHAWN;
GRANT CREATE SEQUENCE TO SHAWN;
GRANT CREATE VIEW TO SHAWN;
-- GRANT CREATE SESSION TO SHAWN;
-- GRANT CREATE TABLE TO SHAWN;
-- GRANT CREATE PROCEDURE TO SHAWN;
/*
DBADBA role拥有所有的系统权限----包括无限制的空间限额和给其他用户授予各种权限的能力。用户SYSTEM拥有DBA角色。
EXP_FULL_DATABASE主要用于数据库的逻辑备份工具export。
IMP_FULL_DATABASE主要用于数据库的逻辑备份工具import。

*/


-- 删除用户
-- DROP USER SHAWN CASCADE;

