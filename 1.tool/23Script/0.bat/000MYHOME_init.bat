echo off
set curpath=%~dp0
REM	I:\win10初始化\0.初始软件集\
::set "ParrenHOME=%curpath:win10初始化\0.初始软件集\=%"
set "ParrenHOME=%curpath:MYHOME\1.tool\23脚本\0.bat\=%"
set "MYHOME=%ParrenHOME%MYHOME\"
%~d0
cd %MYHOME%1.tool\23脚本\1.vbs
echo 访问脚本目录
pause
	::echo 设置主目录MYHOME,^%MYSCRIPTHOME^%环境变量
	echo 设置主目录MYHOME,%%MYSCRIPTHOME%%环境变量
		SetEnv.vbs "PATH" %%MYSCRIPTPATH%%
		::这个是通用%%的,不用修改.
		pause
		::需要重置
		SetEnv.vbs "MYHOME"
		SetEnv.vbs "MYHOME" %MYHOME%
		::2017年4月27日14:38:05 改为用%%MYHOME%%
		SetEnv.vbs "MYSCRIPTHOME"
		SetEnv.vbs "MYSCRIPTHOME" %%MYHOME%%1.tool\23脚本\
		::不需要mkdir了
		::mkdir %MYHOME%
	::echo 初始化主目录文件夹结构
		::pause
		::call folderCreate.bat %MYHOME%	这个可能是在同一线程里
		::start folderCreate.bat %MYHOME%
	echo 设置^%MYHOMESCRIPT^%环境变量
		REM 系统变量对已有的进程不起作用
		::2017年4月27日14:41:37 目前先设置为重置 
		SetEnv.vbs "MYSCRIPTPATH"
		set "MYSCRIPTHOME=%MYHOME%1.tool\23脚本\"
		SetEnv.vbs "MYSCRIPTPATH" %%MYSCRIPTHOME%%0.bat\
		SetEnv.vbs "MYSCRIPTPATH" "%%MYSCRIPTHOME%%1.vbs\"
		SetEnv.vbs "MYSCRIPTPATH" "%%MYSCRIPTHOME%%2.shell\"
		SetEnv.vbs "MYSCRIPTPATH" "%%MYSCRIPTHOME%%3.python\"
		SetEnv.vbs "MYSCRIPTPATH" "%%MYSCRIPTHOME%%4.ahk\"
		pause
			echo %MYHOME%
			echo %MYSCRIPTHOME%
			echo %MYSCRIPTPATH%
::%curpath%baiduyun\账号与密码.txt
pause