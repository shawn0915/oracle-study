/*
数据泵导出导入
 */

-- DATA_PUMP_DIR => /u01/app/oracle/admin/XE/dpdump

expdp system/password@XE schemas=orclstaff dumpfile=expdp_0309.dmp DIRECTORY=DATA_PUMP_DIR;
impdp system/password@XE schemas=orclstaff dumpfile=expdp_0309.dmp DIRECTORY=DATA_PUMP_DIR;
