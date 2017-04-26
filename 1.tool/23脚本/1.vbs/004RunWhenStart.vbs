'http://www.51testing.com/html/44/316844-3546254.html
'schtasks /create /tn "RunWhenStart" /tr 004RunWhenStart.vbs /sc  ONLOGON
'::chcp 437
'::005RunWhenStart.bat
dim fso,ws,pt,msg 

set fso = createobject("scripting.filesystemobject") 
set ws = createobject("wscript.shell") 

'msgbox fso.GetFolder(".").Path
''vbsname=Wscript.ScriptFullName
vbsname=WScript.ScriptName
vbsname=left(vbsname,len(vbsname)-4)
'usr=fso.GetFolder(".").Path&"\004RunWhenStart_usr\"
'usr=fso.GetFolder(".").Path&"\"&vbsname&"_usr\"
usr=fso.GetFile(Wscript.ScriptFullName).ParentFolder.Path&"\"&vbsname&"_usr\"

'set StrLines=FSO.opentextfile(usr&"RunList.txt",2,true) 
msgbox usr&"RunList.txt"
for Each strline in split(FSO.opentextfile(usr&"RunList.txt").readall,vbCrLf)
	ws.run strline
next
 'file.copy pt 
sub Close_Process(ProcessName) 
   
	On Error Resume Next
end sub