DECLARE
BEGIN
sp_add_triggers_split('ESQUAREPRECLEAR');
END;
/

Select object_name From user_objects Where object_type='TRIGGER';  --���д�����
hs_sett.STTCHECKDATE

/*DROP TRIGGER BIN$QX5qdjxh9CbgUAB/AQAV5g==$0;*/
Select object_name From user_objects Where object_type='PROCEDURE';  --���д洢����
Select object_name From user_objects Where object_type='VIEW';  --������ͼ
Select object_name From user_objects Where object_type='TABLE'; --���б�


SELECT a.*,rowid from hs_sett.extable a;
SELECT a.*,rowid from hs_sett.splittableinfo a;
SELECT a.*,rowid from hs_sett.splittableinfo a;

--UPDATE hs_sett.splittableinfo a SET a.sourcename='E'||a.sourcename;

select max(a.tablename) as tablename from splittableinfo a where a.sourcename='ESQUAREPRECLEAR' group by a.tablename;
SELECT a.*,rowid from hs_sett.squarepreclear a;
SELECT a.*,rowid from hs_sett.esquarepreclear a;

SELECT a.*,rowid from hs_sett.TCHECKDATE a;
SELECT a.*,rowid from hs_sett.Tcheckentrust a;
