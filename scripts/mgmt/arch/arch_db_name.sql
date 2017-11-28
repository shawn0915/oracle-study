
-- 数据库全局名称
/*
全局数据库名（ GLOBAL_DB_NAME ）
DB_NAME.Domain_NAME：由"数据库名称"与"网域名称"所组成，其中「数据库名称」设定于 DB_NAME 参数，
而「网域名称」则是设定于 DB_DOMAIN 参数。主要用在分布式环境下将相同域的数据库组织在一起。
*/
-- 数据库名 DB_NAME
system@XE> select name from v$database;

NAME
---------
XE

已选择 1 行。

system@XE> show parameter db_name;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
db_name 			     string	 XE
system@XE>

-- 数据库域名 db_domain
system@XE> select value from v$parameter where name = 'db_domain';

VALUE
--------------------------------------------------------------------------------


已选择 1 行。

system@XE> show parameter domain;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
db_domain			     string
system@XE>

-- 数据库实例名 instance_name
system@XE> select value from v$parameter where name = 'instance_name';

VALUE
--------------------------------------------------------------------------------
XE

已选择 1 行。
system@XE> show parameter instance_name;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
instance_name			     string	 XE
system@XE>

-- 数据库服务名 service_names
system@XE> select value from v$parameter where name = 'service_names';

VALUE
--------------------------------------------------------------------------------
XE

已选择 1 行。

system@XE> show parameter service_names;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
service_names			     string	 XE
system@XE>

