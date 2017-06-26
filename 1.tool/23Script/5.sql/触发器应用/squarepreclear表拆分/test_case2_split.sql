DECLARE
BEGIN
sp_add_triggers_split('ESQUAREPRECLEAR');
END;
/

Select object_name From user_objects Where object_type='TRIGGER';  --所有触发器
hs_sett.STTCHECKDATE

/*DROP TRIGGER BIN$QX5qdjxh9CbgUAB/AQAV5g==$0;*/
Select object_name From user_objects Where object_type='PROCEDURE';  --所有存储过程
Select object_name From user_objects Where object_type='VIEW';  --所有视图
Select object_name From user_objects Where object_type='TABLE'; --所有表


SELECT a.*,rowid from hs_sett.extable a;
SELECT a.*,rowid from hs_sett.splittableinfo a;
SELECT a.*,rowid from hs_sett.splittableinfo a;

--UPDATE hs_sett.splittableinfo a SET a.sourcename='E'||a.sourcename;

select max(a.tablename) as tablename from splittableinfo a where a.sourcename='ESQUAREPRECLEAR' group by a.tablename;
SELECT a.*,rowid from hs_sett.squarepreclear a;
SELECT a.*,rowid from hs_sett.esquarepreclear a;

SELECT a.*,rowid from hs_sett.TCHECKDATE a;
SELECT a.*,rowid from hs_sett.Tcheckentrust a;
