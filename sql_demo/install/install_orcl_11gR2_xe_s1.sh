#!/bin/bash

echo 'Install Oracle 11g XE ...'

# Def
PWD_USER='password'

# yum
## depes
yum install -y binutils.x86_64 compat-libcap1.x86_64 libstdc++.i686 libstdc++.x86_64 gcc.x86_64 gcc-c++.x86_64 glibc.i686 glibc.x86_64 glibc-devel.i686 glibc-devel.x86_64 ksh libaio.i686 libaio.x86_64 libaio-devel.i686 libaio-devel.x86_64 libgcc.i686 libgcc.x86_64 libXi.i686 libXi.x86_64 libXtst.i686 libXtst.x86_64 make.x86_64 sysstat.x86_64 elfutils-libelf-devel.x86_64

## odbc
yum install -y unixODBC.i686 unixODBC.x86_64 unixODBC-devel.i686 unixODBC-devel.x86_64

## compat-libstdc++
yum install -y compat-libstdc++-33-3.2.3-72.el7.i686.rpm compat-libstdc++-33-3.2.3-72.el7.x86_64.rpm


# sysctl
echo -e "
fs.aio-max-nr = 1048576
fs.file-max = 6815744
kernel.shmall = 2097152
kernel.shmmax = 956753920
kernel.shmmni = 4096
kernel.sem = 250 32000 100 128
net.ipv4.ip_local_port_range = 9000 65500
net.core.rmem_default = 262144
net.core.rmem_max = 4194304
net.core.wmem_default = 262144
net.core.wmem_max = 1048576
" >> /etc/sysctl.conf

# create user: oracle
useradd oracle
echo ${PWD_USER} | passwd --stdin oracle

echo -e '
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_SID=XE
export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/usr/lib:/lib:/usr/local/lib
export PATH=$ORACLE_HOME/bin:$PATH
' >> /home/oracle/.bash_profile

# reboot
reboot