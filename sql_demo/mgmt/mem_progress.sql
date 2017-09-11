-- 查看数据写入进程使用情况
system@XE> select paddr,name,description from v$bgprocess where name like '%DB%';

'000000009FF50BB8'	DBRM	DataBase Resource Manager
'000000009FF53D38'	DBW0	db writer process 0
'00'	DBW1	db writer process 1
'00'	DBW2	db writer process 2
'00'	DBW3	db writer process 3
'00'	DBW4	db writer process 4
'00'	DBW5	db writer process 5
'00'	DBW6	db writer process 6
'00'	DBW7	db writer process 7
'00'	DBW8	db writer process 8
'00'	DBW9	db writer process 9
'00'	DBWa	db writer process 10 (a)
'00'	DBWb	db writer process 11 (b)
'00'	DBWc	db writer process 12 (c)
'00'	DBWd	db writer process 13 (d)
'00'	DBWe	db writer process 14 (e)
'00'	DBWf	db writer process 15 (f)
'00'	DBWg	db writer process 16 (g)
'00'	DBWh	db writer process 17 (h)
'00'	DBWi	db writer process 18 (i)
'00'	DBWj	db writer process 19 (j)
'00'	DBWk	db writer process 20 (k)
'00'	DBWl	db writer process 21 (l)
'00'	DBWm	db writer process 22 (m)
'00'	DBWn	db writer process 23 (n)
'00'	DBWo	db writer process 24 (o)
'00'	DBWp	db writer process 25 (p)
'00'	DBWq	db writer process 26 (q)
'00'	DBWr	db writer process 27 (r)
'00'	DBWs	db writer process 28 (s)
'00'	DBWt	db writer process 29 (t)
'00'	DBWu	db writer process 30 (u)
'00'	DBWv	db writer process 31 (v)
'00'	DBWw	db writer process 32 (s)
'00'	DBWx	db writer process 33 (t)
'00'	DBWy	db writer process 34 (u)
'00'	DBWz	db writer process 35 (v)
'00'	VDBG	Volume Driver BG

/*
查看进程
 */
select pname from v$process
where pname is not null
order by program;

CJQ0
CKPT
D000
DBRM
DBW0
DIA0
DIAG
GEN0
LGWR
MMAN
MMNL
MMON
PMON
PSP0
Q000
Q002
QMNC
RECO
S000
S001
S002
S003
SMCO
SMON
VKRM
VKTM
W000


/*
查看正在运行的进程，以及每个进程的数量
 */
SELECT program
FROM v$session
ORDER BY program;

JDBC Thin Client
SQL Developer
SQL Developer
oracle@localhost.localdomain (CJQ0)
oracle@localhost.localdomain (CKPT)
oracle@localhost.localdomain (DBRM)
oracle@localhost.localdomain (DBW0)
oracle@localhost.localdomain (DIA0)
oracle@localhost.localdomain (DIAG)
oracle@localhost.localdomain (GEN0)
oracle@localhost.localdomain (LGWR)
oracle@localhost.localdomain (MMAN)
oracle@localhost.localdomain (MMNL)
oracle@localhost.localdomain (MMON)
oracle@localhost.localdomain (PMON)
oracle@localhost.localdomain (PSP0)
oracle@localhost.localdomain (Q000)
oracle@localhost.localdomain (Q002)
oracle@localhost.localdomain (QMNC)
oracle@localhost.localdomain (RECO)
oracle@localhost.localdomain (SMCO)
oracle@localhost.localdomain (SMON)
oracle@localhost.localdomain (VKRM)
oracle@localhost.localdomain (VKTM)
oracle@localhost.localdomain (W000)
sqlplus@localhost.localdomain (TNS V1-V3)


SELECT program
FROM v$process
ORDER BY program;


PSEUDO
oracle@localhost.localdomain
oracle@localhost.localdomain
oracle@localhost.localdomain
oracle@localhost.localdomain (CJQ0)
oracle@localhost.localdomain (CKPT)
oracle@localhost.localdomain (D000)
oracle@localhost.localdomain (DBRM)
oracle@localhost.localdomain (DBW0)
oracle@localhost.localdomain (DIA0)
oracle@localhost.localdomain (DIAG)
oracle@localhost.localdomain (GEN0)
oracle@localhost.localdomain (LGWR)
oracle@localhost.localdomain (MMAN)
oracle@localhost.localdomain (MMNL)
oracle@localhost.localdomain (MMON)
oracle@localhost.localdomain (PMON)
oracle@localhost.localdomain (PSP0)
oracle@localhost.localdomain (Q000)
oracle@localhost.localdomain (Q002)
oracle@localhost.localdomain (QMNC)
oracle@localhost.localdomain (RECO)
oracle@localhost.localdomain (S000)
oracle@localhost.localdomain (S001)
oracle@localhost.localdomain (S002)
oracle@localhost.localdomain (S003)
oracle@localhost.localdomain (SMCO)
oracle@localhost.localdomain (SMON)
oracle@localhost.localdomain (TNS V1-V3)
oracle@localhost.localdomain (VKRM)
oracle@localhost.localdomain (VKTM)
oracle@localhost.localdomain (W000)


