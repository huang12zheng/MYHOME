/****************************************************************************************************/
/* Դ��������:     sett_TestTableConfigPatch.sql                                                             */
/* �������Ȩ:     �������ӹɷ����޹�˾                                                             */
/* ϵͳ����:       ����ҵ����Ӫƽ̨V2.0                                                             */
/* ģ������:       hs_sett�����ṹ���                                                           */
/* ����˵��:       hs_sett�����ṹ��������ű�                                                   */
/* ���ߣ�          ����ҵ����Ӫƽ̨V2.0������                                                       */
/* ���:                                                                                            */
/* ���ļ����Լ�¼: ����ҵ����Ӫƽ̨V2.0������   2016/11/14   ����                                   */
/* ע��:           Ϊ��ϼ��ܣ�����ע��ʱ����ÿ��ǰ��--                                             */
/****************************************************************************************************/
-- ���޸ļ�¼
-- V0.0.0.1  20161115 ��  �� splittableinfo,EXTABLE
prompt
prompt ���� splittableinfo ������Ϣ�� �Ƿ���ڣ��������򴴽�......
--drop table splittableinfo;
--select a.*,rowid from hs_sett.splittableinfo a;
declare
  v_rowcount integer;
begin
  select count(1) into v_rowcount from all_tables where table_name = upper('splittableinfo');
  if v_rowcount > 0 then
    execute IMMEDIATE 'DROP TABLE '||'splittableinfo';
  end if;
	execute immediate 'CREATE TABLE hs_sett.splittableinfo(
	uername					  varchar2(10)	  DEFAULT '' ''		   NOT NULL,
	tablename				  varchar2(20)	  DEFAULT '' ''		   NOT NULL,
	sourcename				varchar2(20)	  DEFAULT '' ''		   NOT NULL,
	colname					  varchar2(20)	  DEFAULT '' ''		   NOT NULL,
	typename				  varchar2(20)	  DEFAULT '' ''		   NOT NULL,
	defaultcontext		varchar2(20)	  DEFAULT '' ''		   NOT NULL,
	checkcontext			varchar2(10)	  DEFAULT '' ''		   NOT NULL
	)';
	--execute immediate 'CREATE UNIQUE INDEX idx_splittableinfo ON hs_sett.splittableinfo(tablename) TABLESPACE HS_SETT_IDX ';
	commit;
end;
/
prompt
prompt ���� EXTABLE ��չ����Ϣ�� �Ƿ���ڣ��������򴴽�......
declare
  v_rowcount integer;
begin
  select count(1) into v_rowcount from all_tables where table_name = upper('EXTABLE');
  if v_rowcount > 0 then
    execute IMMEDIATE 'DROP TABLE '||'EXTABLE';
  end if;
  
  execute immediate 'CREATE TABLE HS_SETT.EXTABLE(
  tablename          varchar2(20)    DEFAULT '' ''       NOT NULL,
  colname            varchar2(20)    DEFAULT '' ''       NOT NULL,
  typename          varchar2(20)    DEFAULT '' ''       NOT NULL,
  colvalue          varchar2(200)    DEFAULT '' ''       NOT NULL
  )';
  commit;
  
end;
/
