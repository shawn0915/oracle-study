/*
resource manager
 */

/*
使用者组
 */
SELECT
  consumer_group,
  comments
FROM dba_rsrc_consumer_groups;

DSS_GROUP	Consumer group for DSS queries
DSS_CRITICAL_GROUP	Consumer group for critical DSS queries
AUTO_TASK_CONSUMER_GROUP	System maintenance task consumer group
ORA$AUTOTASK_URGENT_GROUP	Consumer group for urgent maintenance tasks
BATCH_GROUP	Consumer group for batch operations
ORA$DIAGNOSTICS	Consumer group for diagnostics
ORA$AUTOTASK_HEALTH_GROUP	Consumer group for health checks
ORA$AUTOTASK_SQL_GROUP	Consumer group for SQL tuning
ORA$AUTOTASK_SPACE_GROUP	Consumer group for space management advisors
ORA$AUTOTASK_STATS_GROUP	Consumer group for gathering optimizer statistics
ORA$AUTOTASK_MEDIUM_GROUP	Consumer group for medium-priority maintenance tasks
INTERACTIVE_GROUP	Consumer group for interactive, OLTP operations
OTHER_GROUPS	Consumer group for users not included in any consumer group with a directive in the currently active plan
DEFAULT_CONSUMER_GROUP	Consumer group for users not assigned to any consumer group
SYS_GROUP	Consumer group for system administrators
LOW_GROUP	Consumer group for low-priority sessions
ORA$APPQOS_0	Consumer group for Application QOS
ORA$APPQOS_1	Consumer group for Application QOS
ORA$APPQOS_2	Consumer group for Application QOS
ORA$APPQOS_3	Consumer group for Application QOS
ORA$APPQOS_4	Consumer group for Application QOS
ORA$APPQOS_5	Consumer group for Application QOS
ORA$APPQOS_6	Consumer group for Application QOS
ORA$APPQOS_7	Consumer group for Application QOS
ETL_GROUP	Consumer group for ETL


-- 连接时每个会话的初始使用者组集合
SELECT
  username,
  initial_rsrc_consumer_group
FROM dba_users
ORDER BY initial_rsrc_consumer_group DESC;

SYS	SYS_GROUP
SYSTEM	SYS_GROUP
HR	DEFAULT_CONSUMER_GROUP
SHAWN	DEFAULT_CONSUMER_GROUP
RMAN	DEFAULT_CONSUMER_GROUP
FLOWS_FILES	DEFAULT_CONSUMER_GROUP
APEX_040000	DEFAULT_CONSUMER_GROUP
XS$NULL	DEFAULT_CONSUMER_GROUP
OUTLN	DEFAULT_CONSUMER_GROUP
XDB	DEFAULT_CONSUMER_GROUP
CTXSYS	DEFAULT_CONSUMER_GROUP
MDSYS	DEFAULT_CONSUMER_GROUP
ANONYMOUS	DEFAULT_CONSUMER_GROUP
FBDAUSER	DEFAULT_CONSUMER_GROUP
APEX_PUBLIC_USER	DEFAULT_CONSUMER_GROUP


/*
资源管理器计划
 */
SELECT *
FROM dba_rsrc_plan_directives
WHERE plan = 'DEFAULT_PLAN';

SELECT *
FROM dba_rsrc_plan_directives
WHERE plan = 'ORA$AUTOTASK_SUB_PLAN';

/*
资源管理器配置工具
 */
system@XE> desc dbms_resource_manager_privs;
PROCEDURE GRANT_SWITCH_CONSUMER_GROUP
参数名称                       类型                    输入/输出默认值?
------------------------------ ----------------------- ------ --------
GRANTEE_NAME			VARCHAR2		IN
CONSUMER_GROUP 		VARCHAR2		IN
GRANT_OPTION			BOOLEAN 		IN
PROCEDURE GRANT_SYSTEM_PRIVILEGE
参数名称                       类型                    输入/输出默认值?
------------------------------ ----------------------- ------ --------
GRANTEE_NAME			VARCHAR2		IN
PRIVILEGE_NAME 		VARCHAR2		IN     DEFAULT
ADMIN_OPTION			BOOLEAN 		IN
PROCEDURE REVOKE_SWITCH_CONSUMER_GROUP
参数名称                       类型                    输入/输出默认值?
------------------------------ ----------------------- ------ --------
REVOKEE_NAME			VARCHAR2		IN
CONSUMER_GROUP 		VARCHAR2		IN
PROCEDURE REVOKE_SYSTEM_PRIVILEGE
参数名称                       类型                    输入/输出默认值?
------------------------------ ----------------------- ------ --------
REVOKEE_NAME			VARCHAR2		IN
PRIVILEGE_NAME 		VARCHAR2		IN     DEFAULT



system@XE> desc dbms_resource_manager;
PROCEDURE BEGIN_SQL_BLOCK
PROCEDURE CALIBRATE_IO
参数名称                       类型                    输入/输出默认值?
------------------------------ ----------------------- ------ --------
NUM_PHYSICAL_DISKS		BINARY_INTEGER		IN     DEFAULT
MAX_LATENCY			BINARY_INTEGER		IN     DEFAULT
MAX_IOPS			BINARY_INTEGER		OUT
MAX_MBPS			BINARY_INTEGER		OUT
ACTUAL_LATENCY 		BINARY_INTEGER		OUT
PROCEDURE CLEAR_PENDING_AREA
PROCEDURE CREATE_CATEGORY


sys@XE> select * from dba_registry;
