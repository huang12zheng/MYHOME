dim fso,ws,pt,msg 

set fso = createobject("scripting.filesystemobject") 
set ws = createobject("wscript.shell") 

set file = fso.getfile(wscript.scriptfullname)
 pt = ws.specialfolders("startup") & "\"
 'msgbox pt
 ws.exec("calc")
 ws.exec("cmd")
 ws.run "notepad2"
 'file.copy pt 
sub Close_Process(ProcessName) 
   
	On Error Resume Next
end sub