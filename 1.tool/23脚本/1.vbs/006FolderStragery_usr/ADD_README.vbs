'V2 2017-5-7 13:25:49 ��ӱ����ļ��еĺ���:����ļ���Ϊ��,�����һ��readme.txt
'V1 2017-5-7 10:36:45 ��ӱ����ļ��еĺ���:����ļ���Ϊ��,�����һ��readme.txt
dim fso,ws

set fso = createobject("scripting.filesystemobject") 
set ws = createobject("wscript.shell") 
vbsname=WScript.ScriptName
vbsname=left(vbsname,len(vbsname)-4)
usr=fso.GetFile(Wscript.ScriptFullName).ParentFolder.Path&"\"&vbsname&"_usr\"

Set unNamedArguments = WScript.Arguments.UnNamed
folderpath=unNamedArguments.Item(0)
'folderpath="G:\MYHOME\1.tool\23�ű�\1.vbs\006FolderStragery_usr\testFolder\"
if unNamedArguments.count=1 then
	arg="A"
end if
sub	ADDreadme
	'msgbox folderpath&"\readme.txt"
	call fso.CreateTextFile(folderpath&"\readme.txt",true)
end sub


'On Error Resume Next   
  
    if fso.getFolder(folderpath).Size=0 and err.Number=0 Then       '�ļ��еĴ�СΪ��  
		
		'call MYSCRIPT
		arg=inputBox(folderpath& vbCrLf &"ADD or DEL",,"ADD")
		wscript.sleep 3000
		select case	left(UCase(arg),1)
			case "A"	call ADDreadme
			case "D"	fso.getFolder(folderpath).Delete
			'Case Else 
		end select
		
	end if
	
