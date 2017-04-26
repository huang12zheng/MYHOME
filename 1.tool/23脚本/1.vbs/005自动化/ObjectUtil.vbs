'''''''''''''''''''''''''''''''''''''存在判断''''''''''''''''''''''''''''''''''''''
'检查对象是否存在
Function objExistFlag(object)
	If object is nothing Then
		objExistFlag=FALSE
		Exit Function
	End If
	If object.Exist(3) Then
		objExistFlag=TRUE
	else
		objExistFlag=FALSE
	End If
End function
Function objExistMsg(object)
	If object.Exist Then
		'msgbox "Exist"
	else
		msgbox "Not Exist"
		ExitRun()
	End If
End function

'''''''''''''''''''''''''''''''''''''''窗体'''''''''''''''''''''''''''''''''''''''
'对象窗体及子窗体获取
Function getforms(systemName)
	'set forms=Window("regexpwndtitle:="&".*"&systemName&".*")
	set forms=HZ_GetMainWinObject(".*"&systemName&".*","TMainForm","")
	forms.Activate
	environment("forms")=forms
End Function
Function getsubforms(forms,subformname)
	set subforms=HZ_GetSubWinObject(forms,subformname,"TLayoutForm","frmGeneralReport")'set subforms=HZ_GetSubWinObject(forms,"通用报表","TLayoutForm","frmGeneralReport")
	subforms.Activate		'这里一定要激活,why?
	environment("subforms")=subforms
End Function
'多种方法获取对象'坑
Function HZ_GetMainWinObject(text,wclass,hsclass)
	'text,hsclass,(text,hsclass),hwnd
	Set object=nothing
	If not objExistFlag(object) and not text = "" Then
		set object=window("text:="&text)
	End if
	If not objExistFlag(object) and not hsclass = "" Then
		set object=window("HSNAME:="&hsclass)
	End if
	If not objExistFlag(object) and not wclass = "" Then
		set object=window("regexpwndclass:="&wclass)
	End if
	If not objExistFlag(object) and not text = "" Then
		set object=window("regexpwndtitle:="&text&".*")
	End if
	If not objExistFlag(object) and not text = "" and not wclass = "" Then
		set object=window("text:="&text,"regexpwndclass:="&wclass)'不是hsclass
	End if
	If not objExistFlag(object) and not text = "" and not wclass = "" Then
		set object=window("regexpwndtitle:="&text,"regexpwndclass:="&wclass)
	End if
	If not objExistFlag(object) and not text = "" Then
		set object=window("hwnd:="&text)
	End if
	set HZ_GetMainWinObject=object
End Function

Function HZ_GetSubWinObject(pobject,text,wclass,hsclass)
	'text,hsclass,(text,hsclass),hwnd
	Set object=nothing
	If not objExistFlag(object) and not text = "" Then
		set object=pobject.window("text:="&text)
	End if
	If not objExistFlag(object) and not hsclass = "" Then
		set object=pobject.window("HSNAME:="&hsclass)
	End if
	If not objExistFlag(object) and not wclass = "" Then
		set object=pobject.window("regexpwndclass:="&hsclass)
	End if
	If not objExistFlag(object) and not text = "" Then
		set object=pobject.window("regexpwndtitle:="&text&".*")
	End if
	If not objExistFlag(object) and not text = "" and not wclass = "" Then
		set object=pobject.window("text:="&text,"regexpwndclass:="&wclass)'不是hsclass
	End if
	If not objExistFlag(object) and not text = "" and not wclass = "" Then
		set object=pobject.window("regexpwndtitle:="&text,"regexpwndclass:="&wclass)
	End if
	If not objExistFlag(object) and not text = "" Then
		set object=pobject.window("hwnd:="&text)
	End if
	set HZ_GetSubWinObject=object	
End Function
Function AS_GetControl_Edit1001(subforms,Icon_name)
	set AS_GetControl_Edit1001=subforms.WinEdit("HSNAME:="&Icon_name&".Edit1001") 'cbbKey,fund_account
End function
Function HZ_SendMessage(WinName, hwnd, Msg)
'call SendMessage(39065606, 12, 0, "0-券商,22,111,31,4-券商")
'call SendMessageQDII(subforms, "HSNAME:=kdkddkk", "7,8,B")
    Dim hHandle, rc, HsNameStr
    
    WinName.Activate
	rc = SendMessage(hwnd, 12, 0, Msg)
    HZ_SendMessage = rc
End Function

'''''''''''''''''''''''''辅助类'''''''''''''''''''''''''''''''''''''
Function AS_setControl_Edit1001(object,input)
	'使用复制粘贴的选项进行操作
	setClipboard(input)
	object.Set ""
	object.Type micLCtrlDwn+"V"
	object.Type micLCtrlUp
End Function
Function AS_checkControl_Edit1001(object,input)
	AS_checkControl_Edit1001=object.CheckProperty("regexpwndtitle",input,1000)
End Function
Function AS_checkwindow_IsOpen(windowname)
	set form=Window("Text:=" &windowname)
	if form.Exist(1)=true then
		AS_checkwindow_IsOpen=0
	else
		AS_checkwindow_IsOpen=-1
	End if
End Function
Function AS_setControl_heddate(object,input)
	print "start AS_setControl_heddate"
	print "hwnd:="&object.GetROProperty("hwnd")
	Dim count:count=10
	Do
		
		
		count = count -1 
		If count=0 Then
			Exit do
		End If
	Loop until object.CheckProperty("regexpwndtitle",input,1000)
	print "end   AS_setControl_heddate"
	if count = 0 then
		AS_setControl_heddate = -1
	else
		AS_setControl_heddate = 0
	End if 
End Function
Function setStandDate(idate)
	flag1=mid(idate,5,1)
	flag2=mid(idate,8,1)
	flag3=Right(idate,1)
	If (flag1="-" and flag2="-" and flag3="-") Then
		setStandDate=idate
		Exit function
	End If
	If (flag1="-" and flag2="-") Then
		setStandDate=idate&"-"
		Exit function
	End If
	setStandDate=left(idate,4)&"-"&Mid(idate,5,2)&"-"&Right(idate,2)&"-"'20170321
End Function
'检查
function msggenreportobject(iobject)
	if not(IsEmpty(iobject.key1))	then
		msgbox iobject.key1
	end if
	if not(IsEmpty(iobject.key2)) then
		msgbox iobject.key2
	end if
end function

'设置数据字典



'后台变量与前台控件的映射关第

'此类型用于,描述有关系的两个变量
Class rekey
    Dim key1,key2
End Class
Function setControl(subforms,HSNAME,input)'有用到subforms
	subforms.activate
	'20170322 支持fund_account
	'set object=subforms.WinEdit("HSNAME:="&"pnlConditions."&HSNAME)
	input=resetval(input)
	If (HSNAME = "hed_date" or HSNAME = "hed_begin_date" or HSNAME = "hed_end_date")Then
		Set WshShell = CreateObject("WScript.Shell") 
		WshShell.SendKeys "{ENTER}"
		WshShell.SendKeys "{ENTER}"
		call setdateCon(subforms,HSNAME,input)
		Exit function
	End If
	set object=getConObject(subforms,HSNAME)
	If (object.exist(1)) Then
		print "	"&HSNAME&"	"&object.GetROProperty("hwnd")&"	"&object.GetROProperty("text")&"	"&input
		call setCon(object,HSNAME,object.GetROProperty("hwnd"),input)
	else
		print "	#"&HSNAME
	End If
End Function
Function getConObject(subforms,Icon_name)
	set object=nothing
	If (Icon_name="hed_fund_account") Then
		'set object=subforms.WinEdit("HSNAME:="&"hed_fund_account.Edit1001")
		set object=AS_GetControl_Edit1001(subforms,Icon_name)
	else
		set object=subforms.WinEdit("HSNAME:="&"pnlConditions."&Icon_name)
	End If
	set getConObject=object
End function