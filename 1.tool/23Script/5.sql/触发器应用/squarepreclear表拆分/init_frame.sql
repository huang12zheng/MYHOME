prompt 批量删除触发器框架对象

DECLARE
BEGIN
  FOR MYOBJECT IN
      (Select object_name From user_objects Where object_type='PROCEDURE' AND object_name LIKE 'SP_ADD_TRIGGERS%')
      LOOP
        EXECUTE IMMEDIATE 'DROP PROCEDURE '||MYOBJECT.object_name;
      END LOOP;
  FOR MYOBJECT IN
      (Select object_name From user_objects Where object_type='TABLE' AND object_name LIKE 'TCHECK%'
      UNION
      Select object_name From user_objects Where object_type='TABLE' AND object_name LIKE 'ESQUARE%')
      LOOP
        EXECUTE IMMEDIATE 'DROP TABLE '||MYOBJECT.object_name;
      END LOOP;
  FOR MYOBJECT IN
      (Select object_name From all_objects Where object_type='TRIGGER' AND object_name LIKE 'TR%'
      UNION
	   Select object_name From all_objects Where object_type='TRIGGER' AND object_name LIKE 'ST%'
      UNION
       Select object_name From all_objects Where object_type='TRIGGER' AND object_name LIKE 'M%' AND object_name NOT LIKE '%_%')
      LOOP
        EXECUTE IMMEDIATE 'DROP TRIGGER '||MYOBJECT.object_name;
      END LOOP;

END;
/
