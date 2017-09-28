# NSL


```bash
echo $NLS_LANG
$ORACLE_HOME/bin/nls_lang.sh

echo $NLS_DATE_FORMAT
```

```oracle
host echo $NLS_LANG
```

nls_sort 按名称排序 Locale Builder


确定数据库时区
```oracle
SELECT property_value from database_properties
WHERE property_name = 'DBTIMEZONE';


PROPERTY_VALUE
--------------------------------------------------------------------------------
00:00

已选择 1 行。
```

查看支持的所有时区
```oracle
select * from v$timezone_names;
```

修改字符集
```oracle
ALTER  SYSTEM character set ...
```


