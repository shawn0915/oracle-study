# Oracle Install

## Concepts

- [OUI, Oracle Universal Installer](#oui)
- DBCA, Database Configuration Assistant
- DBUA, Database Upgrade Assistant
- Oracle Enterprise Manager Database Control

## OUI

> 产品清单inventory

文件位置
```bash
# windows
HKEY_LOCAL_MACHINE\SOFTWARE\ORACLE\inst_loc
# linux
/etc/oraInst.loc
```

## 环境变量

```bash
export ORACLE_BASE=/u01/app/oracle
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/usr/lib:/lib:/usr/local/lib
export PATH=$ORACLE_HOME/bin:$PATH
# OUI
export DISPLAY=:0.0
```

## Oracle XE

- Install Oracle 11g R2 on RHEL 7.2
  - [Step1: install_orcl_11gR2_xe_s1.sh](../scripts/mgmt/install/install_orcl_11gR2_xe_s1.sh)
  - [Step2: install_orcl_11gR2_xe_s2.sh](../scripts/mgmt/install/install_orcl_11gR2_xe_s2.sh)

## Windows

- [Install](Install_win.md)
- [Uninstall](Uninstall_win.md)
