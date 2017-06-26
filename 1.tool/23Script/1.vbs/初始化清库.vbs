'sub setStringSQLString
SQLString="prompt 删除报盘在线状态及流水表同步"&vbCrLf&"conn hs_secu/hundsun@81-data;"&vbCrLf&"delete from hs_asset.cbptransstatus;"&vbCrLf&"delete from hs_secu.transstatus;"&vbCrLf&"delete from hs_crdt.crdttransstatus;"&vbCrLf&"commit;"&vbCrLf&"prompt 连接mzdb3"&vbCrLf&"conn hs_secu/hundsun@hs19.112;"&vbCrLf&"delete from hs_secu.transstatus;"&vbCrLf&"commit;"&vbCrLf&"exit"'&vbCrLf&"prompt 连接mzdbcrdt"&vbCrLf&"conn hs_crdt/hundsun@mzdbcrdt;"&vbCrLf
'msgbox SQLString
'end sub


'setStringSQLString
filename="D:\intetrans.pdc"
Set FSO = CreateObject("Scripting.FileSystemObject")
if (fso.fileexists(filename)) then
		'打开文件，参数1为forreading，2为forwriting，8为appending
		set file=fso.opentextfile(filename,2,ture)
		'msgbox file.name
		else
		'创建文件，参数1为forreading，2为forwriting，8为appending
		set file=fso.CreateTextFile(filename,ture)'不能有中文
		
end if
'call setFileByString("DBFList.txt",DBFList)

file.writeline SQLString
setErrorInfoByExePCD
'FSO.deleteFile filename
Set file = Fso.GetFile(filename)
file.Delete
Sub setErrorInfoByExePCD()
	
	'cmd调用pdc
	Set ws = CreateObject("WScript.shell")
	'pdcpath=CreateObject("Scripting.FileSystemObject").GetFolder(".").Path&"\sqlpdc.pdc"
	
	'ws.Run "cmd /k "&"sqlplus /nolog @"&filename,1,true
	ws.Run "cmd /c "&"sqlplus /nolog @"&filename,1,true
	REM wscript.sleep 1000
	REM ErrorPrefixArray=Array("SP2-","ERROR:","警告","ORA-","WAR")
	REM s=getErrorInfoByErrorPrefixArray("sqlpdc.log",ErrorPrefixArray)
	REM MsgBox s
	REM Call WriteTxtFile("ErrorInfo.log",s)
msgbox "ok"
End Sub