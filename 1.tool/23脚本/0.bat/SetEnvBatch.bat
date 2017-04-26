::echo off
REM for /?
for /f "delims=" %%i in (EnvironmentValue.ev)	do	(
	REM https://wenku.baidu.com/view/a7517e600b1c59eef8c7b485.html 字符串处理
	REM findstr /?	
	::set "ipos=findstr ":"	%%i"
	findstr ":"	%%i
	::echo %ipos%
)
pause