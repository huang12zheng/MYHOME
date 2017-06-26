::http://www.cnblogs.com/lostyue/archive/2011/10/24/2223166.html
set curpath=%~dp0
set usrpath=%curpath%005RunWhenStart_usr\
set RunList=%usrpath%RunList.txt
echo %curpath%
echo %usrpath%
for /F "tokens=1* delims=:" %%i in (%RunList%) do (
	echo %%i
	echo %%j)
	::schtasks /create /tn "%%i" /tr %%j /sc  ONLOGON
pause
::schtasks /create /tn "RunWhenStart" /tr G:\source\start\6.study\0.ѧϰAHK\openwindow.ahk /sc  ONLOGON
::chcp 437
::schtasks /query /v
::schtasks /query /v /FO CSV