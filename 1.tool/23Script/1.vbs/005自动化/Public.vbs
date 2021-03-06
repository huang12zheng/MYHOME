Public function Test(ScriptName,InputData,UIExcept)

   array_row = split(InputData, "|")
   ARRAY_INPUTNAME.RemoveAll
    For i=0 to UBound(array_row) 
  			array_col = split(array_row(i), "=")
			If ubound(array_col) = 0 Then
				  call ARRAY_INPUTNAME.Add("var"&cstr(i+1),array_col(1))
			else
				  call ARRAY_INPUTNAME.Add(array_col(0),array_col(1))
			End If
			
  	Next

	ARRAY_UIEXPECT = split (UIExcept,";")
    NUM_UIEXPECT = UBound(ARRAY_UIEXPECT)+1

	script = " temp_Result = " & ScriptName
		   
   execute script

End Function

public function ExecuteScript(ScriptName)
	On error resume next
	call SetExceptHandle("CloseAll")
	Dim temp_Result
	Dim SaveFilePath
	CURRENT_OBJECTNAME = ""
	script = " temp_Result = " & ScriptName
	execute script
	If ARRAY_ERROR.Item("错误信息") <> "" Then
		Err.Description = ARRAY_ERROR.Item("错误信息")
	End If
	If ARRAY_ERROR.Item("错误号") <> "" Then
		Err.Number = cint(ARRAY_ERROR.Item("错误号"))
	End If
	If ARRAY_ERROR.Item("函数") <> "" Then
		Err.source  = ARRAY_ERROR.Item("函数")
	End If
	
	ARRAY_ERROR.Removeall

	If Err.Number <> 0 Then				  
		If (instr(Err.Description, "PASS") > 0) Then
			temp_Result = Err.Description
		else
			If Err.Description = "" Then
				Err.Description = "未知错误"
			End If
			If Err.source = "" Then
				Err.source = "执行到：" & CURRENT_OBJECTNAME
			End If
			temp_Result  = "FAIL！执行到：" & CURRENT_OBJECTNAME & "错误号为" &Err.Number  &"   错误信息：" &  Err.Description & "  错误来源：" & Err.source
			'保存当前错误信息到Result->RunLog目录下
			If PATH_RESULTDRIVER = "" Then
				   SaveFilePath = PATH_PROJECT  & "\Result\"  & date & hour(now) &minute(now) & second(now) & ".png"
			else
					SaveFilePath = PATH_RESULTDRIVER  & "\RunLog\"  & date & hour(now) &minute(now) & second(now) & ".png" 
			End If
			call Desktop.CaptureBitmap(SaveFilePath,true)
			
			temp_Result = temp_Result & "错误截屏：" & SaveFilePath
			
		  '调用场景恢复脚本				  
		   Call ExceptHandle
		End If		
	else
		if temp_Result = ""  then
			temp_Result  = "FAIL！脚本未给返回值"
		end if
	end if
	ExecuteScript = temp_Result
	On Error GoTo 0
End Function

'#************************************SendMessage******************************************
'#	Description:	发送window消息															 *
'#																							*
'#	Parameters :obj   映射对象、standard_class 标准对象、	oblig_attr 强制属性*
'#  					  optional_attr    辅助属性		 							*
'#******************************************************************************************

function ClearControlAddin        
	Dim AppMapping
	Set AppMapping = createObject("QuickTest.Application")
	AppMapping.Options.ObjectIdentification.ResetAll
End function

function ControlAddin (obj,standard_class,oblig_attr, optional_attr)  
	On error resume next
	Dim AppMapping,OrdinalIdentifier

	Set AppMapping = createObject("QuickTest.Application")
	OrdinalIdentifier = AppMapping.Options.ObjectIdentification.Item(obj).OrdinalIdentifier
	If (not isempty(OrdinalIdentifier)) then
		if (AppMapping.Options.ObjectIdentification.Item(obj).MandatoryProperties.Find(oblig_attr)  > 0) and _
				( AppMapping.Options.ObjectIdentification.Item(obj).EnableSmartIdentification = false) and _
				( AppMapping.Options.ObjectIdentification.Item(obj).AssistiveProperties.Find(optional_attr) > 0)  then
					ControlAddin = 0
					Exit function
		end if
	end if
	AppMapping.Options.ObjectIdentification(standard_class).CreateUserDefinedObject(obj)
	AppMapping.Options.ObjectIdentification(obj).OrdinalIdentifier = "location"
	AppMapping.Options.ObjectIdentification(obj).MandatoryProperties.RemoveAll()
	AppMapping.Options.ObjectIdentification(obj).MandatoryProperties.Add(oblig_attr)
	AppMapping.Options.ObjectIdentification(obj).AssistiveProperties.RemoveAll()
	AppMapping.Options.ObjectIdentification(obj).AssistiveProperties.Add(optional_attr)
	AppMapping.Options.ObjectIdentification(obj).EnableSmartIdentification = False
	AppMapping.Options.ObjectIdentification(obj).BaseFilterProperties.RemoveAll()
	AppMapping.Options.ObjectIdentification(obj).OptionalFilterProperties.RemoveAll()
	ControlAddin = 0
End function

Sub SendKey(keyValue)
	Dim WshShell
	set WshShell = CreateObject("Wscript.Shell")
	WshShell.SendKeys keyValue
	Set WshShell = nothing
End Sub

'******************************************************************************************
const Auto_DLL_NAME="user32.dll" '加载user32.dll
extern.Declare micInteger,"SendMessageA",Auto_DLL_NAME,"",micLong,micLong,micLong,micString '引入user32.dll中的发送消息方法
'#************************************SendMessage******************************************
'#	Description:	发送window消息															 *
'#																							*
'#	Parameters :    str_Handle		：对象句柄												   *
'#  					 msg       ：消息									*
'#******************************************************************************************
Function SendMessage(str_Handle,msg,wParam,lParam)
	rc = extern.SendMessageA(Clng(str_Handle),Clng(msg),Clng(wParam),lParam)
	SendMessage = rc
End Function

'#************************************treturn***********************************************
'#	Description:	返回执行结果															 *
'#																							*
'#	Parameters :    result		：执行结果，执行通过返回PASS，否则返回错误信息					*
'#  					 					*
'#******************************************************************************************
Function treturn(fun_name, msg)
	treturn = (fun_name & " = " & msg & " : exitfunction")
End Function

'#************************************DoCMD*************************************************
'#	Description:	执行Window命令														 *
'#																							*
'#	Parameters :    result		：执行结果，执行通过返回PASS，否则返回错误信息					*
'#  					 					*
'#******************************************************************************************
function DoCMD(var) 	
	Dim oWsh,exec
	dim rc:rc=micPass
	Set oWsh =CreateObject("WScript.Shell")
	'print var
	exec = oWsh.Run(var,1,true)
	If  exec=0 Then
		rc=micPass
	else
		throw 1,"DOS命令执行","失败，命令为" & var
		 rc=micFail	
	End If
	Set oWsh = Nothing 	
	DoCMD=rc
end function


'#************************************GetValueByCol*************************************************
'#	Description:	从全局字典ARRAY_INPUTNAME中获取											 *
'#																							*
'#	Parameters :    result		：返回ARRAY_INPUTNAME主键对应的值	*
'#  					 					*
'#******************************************************************************************
function GetValueByCol(str_var) 	
	'判断输入的参数是否在公共字典中
	If ARRAY_INPUTNAME.exists(str_var) Then
		GetValueByCol = ARRAY_INPUTNAME.Item (str_var) 
		AutoCheckFlag = str_var
	Else
		GetValueByCol = ""
		AutoCheckFlag = ""
	End If
end function


'#************************************FormatDate******************************************
'#	Description:	转换日期格式 把99991231转换成9999-12-31															 *
'#																							*
'#	Parameters :    objName		：对象名称												   *
'#  					text        ：需要的日期										*
'#********************************************************************************************
public Function FormatDate(byref StrDate)
	Dim y, m, d
	if len(StrDate)= 8 Then
		y = mid(StrDate, 1, 4)
		m = mid(StrDate, 5, 2)
		d = mid(StrDate, 7, 2)	
		StrDate = y & "-" & m & "-" & d
		rc=0
	else
		rc=-1
	End If
	FormatDate=rc	
End Function



'#************************************Hs_UIAutoCheck******************************************
'#	Description:	期望值检查（方式：当前步骤:检查的控件.属性=值）													 *
'#	当前步骤，默认是当前当前的对象 属性的值支持正则表达式（这里是模糊匹配）	运算符有= <>2种																					*
'#	Parameters :    预期的值							*
'#********************************************************************************************
Public function Hs_UIAutoCheck(checkflag)
	'获取期望值
	'On Error Resume Next
	Dim i,result
	If checkflag = "" Then
		Exit function
	else
		ScriptContinueRun = true
	End If
	
	If not NUM_UIEXPECT = 0  Then
		For i = 0 to UBound(ARRAY_UIEXPECT)
			If instr(ARRAY_UIEXPECT(i),checkflag) > 0 Then
				result = result & Hs_UICheck(ARRAY_UIEXPECT(i),checkflag)
			End If
		Next
	else
		Exit function
	End If
	AutoCheckFlag = ""
	If instr(result,"FAIL") > 0  Then	
		throw 1,"Hs_UIAutoCheck", result		 
	else 
		If (not ScriptContinueRun) and (Err.Number = 0) Then
			throw 2,"Hs_UIAutoCheck", "PASS:无需继续执行"		 
		End If
	End If
End Function

Public function Hs_UIAutoCheckInfo(checkflag,actual)
	'获取期望值
	'On Error Resume Next
	Dim i, result
	Hs_UIAutoCheckInfo = "Pass"
	If checkflag = "" Then
		Exit function
	End If
	If not  NUM_UIEXPECT = 0  Then
		For i = 0 to UBound(ARRAY_UIEXPECT)
			If instr(ARRAY_UIEXPECT(0),checkflag) > 0 Then
				result = result & Hs_UICheckInfo(ARRAY_UIEXPECT(0),actual,checkflag)
			End If
		Next
	else
		Exit function
	End If
	AutoCheckFlag = ""
	If instr(result, "FAIL") > 0  Then	
		throw 1,"Hs_UIAutoCheckInfo", result
	else
		If (not ScriptContinueRun) and (Err.Number = 0) Then
			throw 2,"Hs_UIAutoCheckInfo", "PASS:无需继续执行"		 
		End If
	End If
End Function

private function Hs_UICheckInfo(currentexpect,actual,checkflag)
	Dim i,arrayCheckInfo
	dim checkcontrol,checkexpress,checkvalue
	Dim checkcontrolName,checkcontrolProperty,controlPropertyValue
	Dim checkscript
	Hs_UICheckInfo = "PASS"

	arrayCheckInfo = split(currentexpect,":")
	if UBound(arrayCheckInfo) < 1 Then
		Hs_UICheckInfo = "PASS"
		Exit Function
	end if
	If arrayCheckInfo(0) <> checkflag Then
		Hs_UICheckInfo = "PASS"
		Exit Function
	End If
	checkflag = arrayCheckInfo(0)
	checkcontrol = arrayCheckInfo(1)
	If checkflag = "" Then
		Hs_UICheckInfo = "FAIL:期望值为" & currentexpect & "书写不正确！"
		Exit Function
	End If
	
	If not ARRAY_CheckPoints.Exists(checkflag)  Then
		ARRAY_CheckPoints.Add 	checkflag,""
	End If

	If ARRAY_CheckPoints.Exists(checkflag) Then
		'分隔检查信息
		checkvalue = checkcontrol
		'检查弹出信息
		controlPropertyValue = actual
		If instr(cstr(controlPropertyValue),checkvalue) > 0 then
			Hs_UICheckInfo= "PASS"
			Exit Function
		else
			Hs_UICheckInfo = "FAIL:期望值为" & currentexpect & "实际值为" & controlPropertyValue
			Exit Function
		end if
	End If
End Function

private function Hs_UICheck(currentexpect,checkflag)
	Dim i,arrayCheckInfo
	dim checkcontrol,checkexpress,checkvalue
	Dim checkcontrolName,checkcontrolProperty,controlPropertyValue
	Dim checkscript
	Hs_UICheck = "PASS"

	arrayCheckInfo = split(currentexpect,":")
	if UBound(arrayCheckInfo) < 1 Then
		Hs_UICheckInfo = "PASS"
		Exit Function
	end if
	If arrayCheckInfo(0) <> checkflag Then
		Hs_UICheck = "PASS"
		Exit Function
	End If
	checkflag = arrayCheckInfo(0)
	checkcontrol = arrayCheckInfo(1)
	If checkflag = "" Then
		Hs_UICheck = "FAIL:期望值为" & currentexpect & "书写不正确！"
		Exit Function
	End If
	
	If not ARRAY_CheckPoints.Exists(checkflag)  Then
		ARRAY_CheckPoints.Add checkflag,""
	End If
	
	If  ARRAY_CheckPoints.Exists(checkflag) Then
		'分隔检查信息
		If instr(checkcontrol,"=") > 0 then '检查的是相等
			arrayCheckInfo = split(checkcontrol,"=")
			checkcontrol =  arrayCheckInfo(0)
			checkexpress = "="
			checkvalue = arrayCheckInfo(1)
		elseif instr(checkcontrol,"<>") > 0 then	'检查的不等
			arrayCheckInfo = split(checkcontrol,"<>")
			checkcontrol =  arrayCheckInfo(0)
			checkexpress = "<>"
			checkvalue = arrayCheckInfo(1)
		else
			checkvalue = checkcontrol
			checkcontrol = "信息"
			checkexpress = "="				
		end if

		If checkcontrol = "信息" Then
			'检查弹出信息
			controlPropertyValue = Hs_DealAlert("","")
			If instr(cstr(controlPropertyValue),checkvalue) > 0 then
				If checkexpress = "=" Then
					Hs_UICheck = "PASS"
					Exit Function
				End If
				If checkexpress = "<>" Then
					Hs_UICheck = "FAIL:期望值为" & currentexpect & "实际值为" & controlPropertyValue
					Exit Function
				End If
			else
				If checkexpress = "=" Then
					Hs_UICheck = "FAIL:期望值为" & currentexpect & "实际值为" & controlPropertyValue
					Exit Function
				End If
				If checkexpress = "<>" Then
					Hs_UICheck = "PASS"
					Exit Function
				End If
			end if
		else '检查属性值
			arrayCheckInfo = split(checkcontrol,".")	
			checkcontrolName = arrayCheckInfo(0)
			checkcontrolProperty	= arrayCheckInfo(1)

			If not ARRAY_CheckPoints.Exists(checkcontrolName) Then
				Hs_UICheck  = "FAIL:期望值为" & currentexpect & "实际值为" & checkcontrolName & "不存在"
				Exit Function
			End If
			checkscript = "controlPropertyValue =  this.WinObject(" & """" & ARRAY_CheckPoints.Item(checkcontrolName)  & """" & ").GetROProperty("
			checkscript = checkscript & """" &  checkcontrolProperty &"""" & ")"	
			execute checkscript

			If instr(cstr(controlPropertyValue),checkvalue) > 0 then							
				If checkexpress = "=" Then
					Hs_UICheck = "PASS"
					Exit Function
				End If
				If checkexpress = "<>" Then
					Hs_UICheck = "FAIL:期望值为" & currentexpect & "实际值为" & controlPropertyValue
					Exit Function
				End If
			else
				If checkexpress = "=" Then
					Hs_UICheck = "FAIL:期望值为" & currentexpect & "实际值为" & controlPropertyValue
					Exit Function
				End If
				If checkexpress = "<>" Then
					Hs_UICheck = "PASS"
					Exit Function
				End If
			end if	  	    
		End If
	End If
End Function

'#************************************Hs_AddUICheckPoint(后续名字替换成BindCheck)******************************************
'#	Description:	期望值检查（方式：当前步骤:检查的控件.属性=值）													 *
'#	当前步骤，默认是当前当前的对象 属性的值支持正则表达式（这里是模糊匹配）																						*
'#	Parameters :    预期的值							*
'#********************************************************************************************
Public function Hs_AddUICheckPoint(checkflag,checkcontrolName)         
	If  not ARRAY_CheckPoints.Exists(checkflag) Then
		ARRAY_CheckPoints.Add 	checkflag,checkcontrolName
	else
		ARRAY_CheckPoints.Item(checkflag) = checkcontrolName
	end if 
End Function

Public function BindCheck(checkflag,checkcontrolName)         
	If  not ARRAY_CheckPoints.Exists(checkflag) Then
		ARRAY_CheckPoints.Add 	checkflag,checkcontrolName
	else
		ARRAY_CheckPoints.Item(checkflag) = checkcontrolName
	end if 
End Function


Public function Hs_DealAlert(winName,dealButton)
	Dim message,children
	message = ""
	Dim oDesc
	Set oDesc = Description.Create()
	oDesc("Class Name").value = "WinButton"

	If winName <> "" Then
		If Dialog("text:=" & winName).Exist(3)  then
			message = Dialog("text:=" & winName).static("nativeclass:=Static","window id:=65535").GetROProperty("text")
			Hs_DealAlert = message
			Set children = Dialog("text:="& winName).ChildObjects(oDesc)
			if(Dialog("text:=" & winName).WinButton("text:=" & dealButton).exist) then
				Dialog("text:=" & winName).WinButton("text:=" & dealButton).Click
			elseif not (Dialog("text:=" & winName).WinButton("text:=" & dealButton).exist) then
				children(0).Click
			end if
			ScriptContinueRun = true
			Exit function
		end if 
	End If
	
	If Dialog("text:=警告").Exist(3) then
		message = Dialog("text:=警告").static("nativeclass:=Static","window id:=65535").GetROProperty("text")
		Hs_DealAlert = message
		Set children = Dialog("text:=警告").ChildObjects(oDesc)
		If children.count = 1Then
			children(0).Click
			ScriptContinueRun = false
		elseif dealButton = "Deal" then
			Dialog("text:=警告").WinButton("text:=否.*").Click
		End If
		Exit Function
	end if

	If Dialog("text:=提示").Exist then
		message = Dialog("text:=提示").static("nativeclass:=Static","window id:=65535").GetROProperty("text")
		Hs_DealAlert = message
		Set children = Dialog("text:=提示").ChildObjects(oDesc)
		If children.count = 1 Then
			children(0).Click
			ScriptContinueRun = false
		elseif dealButton = "Deal" then
			Dialog("text:=提示").WinButton("text:=确定").Click
		End If
		Exit Function
	end if

	If Dialog("text:=错误.*").Exist then
		message = Dialog("text:=错误.*").static("nativeclass:=Static","window id:=65535").GetROProperty("text")
		Hs_DealAlert = message
		Set children = Dialog("text:=错误").ChildObjects(oDesc)
		If children.count = 1Then
			children(0).Click
			ScriptContinueRun = false
		elseif dealButton = "Deal" then
			Dialog("text:=错误").WinButton("text:=确定").Click
		End If
		Exit Function
	end if
End Function
