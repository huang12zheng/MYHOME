create or replace procedure sp_add_tables(p_tbname in varchar2)
is
v_sql varchar2(32000);
v_tbname varchar2(100);
v_cnt varchar2(5);
error_info varchar2(1000):='';
iinstr varchar2(1000):='';

cursor cur_splittableinfo (vc_table_name in varchar2)is
select a.* from splittableinfo a where a.tablename=vc_table_name ORDER BY A.tablename, A.colname;
BEGIN
  

v_tbname:=upper(p_tbname);
select count(1) into v_cnt from user_tables where table_name = v_tbname;
if v_cnt > 0 then
execute immediate 'DROP TABLE '||v_tbname;
END IF;

v_sql:='CREATE TABLE HS_SETT.'||v_tbname||'('||chr(10);

FOR record_splittableinfo IN cur_splittableinfo(v_tbname)
  LOOP
      v_sql:=v_sql||record_splittableinfo.COLNAME||' ';
      v_sql:=v_sql||record_splittableinfo.TYPENAME||' ';
      v_sql:=v_sql||record_splittableinfo.DEFAULTCONTEXT||' ';
      v_sql:=v_sql||record_splittableinfo.CHECKCONTEXT||' ,'||chr(10);
  end loop;
  iinstr:=INSTR(v_sql,',',-1);
  v_sql:=SUBSTR(v_sql,1,iinstr-1);
  v_sql:=v_sql||' '||chr(10)  ||')';
  dbms_output.put_line(v_sql);
  execute IMMEDIATE v_sql;
END;
/
/*DECLARE
v_tn VARCHAR2(20);
BEGIN
  v_tn:='tcheckuser';
sp_add_tables(p_tbname => v_tn);
--select a.*,rowid from hs_sett.tcheckuser a;
END;
/*/
--select count(1) from user_tables where table_name =UPPER('tcheckuser');
--select a.* from splittableinfo a where a.tablename=UPPER('tcheckuser');
