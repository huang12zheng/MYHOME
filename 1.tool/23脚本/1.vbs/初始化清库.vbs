'sub setStringSQLString
SQLString="prompt ɾ����������״̬����ˮ��ͬ��"&vbCrLf&"conn hs_secu/hundsun@81-data;"&vbCrLf&"delete from hs_asset.cbptransstatus;"&vbCrLf&"delete from hs_secu.transstatus;"&vbCrLf&"delete from hs_crdt.crdttransstatus;"&vbCrLf&"commit;"&vbCrLf&"prompt ����mzdb3"&vbCrLf&"conn hs_secu/hundsun@hs19.112;"&vbCrLf&"delete from hs_secu.transstatus;"&vbCrLf&"commit;"&vbCrLf&"exit"'&vbCrLf&"prompt ����mzdbcrdt"&vbCrLf&"conn hs_crdt/hundsun@mzdbcrdt;"&vbCrLf
'msgbox SQLString
'end sub


'setStringSQLString
filename="D:\intetrans.pdc"
Set FSO = CreateObject("Scripting.FileSystemObject")
if (fso.fileexists(filename)) then
		'���ļ�������1Ϊforreading��2Ϊforwriting��8Ϊappending
		set file=fso.opentextfile(filename,2,ture)
		'msgbox file.name
		else
		'�����ļ�������1Ϊforreading��2Ϊforwriting��8Ϊappending
		set file=fso.CreateTextFile(filename,ture)'����������
		
end if
'call setFileByString("DBFList.txt",DBFList)

file.writeline SQLString
setErrorInfoByExePCD
'FSO.deleteFile filename
Set file = Fso.GetFile(filename)
file.Delete
Sub setErrorInfoByExePCD()
	
	'cmd����pdc
	Set ws = CreateObject("WScript.shell")
	'pdcpath=CreateObject("Scripting.FileSystemObject").GetFolder(".").Path&"\sqlpdc.pdc"
	
	'ws.Run "cmd /k "&"sqlplus /nolog @"&filename,1,true
	ws.Run "cmd /c "&"sqlplus /nolog @"&filename,1,true
	REM wscript.sleep 1000
	REM ErrorPrefixArray=Array("SP2-","ERROR:","����","ORA-","WAR")
	REM s=getErrorInfoByErrorPrefixArray("sqlpdc.log",ErrorPrefixArray)
	REM MsgBox s
	REM Call WriteTxtFile("ErrorInfo.log",s)
msgbox "ok"
End Sub