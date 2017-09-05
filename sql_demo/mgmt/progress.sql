-- 查看数据写入进程使用情况
system@XE> select paddr,name,description from v$bgprocess where name like '%DB%';

PADDR		 NAME
---------------- -----
DESCRIPTION
----------------------------------------------------------------
000000009F3AD228 DBRM
DataBase Resource Manager

000000009F3B03A8 DBW0
db writer process 0

000000009F3B1428 DBW1
db writer process 1


PADDR		 NAME
---------------- -----
DESCRIPTION
----------------------------------------------------------------
000000009F3B24A8 DBW2
db writer process 2

00		 DBW3
db writer process 3

00		 DBW4
db writer process 4
