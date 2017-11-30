# 单行函数

[SQL-DEMO-FUNCTION](../../../scripts/dev/function/function.sql)


## 类型

- [字符函数](#字符函数)
- [数字函数](#数字函数)
- [日期函数](#日期函数)
- [转换函数](#转换函数)
- [通用函数](#通用函数)

### 字符函数

```oracle
lower
upper
initcap
--
concat
--
length
lengthb
--
lpad
rpad
--
trim
--
instr
substr
--
replace
```

### 数字函数

```oracle
round
trunc -- truncate
mod -- modulus
```


### 日期函数

[SQL-DEMO-DATE-TIME](../../../scripts/dev/function/func_date_time.sql)

```oracle
ADD_MONTHS
MONTHS_BETWEEN
--
LAST_DAY
NEXT_DAY
--
SYSDATE -- DD-MON-RR
--
ROUND
TRUNC
```

others
```oracle
TZ_OFFSET
CURRENT_DATE
CURRENT_TIMESTAMP
LOCALTIMESTAMP
DBTIMEZONE
SESSIONTIMEZONE
EXTRACT
FROM_TZ
TO_TIMESTAMP
TO_TIMESTAMP_TZ
TO_YMINTERVAL
SYSTIMESTAMP
```


### 转换函数

```oracle
TO_DATE
TO_CHAR
TO_NUMBER
```

`TO_NUMBER`函数将字符项转换为数字。如果使用较短的格式掩码转换数字，就会返回错误。
如果使用较长的格式掩码转换数字，就会返回原数字。不要混淆`TO_NUMBER`转换和`TO_CHAR`转换。
例如，`TO_NUMBER(123.56，'999.9')`返回错误，而`TO_CHAR(123.56,'999.9')`返回123.6。

=> [数据类型转换](../../data_structures/Data_Types.md)



### 通用函数

- 单值通用函数

```oracle
NVL
NVL2
NULLIF
COALESCE
```

- 条件表达式

```oracle
DECODE
CASE
```


