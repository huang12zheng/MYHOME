/****************************************************************************************************/
/* 源程序名称:     sett_TestTableConfigPatch.sql                                                             */
/* 软件著作权:     恒生电子股份有限公司                                                             */
/* 系统名称:       经纪业务运营平台V2.0                                                             */
/* 模块名称:       hs_sett清算表结构拆分                                                           */
/* 功能说明:       hs_sett清算表结构拆分升级脚本                                                   */
/* 作者：          经纪业务运营平台V2.0测试组                                                       */
/* 审核:                                                                                            */
/* 更改及测试记录: 经纪业务运营平台V2.0测试组   2016/11/14   创建                                   */
/* 注意:           为配合加密，批量注释时请在每行前加--                                             */
/****************************************************************************************************/
-- 总修改记录
-- V0.0.0.1  20161115 黄  政 splittableinfo,EXTABLE
prompt
prompt 检查表 splittableinfo 分裂信息表 是否存在，不存在则创建......
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
prompt 检查表 EXTABLE 扩展表信息表 是否存在，不存在则创建......
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
