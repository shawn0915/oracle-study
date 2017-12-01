# Profile

概要文件包含一组约束条件和配置项，它们可以限制允许用户使用的资源。
在创建概要文件后，DBA可以手工将其赋予每个用户。
但并不能立刻生效，要将初始化参数文件中的参数`RESOURCE_LIMIT`设置为`TRUE`后，概要文件才会生效。

```oracle
CREATE PROFILE NEWProfile LIMIT
SESSIONS_PER_USER 	2
 CPU_PER_SESSION	10000
 CPU_PER_CALL		DEFAULT
```

将概要文件授予用户，使用如下命令：
```oracle
ALTER USER <用户名> PROFILE <概要文件>
```
