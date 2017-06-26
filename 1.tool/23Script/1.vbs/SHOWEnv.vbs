set ws=createobject("WSCRIPT.SHELL")
set fso=createobject("Scripting.FileSystemObject")
MYHOME=ws.ExpandEnvironmentStrings("%MYHOME%")
FilePath=MYHOME&"0.init\3.etc\EnvironmentValue.ev"
'msgbox fso.opentextfile(FilePath).readall
path_array=split(fso.opentextfile(FilePath).readall,vbCrLf)
n_path_strlines=""
for each item in path_array
	if left(item,1)<>"" then
		item=left(item,instr(item,":")-1)
		'不能用path,会忘记设置else的场景
		if left(item,1)="#" then
			item=Right(item,len(item)-1)
		end if
		
		n_path_strlines=n_path_strlines&item&vbCrLf
	end if
next


strlines=""
path_array=split(n_path_strlines,vbCrLf)
'避免重复输出变量,考虑整体结构
item_bef=""
for each item in path_array
	if item_bef<> item and item<>"" then
		value=ws.ExpandEnvironmentStrings("%"&item&"%")
		strlines=strlines&item&":="&value&vbCrLf&vbCrLf
		item_bef=item
	end if
next

msgbox strlines