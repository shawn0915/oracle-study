#!/bin/bash

echo 'Install Oracle 11g XE Step 2 ...'

# Def
PWD_ORACLE='password'

# Step 2
unzip oracle-xe-11.2.0-1.0.x86_64.rpm.zip

cd Disk1/
rpm -ivh oracle-xe-11.2.0-1.0.x86_64.rpm

if [ ! -e /usr/bin/expect ]
 then  yum install -y expect
fi
echo '#!/usr/bin/expect
set timeout 60
set password [lindex $argv 0]
spawn /etc/init.d/oracle-xe configure
expect {
"8080" { send "8081\r"; exp_continue}
"1521" { send "\r" ; exp_continue}
"user accounts" { send "$password\r"; exp_continue}
"y/n" { send "y\r"}
}
interact ' > orcl_cfg.exp
chmod u+x orcl_cfg.exp
./orcl_cfg.exp ${PWD_ORACLE}
