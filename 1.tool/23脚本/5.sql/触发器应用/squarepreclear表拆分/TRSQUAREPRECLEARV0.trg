create or replace trigger TRSQUAREPRECLEAR
before update or delete or insert
on SQUAREPRECLEAR
for each row
declare
    oldrow ESQUAREPRECLEAR%rowtype;
    newrow ESQUAREPRECLEAR%rowtype;
    v_sql varchar2(32000);
    cursor cur_col_uniqueindex (vc_table_name in varchar2)is
           SELECT a.COLUMN_NAME AS colname from USER_ind_columns a WHERE A.TABLE_NAME=vc_table_name AND EXISTS (SELECT 1 from user_indexes b WHERE b.index_name=a.INDEX_NAME AND b.uniqueness='UNIQUE' AND b.table_name=A.TABLE_NAME);
    cursor cur_col_table (vc_table_name in varchar2)IS
           select a.column_name AS colname from user_Tab_Columns a where a.table_name=vc_table_name order by a.column_id;
begin 
  oldrow.INIT_DATE := :old.INIT_DATE;
  newrow.INIT_DATE := :new.INIT_DATE; 
  oldrow.SERIAL_NO := :old.SERIAL_NO;
  newrow.SERIAL_NO := :new.SERIAL_NO; 
  oldrow.CURR_TIME := :old.CURR_TIME;
  newrow.CURR_TIME := :new.CURR_TIME; 
  oldrow.BRANCH_NO := :old.BRANCH_NO;
  newrow.BRANCH_NO := :new.BRANCH_NO; 
  oldrow.BUSINESS_FLAG := :old.BUSINESS_FLAG;
  newrow.BUSINESS_FLAG := :new.BUSINESS_FLAG; 
  oldrow.FILE_KIND := :old.FILE_KIND;
  newrow.FILE_KIND := :new.FILE_KIND; 
  oldrow.FILE_TYPE := :old.FILE_TYPE;
  newrow.FILE_TYPE := :new.FILE_TYPE; 
  oldrow.FUND_ACCOUNT := :old.FUND_ACCOUNT;
  newrow.FUND_ACCOUNT := :new.FUND_ACCOUNT; 
  oldrow.EXCHANGE_TYPE := :old.EXCHANGE_TYPE;
  newrow.EXCHANGE_TYPE := :new.EXCHANGE_TYPE; 
  oldrow.STOCK_ACCOUNT := :old.STOCK_ACCOUNT;
  newrow.STOCK_ACCOUNT := :new.STOCK_ACCOUNT; 
  oldrow.REPORT_ACCOUNT := :old.REPORT_ACCOUNT;
  newrow.REPORT_ACCOUNT := :new.REPORT_ACCOUNT; 
  oldrow.STOCK_CODE := :old.STOCK_CODE;
  newrow.STOCK_CODE := :new.STOCK_CODE; 
  oldrow.MONEY_TYPE := :old.MONEY_TYPE;
  newrow.MONEY_TYPE := :new.MONEY_TYPE; 
  oldrow.STOCK_TYPE := :old.STOCK_TYPE;
  newrow.STOCK_TYPE := :new.STOCK_TYPE; 
  oldrow.STOCK_NAME := :old.STOCK_NAME;
  newrow.STOCK_NAME := :new.STOCK_NAME; 
  oldrow.STORE_UNIT := :old.STORE_UNIT;
  newrow.STORE_UNIT := :new.STORE_UNIT; 
  oldrow.FROZEN_CODE := :old.FROZEN_CODE;
  newrow.FROZEN_CODE := :new.FROZEN_CODE; 
  oldrow.ENTRUST_BS := :old.ENTRUST_BS;
  newrow.ENTRUST_BS := :new.ENTRUST_BS; 
  oldrow.ENTRUST_WAY := :old.ENTRUST_WAY;
  newrow.ENTRUST_WAY := :new.ENTRUST_WAY; 
  oldrow.ENTRUST_TYPE := :old.ENTRUST_TYPE;
  newrow.ENTRUST_TYPE := :new.ENTRUST_TYPE; 
  oldrow.FARE_KIND_STR := :old.FARE_KIND_STR;
  newrow.FARE_KIND_STR := :new.FARE_KIND_STR; 
  oldrow.FARE_KIND := :old.FARE_KIND;
  newrow.FARE_KIND := :new.FARE_KIND; 
  oldrow.ROOM_CODE := :old.ROOM_CODE;
  newrow.ROOM_CODE := :new.ROOM_CODE; 
  oldrow.SEAT_NO := :old.SEAT_NO;
  newrow.SEAT_NO := :new.SEAT_NO; 
  oldrow.ENTRUST_NO := :old.ENTRUST_NO;
  newrow.ENTRUST_NO := :new.ENTRUST_NO; 
  oldrow.ENTRUST_DATE := :old.ENTRUST_DATE;
  newrow.ENTRUST_DATE := :new.ENTRUST_DATE; 
  oldrow.BUSINESS_NO := :old.BUSINESS_NO;
  newrow.BUSINESS_NO := :new.BUSINESS_NO; 
  oldrow.BUSINESS_TYPE := :old.BUSINESS_TYPE;
  newrow.BUSINESS_TYPE := :new.BUSINESS_TYPE; 
  oldrow.BUSINESS_PRICE := :old.BUSINESS_PRICE;
  newrow.BUSINESS_PRICE := :new.BUSINESS_PRICE; 
  oldrow.BUSINESS_BALANCE := :old.BUSINESS_BALANCE;
  newrow.BUSINESS_BALANCE := :new.BUSINESS_BALANCE; 
  oldrow.REPORT_TIME := :old.REPORT_TIME;
  newrow.REPORT_TIME := :new.REPORT_TIME; 
  oldrow.BUSINESS_TIME := :old.BUSINESS_TIME;
  newrow.BUSINESS_TIME := :new.BUSINESS_TIME; 
  oldrow.BUSINESS_TIMES := :old.BUSINESS_TIMES;
  newrow.BUSINESS_TIMES := :new.BUSINESS_TIMES; 
  oldrow.FARE0 := :old.FARE0;
  newrow.FARE0 := :new.FARE0; 
  oldrow.FARE1 := :old.FARE1;
  newrow.FARE1 := :new.FARE1; 
  oldrow.FARE2 := :old.FARE2;
  newrow.FARE2 := :new.FARE2; 
  oldrow.FARE3 := :old.FARE3;
  newrow.FARE3 := :new.FARE3; 
  oldrow.FAREX := :old.FAREX;
  newrow.FAREX := :new.FAREX; 
  oldrow.FARE_REMARK := :old.FARE_REMARK;
  newrow.FARE_REMARK := :new.FARE_REMARK; 
  oldrow.STANDARD_FARE0 := :old.STANDARD_FARE0;
  newrow.STANDARD_FARE0 := :new.STANDARD_FARE0; 
  oldrow.EXCHANGE_FARE0 := :old.EXCHANGE_FARE0;
  newrow.EXCHANGE_FARE0 := :new.EXCHANGE_FARE0; 
  oldrow.EXCHANGE_FARE1 := :old.EXCHANGE_FARE1;
  newrow.EXCHANGE_FARE1 := :new.EXCHANGE_FARE1; 
  oldrow.EXCHANGE_FARE2 := :old.EXCHANGE_FARE2;
  newrow.EXCHANGE_FARE2 := :new.EXCHANGE_FARE2; 
  oldrow.EXCHANGE_FARE3 := :old.EXCHANGE_FARE3;
  newrow.EXCHANGE_FARE3 := :new.EXCHANGE_FARE3; 
  oldrow.EXCHANGE_FARE4 := :old.EXCHANGE_FARE4;
  newrow.EXCHANGE_FARE4 := :new.EXCHANGE_FARE4; 
  oldrow.EXCHANGE_FARE5 := :old.EXCHANGE_FARE5;
  newrow.EXCHANGE_FARE5 := :new.EXCHANGE_FARE5; 
  oldrow.EXCHANGE_FARE6 := :old.EXCHANGE_FARE6;
  newrow.EXCHANGE_FARE6 := :new.EXCHANGE_FARE6; 
  oldrow.EXCHANGE_FAREX := :old.EXCHANGE_FAREX;
  newrow.EXCHANGE_FAREX := :new.EXCHANGE_FAREX; 
  oldrow.EXCHANGE_FARE := :old.EXCHANGE_FARE;
  newrow.EXCHANGE_FARE := :new.EXCHANGE_FARE; 
  oldrow.REBATE_BALANCE := :old.REBATE_BALANCE;
  newrow.REBATE_BALANCE := :new.REBATE_BALANCE; 
  oldrow.BROKERAGE := :old.BROKERAGE;
  newrow.BROKERAGE := :new.BROKERAGE; 
  oldrow.ENTRUST_AMOUNT := :old.ENTRUST_AMOUNT;
  newrow.ENTRUST_AMOUNT := :new.ENTRUST_AMOUNT; 
  oldrow.BUSINESS_AMOUNT := :old.BUSINESS_AMOUNT;
  newrow.BUSINESS_AMOUNT := :new.BUSINESS_AMOUNT; 
  oldrow.OCCUR_AMOUNT := :old.OCCUR_AMOUNT;
  newrow.OCCUR_AMOUNT := :new.OCCUR_AMOUNT; 
  oldrow.FROZEN_AMOUNT := :old.FROZEN_AMOUNT;
  newrow.FROZEN_AMOUNT := :new.FROZEN_AMOUNT; 
  oldrow.UNFROZEN_AMOUNT := :old.UNFROZEN_AMOUNT;
  newrow.UNFROZEN_AMOUNT := :new.UNFROZEN_AMOUNT; 
  oldrow.UNCOME_BUY_AMOUNT := :old.UNCOME_BUY_AMOUNT;
  newrow.UNCOME_BUY_AMOUNT := :new.UNCOME_BUY_AMOUNT; 
  oldrow.UNCOME_SELL_AMOUNT := :old.UNCOME_SELL_AMOUNT;
  newrow.UNCOME_SELL_AMOUNT := :new.UNCOME_SELL_AMOUNT; 
  oldrow.CORRECT_AMOUNT := :old.CORRECT_AMOUNT;
  newrow.CORRECT_AMOUNT := :new.CORRECT_AMOUNT; 
  oldrow.REAL_AMOUNT := :old.REAL_AMOUNT;
  newrow.REAL_AMOUNT := :new.REAL_AMOUNT; 
  oldrow.CLEAR_BALANCE := :old.CLEAR_BALANCE;
  newrow.CLEAR_BALANCE := :new.CLEAR_BALANCE; 
  oldrow.FROZEN_BALANCE := :old.FROZEN_BALANCE;
  newrow.FROZEN_BALANCE := :new.FROZEN_BALANCE; 
  oldrow.UNFROZEN_BALANCE := :old.UNFROZEN_BALANCE;
  newrow.UNFROZEN_BALANCE := :new.UNFROZEN_BALANCE; 
  oldrow.UNCOME_BUY_BALANCE := :old.UNCOME_BUY_BALANCE;
  newrow.UNCOME_BUY_BALANCE := :new.UNCOME_BUY_BALANCE; 
  oldrow.UNCOME_SELL_BALANCE := :old.UNCOME_SELL_BALANCE;
  newrow.UNCOME_SELL_BALANCE := :new.UNCOME_SELL_BALANCE; 
  oldrow.CORRECT_BALANCE := :old.CORRECT_BALANCE;
  newrow.CORRECT_BALANCE := :new.CORRECT_BALANCE; 
  oldrow.REAL_BALANCE := :old.REAL_BALANCE;
  newrow.REAL_BALANCE := :new.REAL_BALANCE; 
  oldrow.POST_BALANCE := :old.POST_BALANCE;
  newrow.POST_BALANCE := :new.POST_BALANCE; 
  oldrow.POST_AMOUNT := :old.POST_AMOUNT;
  newrow.POST_AMOUNT := :new.POST_AMOUNT; 
  oldrow.STOCK_INTEREST := :old.STOCK_INTEREST;
  newrow.STOCK_INTEREST := :new.STOCK_INTEREST; 
  oldrow.STOCK_INTERESTX := :old.STOCK_INTERESTX;
  newrow.STOCK_INTERESTX := :new.STOCK_INTERESTX; 
  oldrow.PROFIT := :old.PROFIT;
  newrow.PROFIT := :new.PROFIT; 
  oldrow.DATE_BACK := :old.DATE_BACK;
  newrow.DATE_BACK := :new.DATE_BACK; 
  oldrow.DEFAULT_BRANCH := :old.DEFAULT_BRANCH;
  newrow.DEFAULT_BRANCH := :new.DEFAULT_BRANCH; 
  oldrow.DEFAULT_ACCOUNT := :old.DEFAULT_ACCOUNT;
  newrow.DEFAULT_ACCOUNT := :new.DEFAULT_ACCOUNT; 
  oldrow.SET_SEAT_NO := :old.SET_SEAT_NO;
  newrow.SET_SEAT_NO := :new.SET_SEAT_NO; 
  oldrow.REAL_STATUS := :old.REAL_STATUS;
  newrow.REAL_STATUS := :new.REAL_STATUS; 
  oldrow.MATCH_STATUS := :old.MATCH_STATUS;
  newrow.MATCH_STATUS := :new.MATCH_STATUS; 
  oldrow.REMARK := :old.REMARK;
  newrow.REMARK := :new.REMARK; 
  oldrow.BUSINESS_ID := :old.BUSINESS_ID;
  newrow.BUSINESS_ID := :new.BUSINESS_ID; 
  oldrow.REPORT_NO := :old.REPORT_NO;
  newrow.REPORT_NO := :new.REPORT_NO; 
  oldrow.ORDER_ID := :old.ORDER_ID;
  newrow.ORDER_ID := :new.ORDER_ID; 
    oldrow.TABLENAME := 'SQUAREPRECLEAR';
    newrow.TABLENAME := 'SQUAREPRECLEAR';
    oldrow.MARKET_AMOUNT := :old.occur_amount+:old.correct_amount;
    newrow.MARKET_AMOUNT := :new.occur_amount+:new.correct_amount;
    oldrow.ENABLE_AMOUNT := :old.clear_balance+:old.correct_balance;
    newrow.ENABLE_AMOUNT := :new.clear_balance+:new.correct_balance;
    oldrow.MARKET_BALANCE := :old.occur_amount+:old.unfrozen_amount-:old.frozen_amount;
    newrow.MARKET_BALANCE := :new.occur_amount+:new.unfrozen_amount-:new.frozen_amount;
    oldrow.ENABLE_BALANCE := :old.clear_balance+:old.unfrozen_balance-:old.frozen_balance;
    newrow.ENABLE_BALANCE := :new.clear_balance+:new.unfrozen_balance-:new.frozen_balance;
  case
           when INSERTING then
                insert into ESQUAREPRECLEAR values newrow;
           when deleting then
                delete ESQUAREPRECLEAR where SERIAL_NO = :old.SERIAL_NO AND INIT_DATE = :old.INIT_DATE;
           when updating then
                v_sql:='UPDATE ESQUAREPRECLEAR set ';
          IF newrow.INIT_DATE<> oldrow.INIT_DATE then
              v_sql:=v_sql||'INIT_DATE = newrow.INIT_DATE,';
          END IF;
          IF newrow.SERIAL_NO<> oldrow.SERIAL_NO then
              v_sql:=v_sql||'SERIAL_NO = newrow.SERIAL_NO,';
          END IF;
          IF newrow.CURR_TIME<> oldrow.CURR_TIME then
              v_sql:=v_sql||'CURR_TIME = newrow.CURR_TIME,';
          END IF;
          IF newrow.BRANCH_NO<> oldrow.BRANCH_NO then
              v_sql:=v_sql||'BRANCH_NO = newrow.BRANCH_NO,';
          END IF;
          IF newrow.BUSINESS_FLAG<> oldrow.BUSINESS_FLAG then
              v_sql:=v_sql||'BUSINESS_FLAG = newrow.BUSINESS_FLAG,';
          END IF;
          IF newrow.FILE_KIND<> oldrow.FILE_KIND then
              v_sql:=v_sql||'FILE_KIND = newrow.FILE_KIND,';
          END IF;
          IF newrow.FILE_TYPE<> oldrow.FILE_TYPE then
              v_sql:=v_sql||'FILE_TYPE = newrow.FILE_TYPE,';
          END IF;
          IF newrow.FUND_ACCOUNT<> oldrow.FUND_ACCOUNT then
              v_sql:=v_sql||'FUND_ACCOUNT = newrow.FUND_ACCOUNT,';
          END IF;
          IF newrow.EXCHANGE_TYPE<> oldrow.EXCHANGE_TYPE then
              v_sql:=v_sql||'EXCHANGE_TYPE = newrow.EXCHANGE_TYPE,';
          END IF;
          IF newrow.STOCK_ACCOUNT<> oldrow.STOCK_ACCOUNT then
              v_sql:=v_sql||'STOCK_ACCOUNT = newrow.STOCK_ACCOUNT,';
          END IF;
          IF newrow.REPORT_ACCOUNT<> oldrow.REPORT_ACCOUNT then
              v_sql:=v_sql||'REPORT_ACCOUNT = newrow.REPORT_ACCOUNT,';
          END IF;
          IF newrow.STOCK_CODE<> oldrow.STOCK_CODE then
              v_sql:=v_sql||'STOCK_CODE = newrow.STOCK_CODE,';
          END IF;
          IF newrow.MONEY_TYPE<> oldrow.MONEY_TYPE then
              v_sql:=v_sql||'MONEY_TYPE = newrow.MONEY_TYPE,';
          END IF;
          IF newrow.STOCK_TYPE<> oldrow.STOCK_TYPE then
              v_sql:=v_sql||'STOCK_TYPE = newrow.STOCK_TYPE,';
          END IF;
          IF newrow.STOCK_NAME<> oldrow.STOCK_NAME then
              v_sql:=v_sql||'STOCK_NAME = newrow.STOCK_NAME,';
          END IF;
          IF newrow.STORE_UNIT<> oldrow.STORE_UNIT then
              v_sql:=v_sql||'STORE_UNIT = newrow.STORE_UNIT,';
          END IF;
          IF newrow.FROZEN_CODE<> oldrow.FROZEN_CODE then
              v_sql:=v_sql||'FROZEN_CODE = newrow.FROZEN_CODE,';
          END IF;
          IF newrow.ENTRUST_BS<> oldrow.ENTRUST_BS then
              v_sql:=v_sql||'ENTRUST_BS = newrow.ENTRUST_BS,';
          END IF;
          IF newrow.ENTRUST_WAY<> oldrow.ENTRUST_WAY then
              v_sql:=v_sql||'ENTRUST_WAY = newrow.ENTRUST_WAY,';
          END IF;
          IF newrow.ENTRUST_TYPE<> oldrow.ENTRUST_TYPE then
              v_sql:=v_sql||'ENTRUST_TYPE = newrow.ENTRUST_TYPE,';
          END IF;
          IF newrow.FARE_KIND_STR<> oldrow.FARE_KIND_STR then
              v_sql:=v_sql||'FARE_KIND_STR = newrow.FARE_KIND_STR,';
          END IF;
          IF newrow.FARE_KIND<> oldrow.FARE_KIND then
              v_sql:=v_sql||'FARE_KIND = newrow.FARE_KIND,';
          END IF;
          IF newrow.ROOM_CODE<> oldrow.ROOM_CODE then
              v_sql:=v_sql||'ROOM_CODE = newrow.ROOM_CODE,';
          END IF;
          IF newrow.SEAT_NO<> oldrow.SEAT_NO then
              v_sql:=v_sql||'SEAT_NO = newrow.SEAT_NO,';
          END IF;
          IF newrow.ENTRUST_NO<> oldrow.ENTRUST_NO then
              v_sql:=v_sql||'ENTRUST_NO = newrow.ENTRUST_NO,';
          END IF;
          IF newrow.ENTRUST_DATE<> oldrow.ENTRUST_DATE then
              v_sql:=v_sql||'ENTRUST_DATE = newrow.ENTRUST_DATE,';
          END IF;
          IF newrow.BUSINESS_NO<> oldrow.BUSINESS_NO then
              v_sql:=v_sql||'BUSINESS_NO = newrow.BUSINESS_NO,';
          END IF;
          IF newrow.BUSINESS_TYPE<> oldrow.BUSINESS_TYPE then
              v_sql:=v_sql||'BUSINESS_TYPE = newrow.BUSINESS_TYPE,';
          END IF;
          IF newrow.BUSINESS_PRICE<> oldrow.BUSINESS_PRICE then
              v_sql:=v_sql||'BUSINESS_PRICE = newrow.BUSINESS_PRICE,';
          END IF;
          IF newrow.BUSINESS_BALANCE<> oldrow.BUSINESS_BALANCE then
              v_sql:=v_sql||'BUSINESS_BALANCE = newrow.BUSINESS_BALANCE,';
          END IF;
          IF newrow.REPORT_TIME<> oldrow.REPORT_TIME then
              v_sql:=v_sql||'REPORT_TIME = newrow.REPORT_TIME,';
          END IF;
          IF newrow.BUSINESS_TIME<> oldrow.BUSINESS_TIME then
              v_sql:=v_sql||'BUSINESS_TIME = newrow.BUSINESS_TIME,';
          END IF;
          IF newrow.BUSINESS_TIMES<> oldrow.BUSINESS_TIMES then
              v_sql:=v_sql||'BUSINESS_TIMES = newrow.BUSINESS_TIMES,';
          END IF;
          IF newrow.FARE0<> oldrow.FARE0 then
              v_sql:=v_sql||'FARE0 = newrow.FARE0,';
          END IF;
          IF newrow.FARE1<> oldrow.FARE1 then
              v_sql:=v_sql||'FARE1 = newrow.FARE1,';
          END IF;
          IF newrow.FARE2<> oldrow.FARE2 then
              v_sql:=v_sql||'FARE2 = newrow.FARE2,';
          END IF;
          IF newrow.FARE3<> oldrow.FARE3 then
              v_sql:=v_sql||'FARE3 = newrow.FARE3,';
          END IF;
          IF newrow.FAREX<> oldrow.FAREX then
              v_sql:=v_sql||'FAREX = newrow.FAREX,';
          END IF;
          IF newrow.FARE_REMARK<> oldrow.FARE_REMARK then
              v_sql:=v_sql||'FARE_REMARK = newrow.FARE_REMARK,';
          END IF;
          IF newrow.STANDARD_FARE0<> oldrow.STANDARD_FARE0 then
              v_sql:=v_sql||'STANDARD_FARE0 = newrow.STANDARD_FARE0,';
          END IF;
          IF newrow.EXCHANGE_FARE0<> oldrow.EXCHANGE_FARE0 then
              v_sql:=v_sql||'EXCHANGE_FARE0 = newrow.EXCHANGE_FARE0,';
          END IF;
          IF newrow.EXCHANGE_FARE1<> oldrow.EXCHANGE_FARE1 then
              v_sql:=v_sql||'EXCHANGE_FARE1 = newrow.EXCHANGE_FARE1,';
          END IF;
          IF newrow.EXCHANGE_FARE2<> oldrow.EXCHANGE_FARE2 then
              v_sql:=v_sql||'EXCHANGE_FARE2 = newrow.EXCHANGE_FARE2,';
          END IF;
          IF newrow.EXCHANGE_FARE3<> oldrow.EXCHANGE_FARE3 then
              v_sql:=v_sql||'EXCHANGE_FARE3 = newrow.EXCHANGE_FARE3,';
          END IF;
          IF newrow.EXCHANGE_FARE4<> oldrow.EXCHANGE_FARE4 then
              v_sql:=v_sql||'EXCHANGE_FARE4 = newrow.EXCHANGE_FARE4,';
          END IF;
          IF newrow.EXCHANGE_FARE5<> oldrow.EXCHANGE_FARE5 then
              v_sql:=v_sql||'EXCHANGE_FARE5 = newrow.EXCHANGE_FARE5,';
          END IF;
          IF newrow.EXCHANGE_FARE6<> oldrow.EXCHANGE_FARE6 then
              v_sql:=v_sql||'EXCHANGE_FARE6 = newrow.EXCHANGE_FARE6,';
          END IF;
          IF newrow.EXCHANGE_FAREX<> oldrow.EXCHANGE_FAREX then
              v_sql:=v_sql||'EXCHANGE_FAREX = newrow.EXCHANGE_FAREX,';
          END IF;
          IF newrow.EXCHANGE_FARE<> oldrow.EXCHANGE_FARE then
              v_sql:=v_sql||'EXCHANGE_FARE = newrow.EXCHANGE_FARE,';
          END IF;
          IF newrow.REBATE_BALANCE<> oldrow.REBATE_BALANCE then
              v_sql:=v_sql||'REBATE_BALANCE = newrow.REBATE_BALANCE,';
          END IF;
          IF newrow.BROKERAGE<> oldrow.BROKERAGE then
              v_sql:=v_sql||'BROKERAGE = newrow.BROKERAGE,';
          END IF;
          IF newrow.ENTRUST_AMOUNT<> oldrow.ENTRUST_AMOUNT then
              v_sql:=v_sql||'ENTRUST_AMOUNT = newrow.ENTRUST_AMOUNT,';
          END IF;
          IF newrow.BUSINESS_AMOUNT<> oldrow.BUSINESS_AMOUNT then
              v_sql:=v_sql||'BUSINESS_AMOUNT = newrow.BUSINESS_AMOUNT,';
          END IF;
          IF newrow.OCCUR_AMOUNT<> oldrow.OCCUR_AMOUNT then
              v_sql:=v_sql||'OCCUR_AMOUNT = newrow.OCCUR_AMOUNT,';
          END IF;
          IF newrow.FROZEN_AMOUNT<> oldrow.FROZEN_AMOUNT then
              v_sql:=v_sql||'FROZEN_AMOUNT = newrow.FROZEN_AMOUNT,';
          END IF;
          IF newrow.UNFROZEN_AMOUNT<> oldrow.UNFROZEN_AMOUNT then
              v_sql:=v_sql||'UNFROZEN_AMOUNT = newrow.UNFROZEN_AMOUNT,';
          END IF;
          IF newrow.UNCOME_BUY_AMOUNT<> oldrow.UNCOME_BUY_AMOUNT then
              v_sql:=v_sql||'UNCOME_BUY_AMOUNT = newrow.UNCOME_BUY_AMOUNT,';
          END IF;
          IF newrow.UNCOME_SELL_AMOUNT<> oldrow.UNCOME_SELL_AMOUNT then
              v_sql:=v_sql||'UNCOME_SELL_AMOUNT = newrow.UNCOME_SELL_AMOUNT,';
          END IF;
          IF newrow.CORRECT_AMOUNT<> oldrow.CORRECT_AMOUNT then
              v_sql:=v_sql||'CORRECT_AMOUNT = newrow.CORRECT_AMOUNT,';
          END IF;
          IF newrow.REAL_AMOUNT<> oldrow.REAL_AMOUNT then
              v_sql:=v_sql||'REAL_AMOUNT = newrow.REAL_AMOUNT,';
          END IF;
          IF newrow.CLEAR_BALANCE<> oldrow.CLEAR_BALANCE then
              v_sql:=v_sql||'CLEAR_BALANCE = newrow.CLEAR_BALANCE,';
          END IF;
          IF newrow.FROZEN_BALANCE<> oldrow.FROZEN_BALANCE then
              v_sql:=v_sql||'FROZEN_BALANCE = newrow.FROZEN_BALANCE,';
          END IF;
          IF newrow.UNFROZEN_BALANCE<> oldrow.UNFROZEN_BALANCE then
              v_sql:=v_sql||'UNFROZEN_BALANCE = newrow.UNFROZEN_BALANCE,';
          END IF;
          IF newrow.UNCOME_BUY_BALANCE<> oldrow.UNCOME_BUY_BALANCE then
              v_sql:=v_sql||'UNCOME_BUY_BALANCE = newrow.UNCOME_BUY_BALANCE,';
          END IF;
          IF newrow.UNCOME_SELL_BALANCE<> oldrow.UNCOME_SELL_BALANCE then
              v_sql:=v_sql||'UNCOME_SELL_BALANCE = newrow.UNCOME_SELL_BALANCE,';
          END IF;
          IF newrow.CORRECT_BALANCE<> oldrow.CORRECT_BALANCE then
              v_sql:=v_sql||'CORRECT_BALANCE = newrow.CORRECT_BALANCE,';
          END IF;
          IF newrow.REAL_BALANCE<> oldrow.REAL_BALANCE then
              v_sql:=v_sql||'REAL_BALANCE = newrow.REAL_BALANCE,';
          END IF;
          IF newrow.POST_BALANCE<> oldrow.POST_BALANCE then
              v_sql:=v_sql||'POST_BALANCE = newrow.POST_BALANCE,';
          END IF;
          IF newrow.POST_AMOUNT<> oldrow.POST_AMOUNT then
              v_sql:=v_sql||'POST_AMOUNT = newrow.POST_AMOUNT,';
          END IF;
          IF newrow.STOCK_INTEREST<> oldrow.STOCK_INTEREST then
              v_sql:=v_sql||'STOCK_INTEREST = newrow.STOCK_INTEREST,';
          END IF;
          IF newrow.STOCK_INTERESTX<> oldrow.STOCK_INTERESTX then
              v_sql:=v_sql||'STOCK_INTERESTX = newrow.STOCK_INTERESTX,';
          END IF;
          IF newrow.PROFIT<> oldrow.PROFIT then
              v_sql:=v_sql||'PROFIT = newrow.PROFIT,';
          END IF;
          IF newrow.DATE_BACK<> oldrow.DATE_BACK then
              v_sql:=v_sql||'DATE_BACK = newrow.DATE_BACK,';
          END IF;
          IF newrow.DEFAULT_BRANCH<> oldrow.DEFAULT_BRANCH then
              v_sql:=v_sql||'DEFAULT_BRANCH = newrow.DEFAULT_BRANCH,';
          END IF;
          IF newrow.DEFAULT_ACCOUNT<> oldrow.DEFAULT_ACCOUNT then
              v_sql:=v_sql||'DEFAULT_ACCOUNT = newrow.DEFAULT_ACCOUNT,';
          END IF;
          IF newrow.SET_SEAT_NO<> oldrow.SET_SEAT_NO then
              v_sql:=v_sql||'SET_SEAT_NO = newrow.SET_SEAT_NO,';
          END IF;
          IF newrow.REAL_STATUS<> oldrow.REAL_STATUS then
              v_sql:=v_sql||'REAL_STATUS = newrow.REAL_STATUS,';
          END IF;
          IF newrow.MATCH_STATUS<> oldrow.MATCH_STATUS then
              v_sql:=v_sql||'MATCH_STATUS = newrow.MATCH_STATUS,';
          END IF;
          IF newrow.REMARK<> oldrow.REMARK then
              v_sql:=v_sql||'REMARK = newrow.REMARK,';
          END IF;
          IF newrow.BUSINESS_ID<> oldrow.BUSINESS_ID then
              v_sql:=v_sql||'BUSINESS_ID = newrow.BUSINESS_ID,';
          END IF;
          IF newrow.REPORT_NO<> oldrow.REPORT_NO then
              v_sql:=v_sql||'REPORT_NO = newrow.REPORT_NO,';
          END IF;
          IF newrow.ORDER_ID<> oldrow.ORDER_ID then
              v_sql:=v_sql||'ORDER_ID = newrow.ORDER_ID,';
          END IF;
          IF newrow.TABLENAME<> oldrow.TABLENAME then
              v_sql:=v_sql||'TABLENAME = newrow.TABLENAME,';
          END IF;
          IF newrow.MARKET_AMOUNT<> oldrow.MARKET_AMOUNT then
              v_sql:=v_sql||'MARKET_AMOUNT = newrow.MARKET_AMOUNT,';
          END IF;
          IF newrow.ENABLE_AMOUNT<> oldrow.ENABLE_AMOUNT then
              v_sql:=v_sql||'ENABLE_AMOUNT = newrow.ENABLE_AMOUNT,';
          END IF;
          IF newrow.MARKET_BALANCE<> oldrow.MARKET_BALANCE then
              v_sql:=v_sql||'MARKET_BALANCE = newrow.MARKET_BALANCE,';
          END IF;
          IF newrow.ENABLE_BALANCE<> oldrow.ENABLE_BALANCE then
              v_sql:=v_sql||'ENABLE_BALANCE = newrow.ENABLE_BALANCE';
          END IF;
--          dbms_output.put_line(v_sql);
--          execute IMMEDIATE v_sql;
            v_sql:=v_sql||v_where||';';
            insert into hztmp values(v_sql);

  end case;
  
END TRSQUAREPRECLEAR;
