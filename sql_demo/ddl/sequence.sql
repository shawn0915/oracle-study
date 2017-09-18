/*
sequence
 */

create sequence seq_myadmin_id;

create sequence seq_order start with 10;

alter sequence seq_order cache 1000;

drop sequence seq_order;