DECLARE
v_usingTns VARCHAR2(300);
v_likename VARCHAR2(20);
v_username VARCHAR2(20);
v_PASSWORD VARCHAR2(20);
v_sql      VARCHAR2(2000);
BEGIN
    FOR link_record IN (select object_name  from dba_objects where object_type LIKE '%LINK%' AND object_name LIKE '%@%')
    LOOP
      
        v_sql:='drop PUBLIC DATABASE LINK '||link_record.object_name;
        EXECUTE IMMEDIATE v_sql;
    END LOOP;

END;
/

