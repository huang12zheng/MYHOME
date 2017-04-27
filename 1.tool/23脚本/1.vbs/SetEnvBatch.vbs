Set ws = CreateObject("WScript.Shell")
	'ws.Run "SetEnv.vbs aa %MYSCRIPTHOME%22"
set fso = createObject("Scripting.FileSystemObject")
'G:\MYHOME\0.init\3.etc\EnvironmentValue.ev
'msgbox "%MYHOME%"
'MYHOME=ws.Environment("MYHOME")
MYHOME=ws.ExpandEnvironmentStrings("%MYHOME%")
'msgbox "%MYHOME%0.init\3.etc\EnvironmentValue.ev"
FilePath=MYHOME&"0.init\3.etc\EnvironmentValue.ev"
'set MYFILE = fso.GetFile(MYHOME&"0.init\3.etc\EnvironmentValue.ev")
'set MYFILE = fso.GetFile(FilePath)
path_array=split(fso.opentextfile(FilePath).readall,vbCrLf)
for each item in path_array
	if left(item,1)<>"#" and left(item,1)<>"'" and left(item,2)<>";;" and left(item,1)<>"" then
		path=left(item,instr(item,":")-1)
		value=Right(item,len(item)-instr(item,":"))
		ws.Run "SetEnv.vbs "&path&" "&value
	end if
next
'已设置的环境变量,不再重新执行设置
set MYFILE = fso.opentextfile(filepath,2,true)
new_str=""
for each item in path_array
	if left(item,1)<>"#" and left(item,1)<>"'" and left(item,2)<>";;" and left(item,1)<>"" then
		item="#"&item
	end if
	new_str=new_str&item&vbCrLf
next
msgbox new_str
MYFILE.write new_str
'msgbox "config is over"
'msgbox fso.opentextfile(FilePath).readall

'ws.run "FiletoArray.vbs "&"MYFILE"