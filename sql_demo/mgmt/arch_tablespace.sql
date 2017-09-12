-- 查看表空间 tablespace
system@XE> select * from v$tablespace;

TS# NAME 			  INC BIG FLA ENC
---------- ------------------------------ --- --- --- ---
0 SYSTEM			  YES NO  YES
2 UNDOTBS1			  YES NO  YES
1 SYSAUX			  YES NO  YES
4 USERS			  YES NO  YES
3 TEMP 			  NO  NO  YES


system@XE> select * from dba_tablespaces;

TABLESPACE_NAME 	       BLOCK_SIZE INITIAL_EXTENT NEXT_EXTENT MIN_EXTENTS
------------------------------ ---------- -------------- ----------- -----------
MAX_EXTENTS   MAX_SIZE PCT_INCREASE MIN_EXTLEN STATUS	 CONTENTS  LOGGING   FOR
----------- ---------- ------------ ---------- --------- --------- --------- ---
EXTENT_MAN ALLOCATIO PLU SEGMEN DEF_TAB_ RETENTION   BIG PREDICA ENC
---------- --------- --- ------ -------- ----------- --- ------- ---
COMPRESS_FOR
------------
SYSTEM				     8192	   65536		       1
2147483645 2147483645			 65536 ONLINE	 PERMANENT LOGGING   NO
LOCAL	   SYSTEM    NO  MANUAL DISABLED NOT APPLY   NO  HOST	 NO

-- 区管理(LMT)(9i默认值)/表空间类型/联机状态
system@XE> SELECT
             tablespace_name,
             extent_management,
             contents,
             status
           FROM dba_tablespaces;

TABLESPACE_NAME 	       EXTENT_MAN CONTENTS STATUS
------------------------------ ---------- ---------
SYSTEM	LOCAL	PERMANENT	ONLINE
SYSAUX	LOCAL	PERMANENT	ONLINE
UNDOTBS1	LOCAL	UNDO	ONLINE
TEMP	LOCAL	TEMPORARY	ONLINE
USERS	LOCAL	PERMANENT	ONLINE
T_SHAWN	LOCAL	PERMANENT	ONLINE


/*
TEMPORARY: 临时表空间,用于临时数据的存放,默认所有用户都是用TEMP表空间。

UNDO : 还原表空间. 用于存入重做日志文件

PERMANENT: 永久表空间，最重要,也是用于存放用户数据表空间

*/

-- TODO: 已用的已分配空间百分比

-- 表空间脱机
ALTER TABLESPACE T_SHAWN OFFLINE;
-- 表空间联机
ALTER TABLESPACE T_SHAWN ONLINE;

-- 表空间只读
ALTER TABLESPACE T_SHAWN READ ONLY;
-- 表空间可读写
ALTER TABLESPACE T_SHAWN READ WRITE;

/*
为表空间增加临时文件
*/
ALTER TABLESPACE tmpfile add tempfile '/path/tmpfile.dbf' size 18M;
-- 修改大小
ALTER DATABASE tempfile '/path/tmpfile.dbf' resize 28M;


/*
确定表所在的表空间、区间大小、区间所在的文件编号，以及作为区间开始位置的文件块
 */
SELECT
  tablespace_name,
  extent_id,
  bytes,
  file_id,
  block_id,
  segment_name
FROM dba_extents
WHERE owner = 'SYSTEM' AND segment_name = 'HELP';

SYSTEM	0	65536	1	32016	HELP

/*
根据名称确定文件
 */
SELECT name from v$datafile
WHERE file#=&file_id;

/u01/app/oracle/oradata/XE/system.dbf

/*
精确计算出区间在文件中的位置（按它在文件中的开始字节数）

从文件的大约250M处开始
 */
SELECT block_size * &block_id FROM dba_tablespaces
where tablespace_name='&tablespace_name';

BLOCK_SIZE*32016
----------------
262275072

