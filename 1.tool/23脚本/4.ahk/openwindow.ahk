;;打开窗体
<<<<<<< HEAD
;^!2::
;	run "%MYHOME%9CommonFolder\Trade"
;	run "%MYHOME%9CommonFolder\Trade\Biz"
;return
;;^!A是QQ截图
=======
!A::run "%MYHOME%1.tool\23脚本\4.ahk"
;;^!S::run "C:\Users\80510\AppData\Local\lxss\home\hzgood\workspace"
^!2::
	run "G:\source\start\9CommonFolder\Trade"
	run "G:\source\start\9CommonFolder\Trade\Biz"
return
>>>>>>> remotes/origin/hswork
^!3::
	run "%MYHOME%2.work\2.恒生测试工作夹\1测试日志\3递交包下载"
return
^!B::
	run %USERPROFILE%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Bash on Ubuntu on Windows.lnk
	;;run C:\Users\80510\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Bash on Ubuntu on Windows.lnk
return
^!C::
	run "%MYHOME%9CommonFolder"
return
^!P::
	run,http://pm.hundsun.com
return
^!S::
	run "%USERPROFILE%\AppData\Local\lxss\home\hzgood\workspace"
return
;;!A::run "%MYHOME%1.tool\23脚本\4.ahk"
^!T::
	run,http://ts.hundsun.com
	;;run,http://pm.hundsun.com
return


;;!R::run *RunAs I:\win10初始化\0.初始软件集\readme.bat
;;!R::run %MYHOME%1.tool\23脚本\1.vbs
!R::run bash %MYHOME%1.tool\23脚本\2.shell\004test.bash
;;打开网址

;;执行程序
^!$F1::
	run,%MYHOME%9CommonFolder\SQL_PDC.vbs.lnk
return
^!$F2::
	run,%MYHOME%9CommonFolder\18.exe.lnk
return
^!$F3::
	;;run,E:\hstrade20\Documents\D3.Testing\05-UF20测试工具开发\CodeToolUI\CodeToolUI.jar
	run,E:\05-UF20测试工具开发\CodeToolUI\
return
^!$F10::
	run,%MYHOME%9CommonFolder\初始化脚本\sysinit_Auto.bat
return
^!F::
	run,C:\Program Files\Mythicsoft\FileLocator Lite\FileLocatorLite.exe
return
<<<<<<< HEAD
;;Bash Ubuntu

^!E::run C:\Program Files\Everything\Everything.exe
;^!Q::run "C:\Program Files\WindowsApps\903DB504.QQ_5.3.1258.0_x86__a99ra4d2cbcxa"

=======
::--::--hzremark 
::qt::经纪业务运营平台V20_日终清算_其他类.xlsx
;;::其他::经纪业务运营平台V20_日终清算_其他类.xlsx
::dz::经纪业务运营平台V20_交割对账.xlsx
::cg::经纪业务运营平台V20_日终清算_存管日终.xlsx
::pyenv::
	Send,{#}{!}/usr/bin/env python3
	Send,{ENTER}
	Send,{#} -*- coding: utf-8 -*-
return
::vbsusr::
	Send,set fso = createobject("scripting.filesystemobject"){ENTER}
	Send,set ws = createobject("wscript.shell"){ENTER}
	Send,vbsname=WScript.ScriptName{ENTER}
	Send,vbsname=left(vbsname,len(vbsname)-4){ENTER}
	Send,usr=fso.GetFile(Wscript.ScriptFullName).ParentFolder.Path&"\"&vbsname&"_usr\"{ENTER}
	Send,{ENTER}
	Send,'ws.run usr&strline{ENTER}
return
::wsobj::set ws=createobject("WSCRIPT.SHELL"){ENTER}
::fsobj::set fso=createobject("Scripting.FileSystemObject"){ENTER}
::wsEnv::ws.ExpandEnvironmentStrings("%%")
::vbsarg::
	Send,Set unNamedArguments = WScript.Arguments.UnNamed{ENTER}
	Send,if unNamedArguments.count =2 then{ENTER}
	Send,{tab}unNamedArguments.Item(0){ENTER}
	Send,end if{ENTER}
return
::MSP::%MYSCRIPTPATH%
::MSH::%MYSCRIPTHOME%
::HOME::%MYHOME%
>>>>>>> remotes/origin/hswork
