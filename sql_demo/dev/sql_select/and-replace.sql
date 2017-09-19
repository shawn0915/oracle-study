/*
&符号替换
 */

hr@XE> SELECT * from REGIONS
WHERE REGION_NAME = '&REG_NAME';  2
输入 reg_name 的值:  Asia
原值    2: WHERE REGION_NAME = '&REG_NAME'
新值    2: WHERE REGION_NAME = 'Asia'

REGION_ID REGION_NAME
---------- -------------------------
3 Asia

已选择 1 行。

hr@XE>

