# Database Resource Manager

资源管理器

[SQL-DEMO-RESOURCE](../../sql_demo/mgmt/resource/resource.sql)

## 资源管理器体系结构

- 使用者组

`dba_rsrc_consumer_groups`

所有会话都必须有一个活动的使用者组，默认为`DEFAULT_CONSUMER_GROUP`。
每个计划都必须有一个针对使用者组`OTHER_GROUPS`的指令。

- 资源管理器计划

`dba_rsrc_plan_directives`

`ORA$AUTOTASK_SUB_PLAN`在视为紧急的、高或中等重要性的任务之间分配优先级。

实例参数`RESOURCE_LIMITS`和资源管理器没有关系，它与通过数据库配置文件控制资源的旧方法有关。

- 资源管理器配置工具

```oracle
dbms_resource_manager_privs
dbms_resource_manager
```

`ADMINISTER RESOURCE MANAGER`系统权限只能使用`dbms_resource_manager_privs`包授予和取消，而不能使用常规的GRANT命令和REVOKE命令。

`dbms_resource_manager_privs`包中包含有将某人置于某个使用者组的过程，但是更改用户的激活使用者组的过程在`DBMS_SESSION`和`dbms_resource_manager`包中。


> 创建资源管理器

1. 创建挂起区域
2. 创建使用者组
3. 将用户分配到使用者组
4. 创建指令
5. 创建计划
6. 验证挂起区域
7. 提交挂起区域

