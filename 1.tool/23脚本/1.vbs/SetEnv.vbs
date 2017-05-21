'Code
 Set pSysEnv = CreateObject("WScript.Shell").Environment("System")

'Check whether a character string matches a regular expression
'   ^/w+[@]/w+[.]/w+$       E-MailAddress
'   ^[0-9-]+$               Numeral
Function IsMatch(Str, Patrn)	'正则匹配
  Set r = new RegExp
  r.Pattern = Patrn
  IsMatch = r.test(Str)
End Function
Sub SetEnv(pPath, pValue)
	ExistValueOfPath = pSysEnv(pPath)
	IF pValue <> "" Then
		If IsMatch(ExistValueOfPath, ".*?" & Replace(pValue, "\", "\\") & "(\\|;)?") Then Exit Sub '已经存在该环境变量设置
		If ExistValueOfPath <> "" Then 
			pValue = ";" & pValue
		end if
			pSysEnv(pPath) = ExistValueOfPath & pValue
	Else
		If ExistValueOfPath <> "" Then
			pSysEnv.Remove(pPath)
		end if
	End IF
End Sub
'--------设置TOF目录---------
'TOF = "D:/Workshop/tof/TOF_Common/Library/Tencent.OA.Framework.dll.config"

'SetEnv "TOF", TOF
Set unNamedArguments = WScript.Arguments.UnNamed
'msgbox unNamedArguments.count

if unNamedArguments.count =2 then
	SetEnv unNamedArguments.Item(0),unNamedArguments.Item(1)
	'MsgBox "Set environment variable for "&unNamedArguments.Item(0)&" successfully."
elseif unNamedArguments.count =0 then
	
	MYHOME=createobject("Scripting.FileSystemObject").GetFolder("..\..\..").Path	REM I:\win10初始化\0.初始软件集\2.初始脚本集\0.系统初始设置脚本
	Curpath=createobject("Scripting.FileSystemObject").GetFolder("..").Path
	iflag=inputbox("1.设置"&MYHOME&"到MYHOME吗?"& vbCrlf &"2.设置"&Curpath&"到PATH吗?")
	if iflag="1"	then
		'G:\MYHOME\1.tool\23脚本\1.vbs
		SetEnv "MYHOME",MYHOME
	elseif iflag="2"then
		SetEnv "PATH",Curpath
	else
		MsgBox "实例：SetEnv ""PATH"" ""xxx"""
	end if
elseif unNamedArguments.count =1 then
	'cmd 要重开才会生效
	'重得删除,要保护.
	SetEnv unNamedArguments.Item(0),""
else
	MsgBox "Arguments.count is wrong"
	MsgBox "实例：SetEnv ""PATH"" ""xxx"""
end if
