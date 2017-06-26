DECLARE
v_usingTns VARCHAR2(300);
v_likename0 VARCHAR2(20);
v_likename VARCHAR2(20);
v_username VARCHAR2(20);
v_PASSWORD VARCHAR2(20);
v_sql      VARCHAR2(2000);
v_cnt      VARCHAR2(20);
v_usernamecnt      VARCHAR2(20);


--TYPE arry_var IS VARRAY(20) OF VARCHAR2(10); 
TYPE arry_var IS TABLE OF VARCHAR2(30) INDEX BY BINARY_INTEGER;
v_usernamelist arry_var; 
BEGIN
  v_usingTns:='(DESCRIPTION =
    (ADDRESS_LIST =
      (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.49.142)(PORT = 1521))
    )
    (CONNECT_DATA =
      (SID = test142)
      (SERVER = DEDICATED)
    )
  )';
  v_likename0:='hs142';
  v_password:='hundsun';
  --v_username:='hs_sett';
  v_usernamelist(1):='hs_sett';
  v_usernamelist(2):='hs_asset';
  v_usernamelist(3):='hs_fund';
  v_usernamelist(4):='hs_secu';

  --v_usernamecnt:=v_usernamelist.count;
  --dbms_output.put_line();
  
  --FOR i IN v_usernamecnt
  FOR i IN 1 .. v_usernamelist.count
  LOOP
    v_username:=v_usernamelist(i);
    v_likename:=v_likename0||'@'||v_username;


    v_cnt:=0;
    select COUNT(*) INTO v_cnt from dba_objects where object_type LIKE '%LINK%' AND object_name=upper(v_likename);
    IF v_cnt>0 THEN
      v_sql:='drop PUBLIC DATABASE LINK '||v_likename;
      EXECUTE IMMEDIATE v_sql;
    END IF;
    
    --v_sql:='CREATE PUBLIC DATABASE LINK '||hs911||'CONNECT TO '||hs_sett||'IDENTIFIED BY '||hundsun||' USING '''||v_usingTns||'''';
    v_sql:='CREATE PUBLIC DATABASE LINK '||v_likename||' CONNECT TO '||v_username||' IDENTIFIED BY '||v_password||' USING '''||v_usingTns||'''';
    dbms_output.put_line(v_sql);
    EXECUTE IMMEDIATE v_sql;
  END LOOP;
END;
/
--    select *  from dba_objects where object_type LIKE '%LINK%';
--SELECT a.*,rowid from hs_sett.squarepreclear@hs91@hs_sett a;
