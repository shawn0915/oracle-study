# Data Type

- [字符数据类型](#character)
- [数字数据类型](#number)
- [日期数据类型](#date)
- [其他数据类型](#others)

[SQL-DEMO-DataType](../../scripts/dev/ddl/datatype.sql)

## Character

- `CHAR`
  - 1B->2KB
  - 如果数据不够列的长度，用空格进行填充
- **`VARCHAR2`**
  - min: 1B
  - max: 4KB, 4000字符, before 12c
  - max: 32KB, 12c
  - 数据库字符集
- `NCHAR`/`NVARCHAR2`
  - NLS, National Language Support, 国家语言字符集
    - 全球化


## Number

- **`NUMBER`**
  - default: `NUMBER(38, 0)`
  - 精度范围1~38，小数位数范围-84~127
  - NUMBER(10, -2), 小数点左边指定位置进行四舍五入
- `FLOAT`
- `INTEGER`
- `BINARY_FLOAT`
  - after 10g
- `BINARY_DOUBLE`
  - after 10g
- `SIMPLE_INTEGER`
  - after 11g


## DATE

- **`DATE`**
  - 长度为0或7个字节
  - format: DD-MON-YY HH:MI:SS
  - default: 0
  - NLS_DATE_FORMAT
  - 有效范围：公元前4712年1月1日至公元9999年12月31日
- `TIMESTAMP`(9i)
  - 长度为0或11字节
  - 与`date`数据类型相比，`timestamp`类型可以精确到微秒，微秒的精确范围为0-9，默认为6
- `TIMESTAMP WITH TIME ZONE` (TSTZ)
- `TIMESTAMP WITH LOCAL TIME ZONE` (TSLTZ)
- `INTERVAL YEAR TO MONTH`
- `INTERVAL DAY TO SECOND`

=> [日期类型**函数**](../function/Function.md)


## Others

- LOB
  - `CLOB`/`NCLOB`
    - max:4GB, before 10g
    - max:128TB, after 10g
  - `BLOB`
    - 和`CLOB`一样，但二进制数据不会被Oracle Net执行字符集转换
- `BFILE`
  - 定位器
  - max: 4GB
- `LONG`
  - max: 2GB
  - 功能由`CLOB`提供
  - 表中只能有一个`LONG`列
- `LONG RAW`
  - 所有`LONG RAW`都应该转换为`BLOB`
- `RAW`/`ROWID`
  - `RAW`可变长度的二进制数据，1B->4KB
  - `ROWID`以64为基数编码的值，Oracle专有的数据类型
- `ORA_ROWSCN`
- `XMLType`
  - 把XML文档以字符的形式存储在LOB列中
- 身份数据类型
  - 12c
  - DB2 to Oracle
- 用户自定数据
- AnyType/AnyData/AnyDataSet

> 数据类型转换

- 显式转换
```oracle
CHARACTER ==TO_DATE==> DATE ==TO_CHAR==> CHARACTER

CHARACTER ==TO_NUMBER==> NUMBER ==TO_CHAR==> CHARACTER
```

![显示转换](img/dataType_trans.png)

- 隐式转换
```oracle
VARCHAR2 or CHAR => NUMBER
VARCHAR2 or CHAR => DATE
```


