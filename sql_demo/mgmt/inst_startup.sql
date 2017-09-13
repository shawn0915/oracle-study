# sql*plus

sqlplus /nolog
connect / as sysdba
startup;

STARTUP [NOMOUNT|MOUNT|OPEN|FORCE|RESTRICT] [PFILE='pfile_name'];

start force = shutdown abort + startup

-- 实例状态
select status from v$instance;

STATUS
------------
OPEN


# lsnrctl

lsnrctl status
lsnrctl start

# emctl

emctl status dbconsole
emctl start dbconsole

