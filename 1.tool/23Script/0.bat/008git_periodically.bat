echo off
::echo %1
if "%1"=="" (
	cd /D %MYHOME%
	git pull
) else (
	if exist "%1" (
		cd /D %1
		git pull
	)
echo else
)
pause