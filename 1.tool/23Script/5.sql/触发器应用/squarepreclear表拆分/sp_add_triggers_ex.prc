create or replace procedure sp_add_triggers_ex(p_tbname in varchar2,p_fund_account IN VARCHAR2)
is

vc_sql_p VARCHAR2(32000); --执行的语句
v_split varchar2(10):='';--分隔符
v_where varchar2(32000):='';--条件块
v_where2 varchar2(32000):='';--条件块
v_tbname VARCHAR2(100);--表名
vc_columnname_p VARCHAR2(100);--字段名
l_cnt_p INTEGER;

v_sqlerrm varchar2(1000) :='';
--查找列名的游标
cursor cur_colname (vc_tablename_c in varchar2) is
  SELECT t.column_name AS colname FROM user_Tab_Columns t WHERE t.table_name=vc_tablename_c ORDER by t.column_id;
cursor cur_col_uniqueindex (vc_table_name in varchar2)is
  SELECT a.COLUMN_NAME AS colname from user_ind_columns a WHERE A.TABLE_NAME=vc_table_name/*'SQUAREPRECLEAR'*/ AND EXISTS (SELECT 1 from user_indexes b WHERE b.index_name=a.INDEX_NAME AND b.uniqueness='UNIQUE' AND b.table_name=A.TABLE_NAME);
BEGIN
  BEGIN
  v_tbname:=upper(p_tbname);

--1.触发器初始化
l_cnt_p:=0;
SELECT COUNT(*) INTO l_cnt_p FROM user_Triggers t WHERE t.trigger_name='TR'||v_tbname||p_fund_account;

    IF l_cnt_p >=1 THEN
          BEGIN
            execute IMMEDIATE 'alter TRIGGER TR' || v_tbname||p_fund_account ||' disable';
            execute IMMEDIATE 'drop TRIGGER TR'||v_tbname||p_fund_account;
          END;
    END IF;

--2.建立扩展表
sp_add_extables(v_tbname,p_fund_account);

--3.生成触发器语句
  vc_sql_p :=
'create or replace trigger TR'||v_tbname||p_fund_account||'
before update or delete or insert
on '||v_tbname||'
for each row
declare
    oldrow E'||v_tbname||'%rowtype;
    newrow E'||v_tbname||'%rowtype;
    v_sql varchar2(32000);
    cursor cur_col_uniqueindex (vc_table_name in varchar2)is
           SELECT a.COLUMN_NAME AS colname from user_ind_columns a WHERE A.TABLE_NAME=vc_table_name AND EXISTS (SELECT 1 from user_indexes b WHERE b.index_name=a.INDEX_NAME AND b.uniqueness=''UNIQUE'' AND b.table_name=A.TABLE_NAME);
    cursor cur_col_table (vc_table_name in varchar2)IS
           select a.column_name AS colname from user_Tab_Columns a where a.table_name=vc_table_name order by a.column_id;
begin
  if '''||p_fund_account||'''is null or '''||p_fund_account||'''=:new.fund_account then
  ';
--原有表数据建立
BEGIN
open cur_colname(v_tbname);
  loop
  fetch cur_colname into vc_columnname_p;
  exit when cur_colname%notfound;
  vc_sql_p := vc_sql_p ||'
  oldrow.'||vc_columnname_p||' := :old.'||vc_columnname_p||';
  newrow.'||vc_columnname_p||' := :new.'||vc_columnname_p||'; ';
  end loop;
  close cur_colname;
--扩展表数据建立

FOR record_EXTABLE IN
  (SELECT * from EXTABLE WHERE tablename=v_tbname)
  LOOP
    vc_sql_p := vc_sql_p ||'
    oldrow.'||record_EXTABLE.colname||' := '|| replace(record_EXTABLE.colvalue,'a.',':old.')||';
    newrow.'||record_EXTABLE.colname||' := '|| replace(record_EXTABLE.colvalue,'a.',':new.')||';';
/*  oldrow.'||record_EXTABLE.colname||' := :old.'||vc_columnname_p||';
    newrow.'||record_EXTABLE.colname||' := :new.'||vc_columnname_p||'; ';*/
  END LOOP;
END;

--处理where,唯一索引
BEGIN
  v_split:=' AND ';
  v_where :=' where ';
  v_where2:=''' where ''';
      FOR col_record IN cur_col_uniqueindex(v_tbname)
        LOOP
          v_where  := v_where ||col_record.colname||' = :old.'||col_record.colname||v_split;
          v_where2 := v_where2 ||'||'''||col_record.colname||' = ''|| :old.'||col_record.colname||'||'' AND ''';
        END LOOP;
        v_where:=SUBSTR(v_where,1,INSTR(v_where,v_split,-1)-1);
        v_where2:=SUBSTR(v_where2,1,INSTR(v_where2,'||',-1)-1);
        --v_where:=v_where||';';
END;
--dbms_output.put_line(vc_sql_p);

--dbms_output.put_line('---------------------------------');
--dbms_output.put_line(vc_sql_p);
--处理开始
  vc_sql_p := vc_sql_p ||'
  case';

--处理inserting
  vc_sql_p := vc_sql_p ||'
           when INSERTING then
                insert into E'||v_tbname||p_fund_account||' values newrow;';
--处理deleting
  vc_sql_p := vc_sql_p ||'
           when deleting then
                delete E'||v_tbname||p_fund_account||' '||v_where||';';

--处理updating  字段是不确定的.那么执行语句 要换为v_sql;
--
  vc_sql_p := vc_sql_p ||'
           when updating then
                v_sql:=''UPDATE E'||v_tbname||p_fund_account||' set '';';
      v_split:=',';
      --FOR col_record IN cur_col_table('E'||v_tbname)
      FOR col_record IN cur_colname('E'||v_tbname)
        LOOP
  vc_sql_p := vc_sql_p ||'
          IF newrow.'||col_record.colname||'<> oldrow.'||col_record.colname||' then
              v_sql:=v_sql||'''||col_record.colname||' = ''||newrow.'||col_record.colname||'||'''||v_split||''';
          END IF;';
        END LOOP;
--处理结尾的分号
      vc_sql_p := vc_sql_p ||'
      v_sql:=SUBSTR(v_sql,1,INSTR(v_sql,'''||v_split||''',-1)-1);';
--处理where,唯一索引
      vc_sql_p := vc_sql_p ||'
            v_sql:=v_sql||'||v_where2||';
          dbms_output.put_line(v_sql);
          execute IMMEDIATE v_sql ;';
--          insert into hztmp values(v_sql);';


--处理结束
  vc_sql_p := vc_sql_p ||'
  end case;
  end if;
END TR'||v_tbname||p_fund_account||';';

--


dbms_output.put_line(vc_sql_p);
--  4.执行生成语句，并使触发器生效
 execute IMMEDIATE vc_sql_p;

  end;



END;
/
