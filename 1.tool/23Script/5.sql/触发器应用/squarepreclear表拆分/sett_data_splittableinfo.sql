--SELECT a.*,rowid from hs_sett.splittableinfo a;
DELETE hs_sett.splittableinfo a;
--SELECT a.* from user_tables a WHERE a.table_name=UPPER('tcheckuser');
INSERT INTO hs_sett.splittableinfo /*insert into*/
SELECT 'HS_SETT',
       upper(A.TABLE_NAME),
       'ESQUAREPRECLEAR',
       upper(A.COLUMN_NAME),
       CASE A.DATA_TYPE
         WHEN 'NUMBER'   THEN A.DATA_TYPE || '(' || A.DATA_LENGTH || ',' || A.DATA_SCALE || ')'
         WHEN 'VARCHAR2' THEN A.DATA_TYPE || '(' || A.DATA_LENGTH || ')'
         WHEN 'CHAR'     THEN A.DATA_TYPE || '(' || A.DATA_LENGTH || ')'
       END,
       'DEFAULT '||CASE A.DATA_TYPE
         WHEN 'NUMBER'   THEN '0'
         WHEN 'VARCHAR2' THEN ''' '''
         WHEN 'CHAR'     THEN ''' '''
       END,'NOT NULL'
  FROM USER_TAB_COLUMNS A
 WHERE LOWER(A.TABLE_NAME) IN ('tcheckuser',
                               'tcheckentrust',
                               'tcheckmatch',
                               'tcheckfare',
                               'tcheckexchangefare',
                               'tcheckdate',
                               'tcheckfs',
                               'tcheckfsex',
                               'tcheckother')
 ORDER BY A.TABLE_NAME, A.COLUMN_ID;
COMMIT;
