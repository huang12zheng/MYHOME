Function getStringByLeftSplit(strline,iSplit,action)
	'MsgBox  stepstatus
	tmpstring=""
	ilen  		=Len(strline)
	iSplitlen   =Len(iSplit)
	iinstr=InStr(strline,iSplit)+iSplitlen-1
	if iinstr>0 then iinstr=iinstr-1 end if
	If action=0 Then'ȡ��
		tmpstring=Left(strline,iinstr)
	Else 			'ȡ��
		If ilen-iinstr<0 Then 
			tmpstring=""
		Else 
			tmpstring=Right(strline,ilen-iinstr)
		End if
	End If
	getStringByLeftSplit=tmpstring
End Function
function getFilename(DBF_PATH)
	getFilename=getStringByLeftSplit(DBF_PATH,".",0)
end function

function getDirePathByFilePath(filepath)
	set file=getFileByPath(filepath)
	'msgbox file.path
	getDirePathByFilePath=file.ParentFolder'getFileList(filepath)
end function
function getFileByPath(filepath)
	Set FSO = CreateObject("Scripting.FileSystemObject")
	if FSO.fileExists(filepath)=false then 
		msgbox "�ļ��������� getFileByPath"
		wscript.quit
	end if
	'set getFileByPath=FSO.opentextfile(filepath)
	set getFileByPath=Fso.GetFile(filepath)
end function
Sub copyPathToPath(filepath1,filepath2)
	Set ws = CreateObject("WScript.Shell")
	currentpath = createobject("Scripting.FileSystemObject").GetFolder(".").Path
	'���ļ�1���Ƹ��ļ�2
	ws.Run "cmd /c"&" copy "&filepath1&" "&filepath2
	'wscript.sleep 1000
End Sub
sub step1_dbfderiver
dim addcase(10)
	'!!!!!!!!
	'TNSname(0)="HS19.123"
	addcase(0)=""
	addcase(1)="���ù���"
	addcase(2)="ϯλ����"
	addcase(3)="�ӿڳ���1"
	addcase(4)="�ӿڳ���2"
	addcase(5)="���Ϊ��"
	addcase(6)="����Ϊ��"
if StrComp(DBF_PATH,"") <> 0 then
			
			filename=getFilename(DBF_PATH)
			
			'filepath=getDirePathByFilePath(DBF_PATH)
			'msgbox filepath
			set myfile=getFileByPath(DBF_PATH)
			Set FSO = CreateObject("Scripting.FileSystemObject")
			itype=FSO.GetExtensionName(DBF_PATH)
			'msgbox myfile.Name
			'msgbox itype
			For each item in addcase
				'MyFile.Copy "D:\",False
				newfilename=filename&item&"."&itype
				MyFile.Copy newfilename
				msgbox newfilename
				
			Next
end if
end sub
REM sub step2_SetdbfList
REM 'DBF_PATH=InputBox("your_DBF_PATH:",,"D:\���ӵ�dbf\7X24Сʱ����\tmp\cil_.dbf")
REM dim addcase(10)
REM if StrComp(DBF_PATH,"") <> 0 then
			
			REM set myfile=getFileByPath(DBF_PATH)
			REM Set FSO = CreateObject("Scripting.FileSystemObject")
			REM '''''''''''''''''''''''''''
REM end if
REM end sub
DBF_PATH=InputBox("your_DBF_PATH:",,"D:\dbfOntestcase\7X24settle\tmp\cil_.dbf")
step1_dbfderiver
'step2_SetdbfList