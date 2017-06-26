
/*create or replace procedure ap_compareTwoTable
IS*/
DECLARE
/*表字段一致性检查脚本
----------------------------------------
---         请调整比较表的table1,table2        ---
---         请调整循环源的fund_account         ---
---         ---
----------------------------------------
V0  squarepreclear&realsquarepreclear
V1  squarepreclear&realsquarepreclear 排除2018(前台收费)记录
V2  分组添加set_seat_no,
    添加新老表的备注
input_arg1
*/
cursor cur_colname (vc_tablename_c in varchar2) is
  SELECT t.column_name AS colname FROM user_Tab_Columns t WHERE t.table_name=vc_tablename_c ORDER by t.column_id;
p_tbname VARCHAR2(100);
v_tbname VARCHAR2(100);
p_compareTable1  VARCHAR2(100);
p_compareTable2  VARCHAR2(100);
v_sql    VARCHAR2(2000);
v_where    VARCHAR2(500);

------标志-----------------
isAllEqualFlag VARCHAR2(10);
isRecordNumEqual VARCHAR2(10);
isColExist       VARCHAR2(10);
val1             VARCHAR2(10);
val2             VARCHAR2(10);
-----------------------
BEGIN
  p_tbname:='realsquarepreclear';
  p_compareTable1:='realsquarepreclear';--长表(新)
  p_compareTable2:='squarepreclear';--短表(老)
  --p_compareTable2:='squarepreclear_test';
  v_tbname:=upper(p_compareTable1);
  
 
  isAllEqualFlag:='0';

/*获取比较对象 input_arg1*/
  FOR col_squ_record IN 
    (SELECT a.fund_account,a.business_flag,a.set_seat_no from hs_sett.squarepreclear a WHERE a.fund_account LIKE '222602%' AND a.business_flag != '2018' ORDER BY a.set_seat_no,a.fund_account,a.business_flag)
  LOOP
     --v_sql:='';
     /*两表的索引条件*/
     v_where:=' where fund_account='||col_squ_record.fund_account||' and business_flag='||col_squ_record.business_flag||' and set_seat_no='''||col_squ_record.set_seat_no||'''';
--compareStrategy2--比较记录条数是否一致
BEGIN
  dbms_output.put_line(col_squ_record.fund_account||' '||col_squ_record.business_flag||' '||col_squ_record.set_seat_no);--索引信息
       v_sql:='select count(1) FROM hs_sett.'||p_compareTable1||v_where;
       --dbms_output.put_line(v_sql);
       EXECUTE IMMEDIATE v_sql INTO val1;
       v_sql:='select count(1) FROM hs_sett.'||p_compareTable2||v_where;
       EXECUTE IMMEDIATE v_sql INTO val2;
/*       dbms_output.put_line(val1);
       dbms_output.put_line(val2);*/
       if val1!=val2 then
          dbms_output.put_line('  '||p_compareTable1||' and '||p_compareTable2||'总记录数不一致:'||val1||' and '||val2||',please check,and find reasons.Then you can rans this sql again');
          EXIT;
       end if;
END;  
       isRecordNumEqual:=val1;
     --dbms_output.put_line(isRecordNumEqual);
--end compareStrategy2
--compareStrategy3如果记录数不为1,提示,不比对
      IF isRecordNumEqual>1 THEN
         dbms_output.put_line('  '||p_compareTable1||' and '||p_compareTable2||'总记录数大于1,不好比较:'||isRecordNumEqual);
         EXIT;
      ELSE
--compareStrategy1--每一个字段比较
BEGIN
    FOR col_record IN cur_colname(v_tbname)
    LOOP
--compareStrategy11--检查表1中字段在表2中是否存在,不存在提示报错信息[isColExist 判断是否存在]

      
      SELECT nvl((SELECT 1 FROM user_Tab_Columns t WHERE t.table_name=upper(p_compareTable2) AND t.COLUMN_NAME=col_record.colname),0) INTO isColExist FROM  dual;
      IF isColExist=0 THEN
        
        dbms_output.put_line('  '||col_record.colname||'='||val1 ||' is not exist in '||p_compareTable2||' please check yourself ');
      ELSE
--compareStrategy12--检查表1中字段在表2中存在,请直接比较        
      /*v_sql是对每一个字段判断是否一致的处理脚本*/
      --begin_v_sql
      v_sql:='
DECLARE
val1 varchar(100);
val2 varchar(100);
v_colname varchar(100);
BEGIN
  ';
  v_sql:=v_sql||'select '||col_record.colname ||' INTO val1 FROM hs_sett.'||p_compareTable1||v_where||';
  select '||col_record.colname ||' INTO val2 FROM hs_sett.'||p_compareTable2||v_where||';
  ';
  v_sql:=v_sql||'
  v_colname:='''||col_record.colname||''';
  if val1!=val2 then
    --dbms_output.put_line(''  ''||v_colname||''>>''||val1||''!=''||val2);
    --dbms_output.put_line(''  ''||v_colname||''>>''||val1||''!=''||val2||'' '||p_compareTable2||' != '||p_compareTable1||''');
    dbms_output.put_line(''  ''||v_colname||''>> '||p_compareTable2||' != '||p_compareTable1||' >>''||val1||''!=''||val2);
    
  end if;
end;';
      --dbms_output.put_line(v_sql);  --tmp检查脚本是否正确
      --end_v_sql
        EXECUTE IMMEDIATE v_sql;
        --dbms_output.put_line(col_record.colname);
      END IF;--IF isColExist=0 THEN
    END LOOP;
    dbms_output.put_line(v_where||' is check end!');
END; 
    END IF;--IF isRecordNumEqual>1 THEN
--end compareStrategy3   
  END LOOP;
 
END;
/


------------------------------------------------
--SELECT a.*,rowid from hs_sett.squarepreclear_test a;
--drop table hs_sett.squarepreclear_test;
--CREATE TABLE hs_sett.squarepreclear_test AS SELECT a.* from hs_sett.squarepreclear a WHERE a.fund_account LIKE '22260272%' AND a.business_flag != '2018';
