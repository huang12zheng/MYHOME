
Function openSubform
	openSubform=true
	'确保搜索框输入了期望的参数值
	openSubform=Strategy_RunScript("Strategy_setmenuMark")
	If openSubform=false Then
		Exit function
	End If
	'Set object=Window("regexpwndtitle:="&systemName).WinComboBox("regexpwndclass:=TRzComboBox")
	openSubform=Strategy_RunScript("Strategy_openmenuMark")

End function
Function openTab
	openTab=true
	'确保搜索框输入了期望的参数值
	openTab=Strategy_RunScript("Strategy_settabMark")
	If openTab=false Then
		Exit function
	End If
	
	set object=AS_GetControl_Edit1001(environment("subforms") ,"cbbKey")
	wait 1
	Set WshShell = CreateObject("WScript.Shell")  
'	wshShell.SendKeys "{ENTER}" 'not "ENTER"
'	wait 1
	wshShell.SendKeys "{ENTER}"

End function
public Function LS_openTybbByid(tabid)
'获取对象
	'Strategy_RunScript
	'set object=AS_getTybbIdObject()
	
'打开窗体
	call AS_opentybb(object,environment("tabid"))
End Function
Function AS_getTybbIdObject()'获取输入框(systemName,subformname是脚本全局变量)
	'set forms=Window("regexpwndtitle:="&".*"&systemName&".*")
	'forms.Activate
	'set subforms=HZ_GetSubWinObject(environment("forms"),environment(subformname),"TLayoutForm","frmGeneralReport")'set subforms=HZ_GetSubWinObject(forms,"通用报表","TLayoutForm","frmGeneralReport")
	'set object=environment("subforms").WinEdit("HSNAME:="&"cbbKey.Edit1001")
	Strategy_settabMark
	set AS_getTybbIdObject=object
End Function
Function AS_openTybb(object,tabid)'通过ID打开报表
	Set WshShell = CreateObject("WScript.Shell")  
	setClipboard(tabid)
	objExistMsg(object)
	object.set ""
'	object.click 20170322
	wait 1
	object.Type micLCtrlDwn+"V"  '不可以直接typetabid,会结果与预期不一致
	object.Type micLCtrlUp
	wshShell.SendKeys "{ENTER}"'not "ENTER"
	wait 1
	wshShell.SendKeys "{ENTER}"
End Function

'call LS_openTybbByid(tabid)