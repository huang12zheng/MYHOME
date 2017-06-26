create or replace procedure sp_add_triggers(vc_tbname_p in varchar2)
is

vc_sql_p VARCHAR2(32000); --执行的语句
vc_tablename_p VARCHAR2(100);--表名
vc_columnname_p VARCHAR2(100);--字段名
l_cnt_p INTEGER;

v_sqlerrm varchar2(1000) :='';
--查找列名的游标
cursor cur_colname (vc_tablename_c in varchar2) is
  SELECT t.column_name FROM User_Tab_Columns t WHERE t.table_name=vc_tablename_c ORDER by t.column_id;

BEGIN
  BEGIN
  vc_tablename_p:=upper(vc_tbname_p);


l_cnt_p:=0;
SELECT COUNT(*) INTO l_cnt_p FROM User_Triggers t WHERE t.trigger_name='M'||vc_tablename_p;

    IF l_cnt_p >=1 THEN
          BEGIN
            execute IMMEDIATE 'alter TRIGGER M' || vc_tablename_p ||' disable';
            execute IMMEDIATE 'drop TRIGGER M'||vc_tablename_p;
            execute IMMEDIATE 'drop TABLE O'||vc_tablename_p;
            execute IMMEDIATE 'drop TABLE N'||vc_tablename_p;
          END;
    END IF;



l_cnt_p :=0;
SELECT COUNT(*) INTO l_cnt_p FROM User_Tables t WHERE t.TABLE_NAME='O' ||vc_tablename_p;
IF l_cnt_p >=1 THEN
  BEGIN
  execute IMMEDIATE 'drop TABLE O'||vc_tablename_p;
  execute IMMEDIATE 'drop TABLE N'||vc_tablename_p;
  END;
END IF;

 execute immediate 'create table O'|| vc_tablename_p ||' as select * from ' || vc_tablename_p || ' where 1=0';
 execute immediate 'create table N'|| vc_tablename_p ||' as select * from ' || vc_tablename_p || ' where 1=0';
 execute immediate 'alter table O'|| vc_tablename_p ||' add (action_time VARCHAR2(50),v_action VARCHAR2(50))';
 execute immediate 'alter table N'|| vc_tablename_p ||' add (action_time VARCHAR2(50),v_action VARCHAR2(50))';



--3.生成触发器语句
  vc_sql_p :=
'create or replace trigger M'||vc_tablename_p||'
before update or delete or insert
on '||vc_tablename_p||'
for each row
declare
    oldrow O'||vc_tablename_p||'%rowtype;
    newrow N'||vc_tablename_p||'%rowtype;
    tmpstr O'||vc_tablename_p||'.action_time%type;
  begin ';

open cur_colname(vc_tablename_p);
  loop
  fetch cur_colname into vc_columnname_p;
  exit when cur_colname%notfound;
  vc_sql_p := vc_sql_p ||'
  oldrow.'||vc_columnname_p||' := :old.'||vc_columnname_p||';
  newrow.'||vc_columnname_p||' := :new.'||vc_columnname_p||'; ';
  end loop;
  close cur_colname;

  vc_sql_p := vc_sql_p ||
'
    tmpstr :=  to_char(systimestamp,''yyyy-mm-dd hh24:mi:ssxff'');
    oldrow.action_time := tmpstr;
    newrow.action_time := tmpstr;
    case
      when updating then
        oldrow.v_action := ''Update '||vc_tablename_p||'(Old)'';
        newrow.v_action := ''Update '||vc_tablename_p||'(New)'';
        insert into O'||vc_tablename_p||' values oldrow;
        insert into N'||vc_tablename_p||' values newrow;
      when inserting then
        newrow.v_action := ''Insert '||vc_tablename_p||'(Old)'';
        insert into O'||vc_tablename_p||' values newrow;
        newrow.v_action := ''Insert '||vc_tablename_p||'(New)'';
        insert into N'||vc_tablename_p||' values newrow;
      when deleting then
        oldrow.v_action := ''Delete '||vc_tablename_p||'(Old)'';
        insert into O'||vc_tablename_p||' values oldrow;
        oldrow.v_action := ''Delete '||vc_tablename_p||'(New)'';
        insert into N'||vc_tablename_p||' values oldrow;
      end case;
  end;  '
  ;



--  4.执行生成语句，并使触发器生效
 execute IMMEDIATE vc_sql_p;
 --execute IMMEDIATE 'alter TRIGGER M' || vc_tablename_p ||' enable';

--插入tmessagelog，调试用
/*insert into tmessagelog (L_DATE, L_TIME, C_LOG_TYPE, VC_MESSAGE, L_FLOW_ID, L_FUND_ID)
values (20120904, to_char(sysdate,'mmhhss'), '1','4', 1, -1);
COMMIT;*/
--调试用结束

          insert into testlog (L_DATE, L_TIME, VC_MESSAGE)
        values (to_char(sysdate,'yyyymmdd'), to_char(sysdate,'hh24miss'), 'sp_add_triggers:'||vc_tbname_p);
        COMMIT;

    EXCEPTION
      WHEN OTHERS THEN
        v_sqlerrm := SUBSTR(SQLERRM,1,1000);
        insert into testlog (L_DATE, L_TIME, VC_MESSAGE)
        values (to_char(sysdate,'yyyymmdd'), to_char(sysdate,'hh24miss'), 'sp_add_triggers:'||v_sqlerrm);
        COMMIT;


  end;
 -- dbms_output.put_line(v_sqlerrm);


END;
/
