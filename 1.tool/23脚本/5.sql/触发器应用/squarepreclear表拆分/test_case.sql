DECLARE
BEGIN
sp_add_triggers_ex('SQUAREPRECLEAR');
END;
/

hs_sett.trsquarepreclear
select count(1) /*into v_cnt*/ from user_tables where table_name = 'E'||'SQUAREPRECLEAR';
SELECT a.*,rowid from hs_sett.squarepreclear a;
--UPDATE hs_sett.squarepreclear a SET a.serial_no='4' WHERE a.;
SELECT a.*,rowid from hs_sett.esquarepreclear a;

SELECT a.*,rowid from hs_sett.hztmp a ;
INSERT into hztmp VALUES(1);
SELECT a.*,rowid from hztmp a;


UPDATE ESQUAREPRECLEAR set CURR_TIME = newrow.CURR_TIME where SERIAL_NO = :old.SERIAL_NO AND INIT_DATE = :old.INIT_DATE;
UPDATE ESQUAREPRECLEAR set SERIAL_NO = newrow.SERIAL_NO where SERIAL_NO = :old.SERIAL_NO AND INIT_DATE = :old.INIT_DATE
            delete ESQUAREPRECLEAR                      where SERIAL_NO = :old.SERIAL_NO AND INIT_DATE = :old.INIT_DATE;
/*
ORA-01008: 并非所有变量都已绑定
ORA-06512: 在 "HS_SETT.TRSQUAREPRECLEAR", line 456
ORA-04088: 触发器 'HS_SETT.TRSQUAREPRECLEAR' 执行过程中出错

View program sources of error stack?
*/
/*

ORA-00904: "NEWROW"."SERIAL_NO": 标识符无效
ORA-06512: 在 "HS_SETT.TRSQUAREPRECLEAR", line 459
ORA-04088: 触发器 'HS_SETT.TRSQUAREPRECLEAR' 执行过程中出错

View program sources of error stack?
*/
