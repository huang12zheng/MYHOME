;;打开窗体
^!2::
	run "G:\source\start\9CommonFolder\Trade"
	run "G:\source\start\9CommonFolder\Trade\Biz"
return
^!3::
	run "G:\source\start\2.work\2.恒生测试工作夹\1测试日志\3.递交包下载"
return
^!C::
	run "G:\source\start\9CommonFolder"
return
;;打开网址
^!T::
	run,http://ts.hundsun.com
	run,http://pm.hundsun.com
return
^!P::
	run,http://pm.hundsun.com
return
;;执行程序
^!$F1::
	run,G:\source\start\9CommonFolder\SQL_PDC.vbs.lnk
return
^!$F2::
	run,G:\source\start\9CommonFolder\18.exe.lnk
return
^!$F3::
	;;run,E:\hstrade20\Documents\D3.Testing\05-UF20测试工具开发\CodeToolUI\CodeToolUI.jar
	run,E:\05-UF20测试工具开发\CodeToolUI\
return
^!$F10::
	run,G:\source\start\9CommonFolder\初始化脚本\sysinit_Auto.bat
return
::qt::经纪业务运营平台V20_日终清算_其他类.xlsx
;;::其他::经纪业务运营平台V20_日终清算_其他类.xlsx
::dz::经纪业务运营平台V20_交割对账.xlsx
::cg::经纪业务运营平台V20_日终清算_存管日终.xlsx