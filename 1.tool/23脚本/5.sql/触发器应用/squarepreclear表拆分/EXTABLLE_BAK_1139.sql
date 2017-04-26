prompt Importing table hs_sett.extable...
set feedback off
set define off
insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'TABLENAME', 'VARCHAR2(18)', '''SQUAREPRECLEAR''');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'MARKET_AMOUNT', 'NUMBER(19,2)', 'a.occur_amount+a.correct_amount');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'ENABLE_AMOUNT', 'NUMBER(19,2)', 'a.occur_amount+a.unfrozen_amount-a.frozen_amount');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'MARKET_BALANCE', 'NUMBER(19,2)', 'a.clear_balance+a.correct_balance');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'ENABLE_BALANCE', 'NUMBER(19,2)', 'a.clear_balance+a.unfrozen_balance-a.frozen_balance');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'STOCK_DATE_BACK', 'NUMBER(10,0)', '''-1''');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'FUND_DATE_BACK', 'NUMBER(10,0)', '''-1''');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('FUND', 'TABLENAME', 'VARCHAR2(18)', '''FUND''');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'MARKET_BALANCE', 'NUMBER(19,2)', 'a.occur_amount+a.unfrozen_amount-a.frozen_amount');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'ENABLE_BALANCE', 'NUMBER(19,2)', 'a.clear_balance+a.unfrozen_balance-a.frozen_balance');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('FUNDREAL', 'MARKET_BALANCE', 'NUMBER(19,2)', 'a.current_amount+a.unfrozen_amount-a.frozen_amount');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('FUNDREAL', 'MARKET_AMOUNT', 'NUMBER(19,2)', 'a.current_amount+a.correct_amount');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('FUNDREAL', 'TABLENAME', 'VARCHAR2(18)', '''FUNDREAL''');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('STOCKREAL', 'MARKET_BALANCE', 'NUMBER(19,2)', 'a.current_amount+a.unfrozen_amount-a.frozen_amount');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('STOCKREAL', 'MARKET_AMOUNT', 'NUMBER(19,2)', 'a.current_amount+a.correct_amount');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('STOCKREAL', 'TABLENAME', 'VARCHAR2(18)', '''STOCKREAL''');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('STOCK', 'TABLENAME', 'VARCHAR2(18)', '''STOCK''');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('STOCK', 'MARKET_BALANCE', 'NUMBER(19,2)', 'a.current_amount+a.correct_amount');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'TABLENAME', 'VARCHAR2(18)', '''SQUAREPRECLEAR''');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'MARKET_AMOUNT', 'NUMBER(19,2)', 'a.occur_amount+a.correct_amount');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'ENABLE_AMOUNT', 'NUMBER(19,2)', 'a.clear_balance+a.correct_balance');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('FUND', 'MARKET_BALANCE', 'NUMBER(19,2)', 'a.current_balance+a.correct_balance');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'STOCK_DATE_BACK', 'NUMBER(10,0)', '''-1''');

insert into hs_sett.extable (TABLENAME, COLNAME, TYPENAME, COLVALUE)
values ('SQUAREPRECLEAR', 'FUND_DATE_BACK', 'NUMBER(10,0)', '''-1''');

prompt Done.
