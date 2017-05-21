'V2 2017-5-7 13:25:49 添加便利文件夹的函数:如果文件夹为空,则添加一个readme.txt
'V1 2017-5-7 10:36:45 添加便利文件夹的函数:如果文件夹为空,则添加一个readme.txt
dim fso,ws

set fso = createobject("scripting.filesystemobject") 
set ws = createobject("wscript.shell") 
vbsname=WScript.ScriptName
vbsname=left(vbsname,len(vbsname)-4)
usr=fso.GetFile(Wscript.ScriptFullName).ParentFolder.Path&"\"&vbsname&"_usr\"

Set unNamedArguments = WScript.Arguments.UnNamed
'folderpath=unNamedArguments.Item(0)
folderpath="G:\MYHOME\2.work\2.恒生测试工作夹\1测试日志\3.递交包下载"
if unNamedArguments.count=1 then
	arg="A"
end if
sub	ADDreadme
	msgbox folderpath&"\readme.txt"
	call fso.CreateTextFile(folderpath&"\readme.txt",true)
end sub


'On Error Resume Next   
    if fso.getFolder(folderpath).Size=0 and err.Number=0 Then       '文件夹的大小为零  
		
		'call MYSCRIPT
		arg=inputBox("ADD or DEL",,"ADD")

		select case	left(UCase(arg),1)
			case "A"	call ADDreadme
			case "D"	fso.getFolder(folderpath).Delete
			'Case Else 
		end select
		
	end if
	
