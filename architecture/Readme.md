# Oracle Database Architecture

- [内存结构](memory/Memory.md)
  - SGA
  - PGA
- [进程结构](Progress/Progress.md)
  - 用户进程
  - 服务器进程
  - Background Process, 后台进程
- [存储结构](Storage/Storage.md)
  - 物理结构
  - 逻辑结构

```oracle
Oracle服务器=Oralce数据库+Oracle实例
数据库=物理结构+逻辑结构
实例=后台进程+内存结构
```

要创建数据库，实例必须处于NOMOUNT模式

## Oracle 工作区域

用户/模式

在Oracle中，用户和模式同义

