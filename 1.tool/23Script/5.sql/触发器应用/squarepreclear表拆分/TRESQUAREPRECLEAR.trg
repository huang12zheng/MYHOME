create or replace trigger TRSQUAREPRECLEAR
before update or delete or INSERT
on squarepreclear FOR EACH ROW
declare
  v_sql varchar2(32000);
  v_sourcetbname varchar2(100);
  --v_desctbname   varchar2(100);
  v_cnt varchar2(5);
  error_info varchar2(1000):='';
  iinstr varchar2(1000):='';
  cursor cur_tablenameBysourcename (vc_table_name in varchar2)is
    select MAX(a.tablename) AS tablename from splittableinfo a where a.sourcename=vc_table_name GROUP BY A.tablename;
  cursor cur_col_uniqueindex (vc_table_name in varchar2)is
    SELECT a.COLUMN_NAME AS colname from USER_ind_columns a WHERE A.TABLE_NAME=vc_table_name/*'SQUAREPRECLEAR'*/ AND EXISTS (SELECT 1 from user_indexes b WHERE b.index_name=a.INDEX_NAME AND b.uniqueness='UNIQUE' AND b.table_name=A.TABLE_NAME);
  cursor cur_col_table (vc_table_name in varchar2)IS
    select a.column_name AS colname from user_Tab_Columns a where a.table_name=vc_table_name order by a.column_id;


  v_split varchar2(50);
  v_context varchar2(32000);
BEGIN
  v_sourcetbname:=UPPER('SQUAREPRECLEAR');
  SELECT COUNT(*) INTO v_cnt FROM User_Tables t WHERE t.TABLE_NAME='E' ||v_sourcetbname;
  IF v_cnt >=1 THEN
     execute IMMEDIATE 'drop TABLE E'||v_sourcetbname;
  END IF;
  execute immediate 'create table E'|| v_sourcetbname ||' as select * from ' || v_sourcetbname || ' where 1=0';
  execute immediate 'alter table E'|| v_sourcetbname ||' add (tablename VARCHAR2(18),market_amount number(19,2),enable_amount number(19,2),market_balance number(19,2),enable_balance number(19,2))';
  
  FOR tablename_record IN cur_tablenameBysourcename('SQUAREPRECLEAR')
  LOOP

      case
        when updating then
             v_sql:='UPDATE '||tablename_record.tablename||' set ';
        when deleting then
             v_sql:='delete '||tablename_record.tablename||' where ';
        when INSERTING then
             v_sql:='insert into '||tablename_record.tablename||' values(';
      end case;
      /*ÄÚÈÝ*/

      --sp_triggercase_by_SourceAndTable(v_sourcetbname,tablename_record,triggercase,rowrecord);
        case
          when updating THEN
               v_split:=',';
               FOR col_record IN cur_col_table(tablename_record.tablename)
                 LOOP
                   IF UPDATING(col_record.colname) THEN
                         v_sql:=v_sql||col_record.colname||' = :new.'||/*a.sourcename*/col_record.colname||v_split;
                   END IF;
                 END LOOP;
               v_sql:=SUBSTR(v_sql,1,INSTR(v_sql,v_split,-1)-1);
          when deleting THEN
               v_split:=' AND ';
               FOR col_record IN cur_col_uniqueindex(tablename_record.tablename)
               LOOP
                   v_sql:=v_sql||col_record.colname||' = :new.'||col_record.colname||v_split;
               END LOOP;
               v_sql:=SUBSTR(v_sql,1,INSTR(v_sql,v_split,-1)-1);
          when INSERTING THEN
               v_split:=',';
               FOR col_record IN cur_col_table(tablename_record.tablename)
                 LOOP
                   v_sql:=v_sql||':new.'||col_record.colname||v_split;
                 END LOOP;
               v_sql:=SUBSTR(v_sql,1,INSTR(v_sql,v_split,-1)-1);
               v_sql:=v_sql||')';
        END CASE;

  dbms_output.put_line(v_sql);

  END LOOP;
END TRSQUAREPRECLEAR;
