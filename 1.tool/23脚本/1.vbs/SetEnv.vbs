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

REM Sub SetEnv(pPath, pValue)
    REM Dim ExistValueOfPath
    REM IF pValue <> "" Then
     REM ExistValueOfPath = pSysEnv(pPath)
 REM IF Right(pValue, 1) = "\" Then pValue = Left(pValue, Len(pValue)-1)	'去掉最右的/
 REM 'If IsMatch(ExistValueOfPath, "/*?" & Replace(pValue, "/", "//") & "//?(/b|;)") Then
REM If IsMatch(ExistValueOfPath, ".*?" & Replace(pValue, "\", "\\") & "(\\|;)?") Then Exit Sub '已经存在该环境变量设置

 REM If ExistValueOfPath <> "" Then pValue = ";" & pValue
 REM pSysEnv(pPath) = ExistValueOfPath & pValue
REM MsgBox "SyEnv "&pPath&" is already Exist,it will be appended." 
    REM Else
 REM pSysEnv.Remove(pPath)
    REM End IF
REM End Sub
Sub SetEnv(pPath, pValue)
    Dim ExistValueOfPath
	IF pValue <> "" Then
		ExistValueOfPath = pSysEnv(pPath)
		'IF Right(pValue, 1) = "\" Then pValue = Left(pValue, Len(pValue)-1)	'去掉最右的/
		'If IsMatch(ExistValueOfPath, "/*?" & Replace(pValue, "/", "//") & "//?(/b|;)") Then
		If IsMatch(ExistValueOfPath, ".*?" & Replace(pValue, "\", "\\") & "(\\|;)?") Then Exit Sub '已经存在该环境变量设置
		If ExistValueOfPath <> "" Then 
			'MsgBox "SyEnv "&pPath&" is already Exist,it will be appended." 
			pValue = ";" & pValue
		end if
			pSysEnv(pPath) = ExistValueOfPath & pValue
	Else
		 pSysEnv.Remove(pPath)
	End IF
End Sub
'--------设置TOF目录---------
'TOF = "D:/Workshop/tof/TOF_Common/Library/Tencent.OA.Framework.dll.config"

'SetEnv "TOF", TOF
Set unNamedArguments = WScript.Arguments.UnNamed
if unNamedArguments.count =2 then
	SetEnv unNamedArguments.Item(0),unNamedArguments.Item(1)
	'MsgBox "Set environment variable for "&unNamedArguments.Item(0)&" successfully."
elseif unNamedArguments.count =0 then
	MYHOME=createobject("Scripting.FileSystemObject").GetFolder("..\..\..").Path	REM I:\win10初始化\0.初始软件集\2.初始脚本集\0.系统初始设置脚本
	SetEnv "MYHOME",MYHOME
else
	MsgBox "Arguments.count is wrong"
end if
