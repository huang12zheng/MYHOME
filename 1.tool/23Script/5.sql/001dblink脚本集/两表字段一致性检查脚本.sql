
/*create or replace procedure ap_compareTwoTable
IS*/
DECLARE
/*���ֶ�һ���Լ��ű�
----------------------------------------
---         ������Ƚϱ��table1,table2        ---
---         �����ѭ��Դ��fund_account         ---
---         ---
----------------------------------------
V0  squarepreclear&realsquarepreclear
V1  squarepreclear&realsquarepreclear �ų�2018(ǰ̨�շ�)��¼
V2  �������set_seat_no,
    ������ϱ�ı�ע
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

------��־-----------------
isAllEqualFlag VARCHAR2(10);
isRecordNumEqual VARCHAR2(10);
isColExist       VARCHAR2(10);
val1             VARCHAR2(10);
val2             VARCHAR2(10);
-----------------------
BEGIN
  p_tbname:='realsquarepreclear';
  p_compareTable1:='realsquarepreclear';--����(��)
  p_compareTable2:='squarepreclear';--�̱�(��)
  --p_compareTable2:='squarepreclear_test';
  v_tbname:=upper(p_compareTable1);
  
 
  isAllEqualFlag:='0';

/*��ȡ�Ƚ϶��� input_arg1*/
  FOR col_squ_record IN 
    (SELECT a.fund_account,a.business_flag,a.set_seat_no from hs_sett.squarepreclear a WHERE a.fund_account LIKE '222602%' AND a.business_flag != '2018' ORDER BY a.set_seat_no,a.fund_account,a.business_flag)
  LOOP
     --v_sql:='';
     /*�������������*/
     v_where:=' where fund_account='||col_squ_record.fund_account||' and business_flag='||col_squ_record.business_flag||' and set_seat_no='''||col_squ_record.set_seat_no||'''';
--compareStrategy2--�Ƚϼ�¼�����Ƿ�һ��
BEGIN
  dbms_output.put_line(col_squ_record.fund_account||' '||col_squ_record.business_flag||' '||col_squ_record.set_seat_no);--������Ϣ
       v_sql:='select count(1) FROM hs_sett.'||p_compareTable1||v_where;
       --dbms_output.put_line(v_sql);
       EXECUTE IMMEDIATE v_sql INTO val1;
       v_sql:='select count(1) FROM hs_sett.'||p_compareTable2||v_where;
       EXECUTE IMMEDIATE v_sql INTO val2;
/*       dbms_output.put_line(val1);
       dbms_output.put_line(val2);*/
       if val1!=val2 then
          dbms_output.put_line('  '||p_compareTable1||' and '||p_compareTable2||'�ܼ�¼����һ��:'||val1||' and '||val2||',please check,and find reasons.Then you can rans this sql again');
          EXIT;
       end if;
END;  
       isRecordNumEqual:=val1;
     --dbms_output.put_line(isRecordNumEqual);
--end compareStrategy2
--compareStrategy3�����¼����Ϊ1,��ʾ,���ȶ�
      IF isRecordNumEqual>1 THEN
         dbms_output.put_line('  '||p_compareTable1||' and '||p_compareTable2||'�ܼ�¼������1,���ñȽ�:'||isRecordNumEqual);
         EXIT;
      ELSE
--compareStrategy1--ÿһ���ֶαȽ�
BEGIN
    FOR col_record IN cur_colname(v_tbname)
    LOOP
--compareStrategy11--����1���ֶ��ڱ�2���Ƿ����,��������ʾ������Ϣ[isColExist �ж��Ƿ����]

      
      SELECT nvl((SELECT 1 FROM user_Tab_Columns t WHERE t.table_name=upper(p_compareTable2) AND t.COLUMN_NAME=col_record.colname),0) INTO isColExist FROM  dual;
      IF isColExist=0 THEN
        
        dbms_output.put_line('  '||col_record.colname||'='||val1 ||' is not exist in '||p_compareTable2||' please check yourself ');
      ELSE
--compareStrategy12--����1���ֶ��ڱ�2�д���,��ֱ�ӱȽ�        
      /*v_sql�Ƕ�ÿһ���ֶ��ж��Ƿ�һ�µĴ���ű�*/
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
      --dbms_output.put_line(v_sql);  --tmp���ű��Ƿ���ȷ
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
