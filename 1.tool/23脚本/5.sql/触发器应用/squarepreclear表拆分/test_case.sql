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
ORA-01008: �������б������Ѱ�
ORA-06512: �� "HS_SETT.TRSQUAREPRECLEAR", line 456
ORA-04088: ������ 'HS_SETT.TRSQUAREPRECLEAR' ִ�й����г���

View program sources of error stack?
*/
/*

ORA-00904: "NEWROW"."SERIAL_NO": ��ʶ����Ч
ORA-06512: �� "HS_SETT.TRSQUAREPRECLEAR", line 459
ORA-04088: ������ 'HS_SETT.TRSQUAREPRECLEAR' ִ�й����г���

View program sources of error stack?
*/
