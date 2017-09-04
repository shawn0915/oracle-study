
> windows系统下彻底清除oracle

1.删除oracle注册表信息.运行regedit,删除注册表项
   HKEY_LOCAL_MACHINE\SOFTWARE\Oracle
2.删除oracle服务.oracle服务在注册表中的位置是:
   HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Service
  删除所有以oracle字符打头的服务.
3.删除事件日志.注册表中的位置是
HKEY_LOCAL_MACHINE\SYSTEM\CurrentContrilSet\Services\Eventlog\Application
  删除所有以oracle字符打头的键.
4.删除ORACLE环境变量,如"JSERV"变量和Path变量中的oracle路径
5.删除oracle菜单.
6.删除"program files\oracle"目录
7.重启WINDOWS.
8.删除oracle主目录.