--如果库不对,表是不会建成的:create table as select *
create or replace procedure sp_add_extables(p_tbname in varchar2,p_fund_account IN VARCHAR2) is
v_sql varchar2(32000);

v_cnt varchar2(5);
error_info varchar2(1000):='';
iinstr varchar2(1000):='';
unionINDEX_NAME varchar2(50):='';

cursor cur_EXTABLECOL (vc_table_name in varchar2)is
select a.* from hs_sett.EXTABLE a where a.tablename=vc_table_name;

cursor cur_col_uniqueindex (vc_table_name in varchar2)is
    SELECT a.COLUMN_NAME AS colname from USER_ind_columns a WHERE A.TABLE_NAME=vc_table_name/*'SQUAREPRECLEAR'*/ AND EXISTS (SELECT 1 from user_indexes b WHERE b.index_name=a.INDEX_NAME AND b.uniqueness='UNIQUE' AND b.table_name=A.TABLE_NAME);

BEGIN
  --初始化
select count(1) into v_cnt from user_tables where table_name = 'E'||p_tbname||p_fund_account;
if v_cnt > 0 then
execute immediate 'DROP TABLE E'||p_tbname||p_fund_account;
END IF;
  --建表
--execute immediate 'create table E'|| 'SQUAREPRECLEAR' ||' as select * from ' || 'SQUAREPRECLEAR' || ' where 1=0';
execute immediate 'create table E'|| p_tbname||p_fund_account ||' as select * from ' || p_tbname || ' where 1=0';
v_sql:='alter table E'|| p_tbname||p_fund_account ||' add ( '||chr(10);

FOR record_extable IN cur_EXTABLECOL(p_tbname)
  LOOP
      v_sql:=v_sql||record_extable.COLNAME||' ';
      v_sql:=v_sql||record_extable.TYPENAME||',';
/*      v_sql:=v_sql||record_extable.DEFAULTCONTEXT||' ';
      v_sql:=v_sql||record_extable.CHECKCONTEXT||' ,'||chr(10);*/
  end loop;
  iinstr:=INSTR(v_sql,',',-1);
  v_sql:=SUBSTR(v_sql,1,iinstr-1);
  v_sql:=v_sql||' '||chr(10)  ||')';
  --dbms_output.put_line(v_sql);
  execute IMMEDIATE v_sql;
  --索引初始化
  SELECT b.index_name INTO unionINDEX_NAME from user_indexes b WHERE b.uniqueness='UNIQUE' AND b.table_name=p_tbname;
  unionINDEX_NAME:=replace(unionINDEX_NAME,p_tbname,'E'||p_tbname||p_fund_account);
  select count(1) into v_cnt from user_indexes where index_name = unionINDEX_NAME;
  if v_cnt > 0 then
    v_sql:='DROP INDEX '||unionINDEX_NAME;
    execute IMMEDIATE v_sql;
  END IF;
  --建索引
  v_sql:='CREATE UNIQUE INDEX '||unionINDEX_NAME||' ON E'||p_tbname||p_fund_account||'(';
FOR col_record IN cur_col_uniqueindex(p_tbname)
    LOOP
        v_sql:=v_sql||col_record.colname||',';
    END LOOP;
  v_sql:=SUBSTR(v_sql,1,INSTR(v_sql,',',-1)-1);
  v_sql:=v_sql||')';
  execute IMMEDIATE v_sql;
end sp_add_extables;
/
