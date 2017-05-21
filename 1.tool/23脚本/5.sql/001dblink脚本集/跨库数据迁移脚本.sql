/*SELECT a.*,rowid from hs_sett.squarepreclear@HS91@HS_SETT a;
SELECT a.*,rowid from hs_sett.squarepreclear a;*/
DECLARE
v_usingTns VARCHAR2(300);
v_likename VARCHAR2(20);
v_username VARCHAR2(20);
v_PASSWORD VARCHAR2(20);
v_sql      VARCHAR2(2000);
v_where      VARCHAR2(2000);
v_cnt      VARCHAR2(20);

--TYPE arry_var IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
TYPE arry_var IS TABLE OF VARCHAR2(30);
v_tablelist arry_var; 
--v_tablename VARCHAR2(20);

 
BEGIN
  v_tablelist:=arry_var('fundreal','fund','stock','stockreal','fundjour','fundrealjour','stockreal','stockrealjour','settunfinished','unpreclear','deliver','deliversett','squarepreclear');
  v_where:=' where fund_account like ''22260272%''';
    FOR link_record IN (select object_name  from dba_objects where object_type LIKE '%LINK%' AND object_name LIKE '%@%')
    LOOP
        v_likename:=link_record.object_name;
        v_username:=SUBSTR(v_likename,INSTR(v_likename,'@')+1);
        --dbms_output.put_line(v_username);
        
        FOR i IN 1 .. v_tablelist.count
        LOOP
          v_cnt:=0;
          SELECT COUNT(1) INTO v_cnt from dba_objects a WHERE a.OBJECT_TYPE='TABLE' AND a.OWNER=v_username AND a.OBJECT_NAME=UPPER(v_tablelist(i));
          
          IF v_cnt>0 THEN
            --dbms_output.put_line(v_username||' '||v_tablelist(i));
            SELECT COUNT(1) INTO v_cnt from dba_objects a WHERE a.OBJECT_TYPE='TABLE' AND a.OWNER=v_username AND a.OBJECT_NAME=UPPER(v_tablelist(i)||'_TEST');
            IF v_cnt>0 THEN
               v_sql:='DROP TABLE '||v_username||'.'||v_tablelist(i)||'_TEST';
            END IF;
            v_sql:='CREATE TABLE '||v_username||'.'||v_tablelist(i)||'_TEST AS select * from '||
                                    v_username||'.'||v_tablelist(i)||'@'||link_record.object_name||
                                    v_where;
            --dbms_output.put_line(v_sql);
            EXECUTE IMMEDIATE v_sql;
          END IF;
        END LOOP;
        --EXECUTE IMMEDIATE v_sql;
    END LOOP;

END;
/
/*SELECT a.* from All_Tables a;
\*fundreal,fund,stock,stockreal,fundjour,fundrealjour,stockreal,stockrealjour,settunfinished,unpreclear,deliver,deliversett*\
SELECT a.* from dba_objects a WHERE a.OBJECT_TYPE='TABLE';*/
