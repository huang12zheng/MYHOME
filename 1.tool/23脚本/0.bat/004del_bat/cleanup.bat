set source=%cd%
set myworkspace=%cd%
d:
cd D:\�ݽ�������
del /s/q D:\�ݽ�������
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
rem ʱ�ڲ�����ϵͳ���ö��ı�
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