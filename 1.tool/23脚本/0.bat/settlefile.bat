rem @echo off
set source=%cd%
set myworkspace=%cd%
cd %source%
rem set source=C:\Users\Administrator\Desktop\testworkspace
cd %source%\testworkspace
set vdate=%date:~0,4%%date:~5,2%%date:~8,2%
cd %vdate%
rem pause
set foldertable=dll so sql settlefile case

for %%i in (%foldertable%)  do (
echo %%i
if exist %%i (
	echo "it is exist"
) else (
echo "creat folder"
md %%i
)
)
cd case
::del /q/s %cd%\init.pdc
set text=--@E:\hstrade20\trunk\Documents\D3.Testing\04自动化脚本\04自动化脚本\UF2.0自动化案例资源\详细设计\初始脚本\公用基础数据\votelist注入.sql
echo %text%>%cd%\init.pdc

dir /o-d /b|findstr \.sql>mysqllist.txt
for /f %%i in (mysqllist.txt) do (
set text=@%cd%\%%i
:echo %text%>>%cd%\init.pdc
echo @%cd%\%%i>>%cd%\init.pdc
)


::set text=%cd%\case\

copy %myworkspace%\compare.csv %cd%
copy %myworkspace%\entrust.sql %cd%
::copy %myworkspace%\init.pdc %cd%\case

pause