-- DATA_PUMP_DIR => /u01/app/oracle/admin/XE/dpdump

expdp system/password@XE schemas=orclstaff dumpfile=expdp_0309.dmp DIRECTORY=DATA_PUMP_DIR;
impdp system/password@XE schemas=orclstaff dumpfile=expdp_0309.dmp DIRECTORY=DATA_PUMP_DIR;

exp user/pwd file=user.dmp buffer=1024000 log=user.log statistics=none indexes=y constraints=y grants=n rows=n

-- Ref:
-- http://www.toutiao.com/i6393659189897462274/?wxshare_count=2&pbid=23980300841