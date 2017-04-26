
--用目标用户执行

-- Create table
DROP TABLE SEQUENCES_BACKUP;
create table SEQUENCES_BACKUP
(
  sequence_name VARCHAR2(30) not null,
  min_value     NUMBER,
  max_value     NUMBER,
  increment_by  NUMBER not null,
  cycle_flag    VARCHAR2(1),
  order_flag    VARCHAR2(1),
  cache_size    NUMBER not null,
  last_number   NUMBER not null
)
;
-- Create/Recreate primary, unique and foreign key constraints 
alter table SEQUENCES_BACKUP add constraint PK_SEQNAME_BAK primary key (SEQUENCE_NAME) using index ;


--日志表
DROP TABLE testlog;
create table testlog
(
  l_date     NUMBER(8) not null,
  l_time     NUMBER(6) not null,
  vc_message VARCHAR2(4000) not null
);
