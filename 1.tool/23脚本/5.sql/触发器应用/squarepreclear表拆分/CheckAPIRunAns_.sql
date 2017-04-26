Select object_name From user_objects Where object_type='PROCEDURE' AND object_name LIKE 'SP_ADD_TRIGGERS%'; 
SELECT a.*,rowid from hs_sett.splittableinfo a;
--SELECT DISTINCT a.Tablename from hs_sett.splittableinfo a;
SELECT a.*,rowid from hs_sett.extable a;
Select object_name From user_objects Where object_type='TABLE' AND object_name LIKE 'TCHECK%'; 
Select object_name From user_objects Where object_type='TABLE' AND object_name LIKE 'ESQUARE%'; 
Select object_name From user_objects Where object_type='TRIGGER' AND object_name LIKE 'TR%'; 
Select object_name From user_objects Where object_type='TRIGGER' AND object_name LIKE 'ST%'; 
