echo off
set curpath=%~dp0
REM	I:\win10��ʼ��\0.��ʼ�����\
::set "ParrenHOME=%curpath:win10��ʼ��\0.��ʼ�����\=%"
set "ParrenHOME=%curpath:MYHOME\1.tool\23�ű�\0.bat\=%"
set "MYHOME=%ParrenHOME%MYHOME\"
%~d0
cd %MYHOME%1.tool\23�ű�\1.vbs
echo ���ʽű�Ŀ¼
pause
	::echo ������Ŀ¼MYHOME,^%MYSCRIPTHOME^%��������
	echo ������Ŀ¼MYHOME,%%MYSCRIPTHOME%%��������
		SetEnv.vbs "PATH" %%MYSCRIPTPATH%%
		::�����ͨ��%%��,�����޸�.
		pause
		::��Ҫ����
		SetEnv.vbs "MYHOME"
		SetEnv.vbs "MYHOME" %MYHOME%
		::2017��4��27��14:38:05 ��Ϊ��%%MYHOME%%
		SetEnv.vbs "MYSCRIPTHOME"
		SetEnv.vbs "MYSCRIPTHOME" %%MYHOME%%1.tool\23�ű�\
		::����Ҫmkdir��
		::mkdir %MYHOME%
	::echo ��ʼ����Ŀ¼�ļ��нṹ
		::pause
		::call folderCreate.bat %MYHOME%	�����������ͬһ�߳���
		::start folderCreate.bat %MYHOME%
	echo ����^%MYHOMESCRIPT^%��������
		REM ϵͳ���������еĽ��̲�������
		::2017��4��27��14:41:37 Ŀǰ������Ϊ���� 
		SetEnv.vbs "MYSCRIPTPATH"
		set "MYSCRIPTHOME=%MYHOME%1.tool\23�ű�\"
		SetEnv.vbs "MYSCRIPTPATH" %%MYSCRIPTHOME%%0.bat\
		SetEnv.vbs "MYSCRIPTPATH" "%%MYSCRIPTHOME%%1.vbs\"
		SetEnv.vbs "MYSCRIPTPATH" "%%MYSCRIPTHOME%%2.shell\"
		SetEnv.vbs "MYSCRIPTPATH" "%%MYSCRIPTHOME%%3.python\"
		SetEnv.vbs "MYSCRIPTPATH" "%%MYSCRIPTHOME%%4.ahk\"
		pause
			echo %MYHOME%
			echo %MYSCRIPTHOME%
			echo %MYSCRIPTPATH%
::%curpath%baiduyun\�˺�������.txt
pause