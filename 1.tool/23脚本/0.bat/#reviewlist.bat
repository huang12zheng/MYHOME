set folderpath=%MYHOME%4.review\tmp
cd /d %folderpath%
if not exist web mkdir web
for /f %%i in (#Catalogue.txt)	do	(
	set filename=%%i
	if not exist "%%i.txt" type nul > web\%%i_web.txt
	mkdir %%i
)
pause