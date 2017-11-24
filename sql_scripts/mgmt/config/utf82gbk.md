近日有同事在外面部署系统时，安装数据库时可能选择了UTF-8编码格式，
导入insert语句时，一个汉字被认为三个字节，这是不行的。

字符集 utf8 => gbk

结合上网搜到的资料，将oracle数据库的编码格式，从utf-8改为GBK后，一切正常了。

附：PLSQL执行记录：

---------------------------

Microsoft Windows [版本 6.0.6002]
版权所有 (C) 2006 Microsoft Corporation。保留所有权利。

C:\Users\Administrator>sqlplus /nolog

SQL*Plus: Release 11.2.0.1.0 Production on 星期一 9月 3 11:39:04 2012

Copyright (c) 1982, 2010, Oracle.  All rights reserved.

SQL> conn / as sysdba
已连接。
SQL> SHUTDOWN IMMEDIATE
数据库已经关闭。
已经卸载数据库。
ORACLE 例程已经关闭。
SQL>  startup mount;
ORACLE 例程已经启动。

Total System Global Area  778387456 bytes
Fixed Size                  1374808 bytes
Variable Size             377488808 bytes
Database Buffers          394264576 bytes
Redo Buffers                5259264 bytes
数据库装载完毕。
SQL> ALTER SYSTEM ENABLE RESTRICTED SESSION;

系统已更改。

SQL> ALTER SYSTEM SET JOB_QUEUE_PROCESSES=0;

系统已更改。

SQL> ALTER SYSTEM SET AQ_TM_PROCESSES=0;

系统已更改。

SQL> ALTER DATABASE OPEN;

数据库已更改。


SQL> alter database character set internal_use zhs16gbk;

数据库已更改。

SQL> shutdown immediate;
数据库已经关闭。
已经卸载数据库。
ORACLE 例程已经关闭。
SQL> startup
ORACLE 例程已经启动。

Total System Global Area  778387456 bytes
Fixed Size                  1374808 bytes
Variable Size             377488808 bytes
Database Buffers          394264576 bytes
Redo Buffers                5259264 bytes
数据库装载完毕。
数据库已经打开。
SQL>

---------------------------

查看编码格式：

```oracle
SELECT userenv('language')
FROM DUAL;

SELECT *
FROM nls_database_parameters;
```

