/*
显示可以动态重设大小的SGA组件的当前、最大和最小的容量
此示例显示的实例不包含流，因此流池大小为零
 */
SELECT COMPONENT,CURRENT_SIZE,MIN_SIZE,MAX_SIZE FROM v$sga_dynamic_components;

shared pool	205520896	176160768	205520896
large pool	4194304	4194304	4194304
java pool	4194304	4194304	4194304
streams pool	0	0	0
DEFAULT buffer cache	415236096	415236096	444596224
KEEP buffer cache	0	0	0
RECYCLE buffer cache	0	0	0
DEFAULT 2K buffer cache	0	0	0
DEFAULT 4K buffer cache	0	0	0
DEFAULT 8K buffer cache	0	0	0
DEFAULT 16K buffer cache	0	0	0
DEFAULT 32K buffer cache	0	0	0
Shared IO Pool	0	0	0
ASM Buffer Cache	0	0	0


/*
查看 sga 大小信息
 */
system@XE> show parameter sga;

NAME				     TYPE	 VALUE
------------------------------------ ----------- ------------------------------
lock_sga			     boolean	 FALSE
pre_page_sga			     boolean	 FALSE
sga_max_size			     big integer 1G
sga_target			     big integer 0