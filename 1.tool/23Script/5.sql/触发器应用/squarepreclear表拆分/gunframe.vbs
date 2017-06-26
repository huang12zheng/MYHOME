'cmd调用pdc
Set ws = CreateObject("WScript.shell")
pdcpath=CreateObject("Scripting.FileSystemObject").GetFolder(".").Path&"\batch_baseshell_SplitSquarepreclear.pdc"
	
	ws.Run "cmd /c "&"sqlplus /nolog @"&pdcpath,1,true
	wscript.sleep 1000
	'ErrorPrefixArray=Array("SP2-","ERROR:","警告","ORA-","WAR")
	's=getErrorInfoByErrorPrefixArray("sqlpdc.log",ErrorPrefixArray)
	'MsgBox s
	'Call WriteTxtFile("ErrorInfo.log",s)