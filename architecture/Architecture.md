# Oracle Database Architecture

- [内存结构](memory/Memory.md)
  - SGA
  - PGA
- [Progress](progress/Progress.md)
  - 用户进程
  - 服务器进程
  - Background Process, 后台进程
- [Storage](storage/Storage.md)
  - Physical
  - Logical

```oracle
Oracle服务器=Oralce数据库+Oracle实例
数据库=物理结构+逻辑结构
实例=后台进程+内存结构
```

要创建数据库，实例必须处于NOMOUNT模式

## Oracle 工作区域

用户/模式

在Oracle中，用户和模式同义

## Reference

- [one store](story.txt)