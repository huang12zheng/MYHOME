set source=%cd%
set myworkspace=%cd%
d:
cd D:\递交包下载
del /s/q D:\递交包下载
pause
rem ------------------------------
d:
cd %source%
if exist testworkspace (
	echo "it is exist"
) else (
echo "creat folder"
md testworkspace
)
rem ------------------------------
cd testworkspace
set vdate=%date:~0,4%%date:~5,2%%date:~8,2%
rem 时期参数因系统设置而改变
rem set DAILYDIR=%cd%\%vdate%
if exist %vdate% (
	echo "it is exist"
) else (
echo "creat folder"
md %vdate%
)
rem ------------------------------
cd %vdate%
del /s/q *.*
::rd /s/q %cd%
pause