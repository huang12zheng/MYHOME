DECLARE
  v_name VARCHAR(100);
  v_rowcount VARCHAR(1);
  v_owner VARCHAR(10);
  v_sql VARCHAR(1000);
BEGIN
  
  v_name:=UPPER('squarepreclear');
  BEGIN
    SELECT COUNT(1)
      INTO V_ROWCOUNT
      FROM USER_TABLES
     WHERE TABLE_NAME = V_NAME;  
    EXCEPTION WHEN NO_DATA_FOUND THEN v_rowcount:=0;
  END;
  dbms_output.put_line('IF table EXIST? '||V_ROWCOUNT);
  IF v_rowcount>0 THEN
     select owner into v_owner from all_tables where table_name = v_name;
     v_sql:='';

     select COUNT(1) into V_ROWCOUNT from all_tables where table_name = v_name||'_HZBK';
     IF v_rowcount>0 THEN
         v_sql:='DROP TABLE '||v_owner||'.'||v_name||'_HZBK';
         execute IMMEDIATE v_sql;
     END IF;
     v_sql:='create TABLE '||v_owner||'.'||v_name||'_HZBK'||' as select * from '||v_owner||'.'||v_name;
     execute IMMEDIATE v_sql;
     dbms_output.put_line(v_sql);
  END IF;
  
END;
/
