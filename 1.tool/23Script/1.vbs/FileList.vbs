'V9 20161108 cmd����codetoolUI,
'V8 20161108 �����޸�˵��:1.����Sqllist����pdc�ļ�;2�����ɽ�����д���,����errorinfo
'V7.1 20161107 ֻʹ��setSQLList,getFileListcase��ӳ���4,ֻ��ȡ·��
'V7.0 20161107 �����ɶ�Ӧ��SQL�ļ��б���������setSQLList,getLesstSQLList
'V6 20161106 ��NewList�滻FileList
'V5 20161106 ����unRAR(),unRAR.bat�ű�
'V4.1 20161106 ����getStringByRightSplit(s),��ȡ�ȽϽ��,��ȥ���� �� ��ȡ�����ļ����б�
'V4.0 20161106 ����getNewFile(Filename),��ȡ�ȽϽ��
'V3 20161106 �޸�getFileList,����Ψһ��������-ʱ��(����û��������ص�)
'V2 20161104 ����WriteTxtFile(filename) �ڵ�ǰĿ¼��
'V1 20161104 ��ʱ�汾
Function getFileListcase(file,action)
	select Case action
		Case 1 getFileListcase=file.DateCreated & file.Path
		Case 2 getFileListcase=CreateObject("Scripting.FileSystemObject").GetFileVersion(file.Path)&vbTab &file.Path
		Case 3 getFileListcase=file.Path&file.DateCreated
		Case 4 getFileListcase=file.Path
	End select
End Function

function getFileList(filepath,itype,action,caseaction)'itype�ļ�����,action�Ƿ�ݹ�
  set folder=getFolder(filepath)
  s=""
  iTypeLength=len(itype)
  IF itype <> " " then '���ļ�
	  For Each file In folder.Files '�����ļ�
	  
		ext = LCase(Right(file.Name, iTypeLength+1)) '��ȡ��չ��
		If ext = "."&itype Then
		  'V3 20161106 �޸�getFileList,����Ψһ��������-ʱ��(����û��������ص�)
		  s = s & getFileListcase(file,caseaction)
		  's = s & file.DateCreated & file.Path
		  s = s & vbCrLf
		End If
	  Next
  ELSE
	  For Each file In folder.SubFolders '�����ļ���
	    'V3 20161106 �޸�getFileList,����Ψһ��������-ʱ��(����û��������ص�)
		s = s & getFileListcase(file,caseaction)
		s = s & vbCrLf
	  Next
  END If
  'getFileList(file,itype,action) '�ݹ鵱action=1
  if action="1" then 
		For Each file In folder.SubFolders  '�����ļ���
				s=s & getFileList(file,itype,action,caseaction) '�ݹ�
			's = s & tmps
		Next
  end if
  getFileList=s
End function

function getFolder(filepath)
	Set ws = CreateObject("WScript.Shell")
	Set FSO = CreateObject("Scripting.FileSystemObject")
	If fso.FolderExists(filepath)=FALSE Then
		'ReportProgress if errorhappen
msgbox		"enviroment�ļ��еĲ���·���Ҳ�������ȷ�����environment�ļ�������ȷ��",2
wscript.quit
	else
		''folder = ws.RegRead(filepath) ''δ������Ҫ��ȡע���
		set getFolder=FSO.GetFolder(filepath) 
		'MsgBox FSO.GetFolder(filepath).Path 'չʾ�ļ���·��
	end if
end function
function getTxtWriteFile(filepath)
	Set FSO = CreateObject("Scripting.FileSystemObject")
	if FSO.fileExists(filepath)=false then 
		msgbox "�ļ��������� getTxtWriteFile"
		wscript.quit
	end if
	set getTxtWriteFile=FSO.opentextfile(filepath,2,true) 
end Function
function getTxtReadFile(filepath)
	Set FSO = CreateObject("Scripting.FileSystemObject")
	if FSO.fileExists(filepath)=false then 
		msgbox "�ļ��������� getTxtReadFile"
		wscript.quit
	end if
	set getTxtReadFile=FSO.opentextfile(filepath)
	
	'set getTxtReadFile=FSO.GetFile(filepath) 'ע��getTxtReadFile��getTxtWriteFile�в�ͬ
end function
function WriteTxtFile(filename,s)
	'cmd����filename��Ӧ��txt�ļ�
	Set ws = CreateObject("WScript.Shell")
	ws.Run "cmd /c "&"echo>"&filename
	wscript.sleep 1000

	'��ȡtxt�ļ�·�� 
	currentpath = createobject("Scripting.FileSystemObject").GetFolder(".").Path
	filepath=currentpath&"\"&filename'��Ҫ����\,��Ȼ����ƥ��
	'��ȡ����
	set file=getTxtWriteFile(filepath)
	
	'д�ļ�
	file.write(s)
	file.close
	WriteTxtFile=true
end function
function sortFile(filename,action)'action=0 ˳�� action=1 ����
	'����txt�ļ�
	Set ws = CreateObject("WScript.Shell")
	'cmd����
	cmdcode="cmd /c "&"sort "
	Select Case action
	    'Case 0	
	    Case 1	cmdcode=cmdcode&" /r "
	End Select
	cmdcode=cmdcode&filename&" /o "&filename
	ws.Run cmdcode
	WScript.sleep 1000
	sortFile=true
end Function


Function getCompAns(filename1,filename2,action)
	'��ȡ�Ա��ļ�����
	
	'��ȡ�Ա��ļ����ݻ� �� ����
	fileoldarray=getStringArrayByFile(filename1)
	filenewarray=getStringArrayByFile(filename2)
	getfileoldRows=UBound(fileoldarray)
	getfilenewRows=UBound(filenewarray)
	'Wscript.Quit ����ʱ��
	s1=""
	s2=""
	'���ٱȽ�,��ȡs1,s2,��Ӧ��ͬ�ļ�������
	iold=0:inew=0 '����&
	Do While iold<getfileoldRows And inew<getfilenewRows 'iold�Ǵ�0��ʼ��
		'MsgBox fileoldarray(iold) ����ʱ��
		'MsgBox fileoldarray(inew) ����ʱ��
		cmpans=StrComp(fileoldarray(iold),filenewarray(inew))
		If cmpans=0 Then
			iold=iold+1
			inew=inew+1
		ElseIf cmpans=-1 then '˵���Ƕ������
			s1 = s1& fileoldarray(iold) & vbCrLf
			iold=iold+1
		ElseIf cmpans= 1 then '˵���Ƕ������
			s2 = s2& filenewarray(inew) & vbCrLf
			inew=inew+1
		End If
	loop
	Do While iold<getfileoldRows
		s1 = s1& fileoldarray(iold) & vbCrLf'Ҫ�ȸ�ֵ
		iold=iold+1
	Loop
	Do While inew<getfilenewRows
		s2 = s2& filenewarray(inew) & vbCrLf
		inew=inew+1
	Loop
	If action=0 Then
		getCompAns=s1
	Else
		getCompAns=s2
	End if
End Function

Function getStringByLeftSplit(strline,iSplit,action)
	'MsgBox  stepstatus
	tmpstring=""
	ilen  		=Len(strline)
	iSplitlen   =Len(iSplit)
	iinstr=InStr(strline,iSplit)+iSplitlen-1
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
Function getStringByRightSplit(strline,isplit,action)
	'2016-10-31 10:01:37D:\�ݽ�������\����-M201610080075-��������-����-20161008-V1.rar
	tmpstring=""
	ilen  = Len(strline)
	iinstr= InStr(strline,iSplit)-1
'	if iinstr<0 then iinstr=0 end if
	If action=0 Then'ȡ��
		tmpstring=Left(strline,iinstr)
	Else 			'ȡ��
		tmpstring=Right(strline,ilen-iinstr)

	End If
	getStringByRightSplit=tmpstring
End Function
Sub unRarByFolderAndFile(filepath,filename)
	'��ʼ�� �� ·����ʼ��
	Set ws = CreateObject("WScript.Shell")
	currentpath = CreateObject("Scripting.FileSystemObject").GetFolder(".").Path
	
	ws.Run "unzip.bat"&" "&filepath&" "&currentpath&"\"&filename,1,true
End Sub
Sub setNewFile
	'�ȽϽ��
	Call sortFile("FileList.txt",0)
	Call sortFile("NewList.txt" ,0)
	s=getCompAns("FileList.txt","NewList.txt",1)'msgbox
	'ͨ���Ƚϻ�ȡ�����ļ����б�(�и�����Ϣʱ���)
	'2016-10-31 10:01:37D:\�ݽ�������\����-M201610080075-��������-����-20161008-V1.rar
	'V9 �����ж��е����?!!!
	sarray=Split(s,vbCrLf)
	s=""
	For Each strline In sarray
		s=s&getStringByRightSplit(strline,"D:\�ݽ�������\",1)&vbCrLf
	Next
	Call WriteTxtFile("NewFile.txt",s)
End Sub
Sub copyFileToFile(filename1,filename2)
	Set ws = CreateObject("WScript.Shell")
	currentpath = createobject("Scripting.FileSystemObject").GetFolder(".").Path
	'���ļ�1���Ƹ��ļ�2
	ws.Run "cmd /c"&" copy "&currentpath&"\"&filename1&" "&currentpath&"\"&filename2
	'wscript.sleep 1000
End Sub




Sub setClipboard(input)
	Set Ws=CreateObject("Wscript.Shell")
	Clipboard="MsHta vbscript:ClipBoardData.setData(""Text"","""&input&""")(Window.Close)"
	ws.Run(Clipboard)
	
End Sub
function getClipboard
	Set objHtmlDoc = CreateObject("htmlfile")
	call objHtmlDoc.parentWindow.clipboardData.setData("text","sdff")
	getClipboard = objHtmlDoc.parentWindow.clipboardData.GetData("text")'��ȡ��������Ϣ
	Set objHtmlDoc = Nothing
End function
Sub setKey(input)
	Set Ws=CreateObject("Wscript.Shell")
	WScript.Sleep 1000
	ws.SendKeys input
	'MsgBox "setkey"&input&"&"
End Sub
Sub step1'a.�ļ���ʱʵ���
	'��ȡ�ļ�����rar�б�
	stepstatus="step1"
	filepath = "D:\�ݽ�������"'����set
	s=getFileList(filepath,"rar","0",1)
	'�����µ��ļ��б�,���������е㲻�淶
	Call WriteTxtFile("NewList.txt",s)'���ù���(Sub)ʱ����ʹ������ call'FileList'NewList
	'�������ļ��б�(�ԱȺ���),���������е㲻�淶
	Call setNewFile
	'���ý�ѹbat
	Call unRarByFolderAndFile("D:\�ݽ�������","NewFile.txt")
	'���Ҫ��
	IsCoverFileList=InputBox("Enter your Y/N to create new Integrated package list:",,"Y")
	If StrComp(IsCoverFileList,"Y")=0 Then
		Call copyFileToFile("NewList.txt","FileList.txt")
	End if
End Sub
Sub step3'a����sql�б�
	stepstatus="step3"
	Call setSQLList
	
	
	s=createpdcListStringBySQLList'����pdc�б��Ӧ��string
	s=getStringOnPdcLog()& s & "spool off"'�ǵ�spool off
	Call WriteTxtFile("sqlpdc.pdc",s)'����pdc�б��Ӧ��pdc�ļ�
	'����20161108
	'setErrorInfoByExePCD
End Sub
Sub step4
	
End Sub

Function getStringArrayByFile(filename)
	currentpath = createobject("Scripting.FileSystemObject").GetFolder(".").Path
	Set file =getTxtReadFile(currentpath&"\"&filename)
	'MsgBox currentpath&"\"&filename
	'���볬�����ļ�β-800A003E-����û���ж��Լ�ʹ��readall���ļ��Ƿ��ǿ��ļ�������ǿվͻ᷵���������
	getStringArrayByFile=split(file.readall,vbCrLf)
	
End Function


function getLesstFileList(filename,itype)'�ο����ٱȽ�getCompAns
	'currentpath = createobject("Scripting.FileSystemObject").GetFolder(".").Path
	
	filearray=getStringArrayByFile(filename)
	fileRows=UBound(filearray)
	'MsgBox fileRows
	s1=""
	s2=""
	news=""
	CurlinePath=""
	'typelen=Len(itype)
	
	For Each strline In  filearray 
	'��SQLListӳ��Ϊ�µ�news,����Ϊ:
	'strline��path StrlinePath �뵱ǰ������path CurlinePath �Ƚ�,
	'���CurlinePath!=StrlinePath,��ô˵�����µ��ֶ�,���д���:
	'������ǻ�ȡ��һ��,���ǻ�ȡȫ��
	'����1:StrlinePath:"dsad" CurlinePath:"">>����dsad,����֮ǰ��
	'����2:StrlinePath:"dsad" CurlinePath:"dsad">>����dsad
	'����3:StrlinePath:"dsad" CurlinePath:"">>����"dsad",����֮ǰ��
		'��ȡStrlinePath

		StrlinePath=getStringByLeftSplit(strline,itype,0)
		'MsgBox strline&vbCrLf&StrlinePath&vbCrLf&CurlinePath&vbCrLf&StrComp(StrlinePath,CurlinePath)
		If StrComp(StrlinePath,CurlinePath)<>0 Then
		'If StrlinePath<>CurlinePath Then
			CurlinePath=StrlinePath'������ǻ�ȡ��һ��,���ǻ�ȡȫ��,û����
			news=news&strline&vbCrLf
		End If
	Next
	'���غ���д����
	getLesstFileList=news
End function
Sub setSQLList
'��ȡ�ļ�����sql�б�
	filepath = "D:\�ݽ�������\unrar"'
	s=getFileList(filepath,"sql","0",4)
	's=getFileList(filepath,"sql","0",2) û�а汾!!
	'MsgBox s
	'�����µ��ļ��б�,���������е㲻�淶
	Call WriteTxtFile("SQLList.txt",s)'���ù���(Sub)ʱ����ʹ������ call'FileList'NewList
	Call sortFile("SQLList.txt",1)
End Sub
Sub getLesstSQLList
	Call sortFile("SQLList.txt",1)'����
	s=getLesstFileList("SQLList.txt",".sql")
	'MsgBox s
	Call WriteTxtFile("LeastSQLList.txt",s)
End Sub
function getUserName(sqlfilename)
	
	If len(sqlfilename)=0 Then
		getUserName=""
		Exit function
	End if
	getSplitlen=3
	if len(sqlfilename)<getSplitlen then 
		getUserName="hs_data"
		Exit function
	End if
	'D:\�ݽ�������\unrar\asset_abksett_or.sql
	select case left(sqlfilename,getSplitlen)
		case "ass"		getUserName="hs_asset"
		case "bon"		getUserName="hs_bond"
		case "crd"		getUserName="hs_crdt"
		case "cbs"		getUserName="hs_cbs"
		case "fun"		getUserName="hs_fund"
		case "his"		getUserName="hs_his"
		case "ofu"		getUserName="hs_ofund"
		case "sec"		getUserName="hs_secu"
		case "use"		getUserName="hs_user"
		case "set"		getUserName="hs_sett"
		case "dat"		getUserName="hs_data"
		case "��ʱ_"	getUserName=getUserName(right(sqlfilename,len(sqlfilename)-2))
		case else 		msgbox "���ֿ���������"'getUserName="hs_data"
						wscript.quit
	end select
end function
function getConnByTNSname(UserName,TNSname)
	If len(UserName)=0 Then
		getConnByTNSname=""
		Exit function
	End if
	tmpstring="conn "&UserName&"/hundsun@"
	getConnByTNSname=tmpstring&TNSname
end function
function getTNSnameArrayByUserName(UserName)
	'MsgBox len(UserName)
	'Dim MyArray()
	If len(UserName)=0 Then
		getTNSnameArrayByUserName=Array()
		'MsgBox 374&UBound(getTNSnameArrayByUserName)
		exit function
	End if
	getSplitlen=6
	StringOnTNSname=""
	dim TNSname(5)
	'!!!!!!!!
	TNSname(0)="HS19.123"
	TNSname(1)="HS19.119"
	TNSname(2)="mzdbcrdt"
	'D:\�ݽ�������\unrar\asset_abksett_or.sql
	'conn hs_secu/hundsun@hs91
	
	select case left(UserName,getSplitlen)
		case "hs_ass"		StringOnTNSname=StringOnTNSname&TNSname(0)&vbCrLf
		case "hs_bon"		StringOnTNSname=StringOnTNSname&TNSname(0)&vbCrLf
		case "hs_crd"		StringOnTNSname=StringOnTNSname&TNSname(0)&vbCrLf
		case "hs_cbs"		StringOnTNSname=StringOnTNSname&TNSname(0)&vbCrLf
		case "hs_fun"		StringOnTNSname=StringOnTNSname&TNSname(0)&vbCrLf
							StringOnTNSname=StringOnTNSname&TNSname(1)&vbCrLf
							StringOnTNSname=StringOnTNSname&TNSname(2)&vbCrLf
		case "hs_his"		StringOnTNSname=StringOnTNSname&TNSname(0)&vbCrLf
		case "hs_ofu"		StringOnTNSname=StringOnTNSname&TNSname(0)&vbCrLf
		case "hs_sec"		StringOnTNSname=StringOnTNSname&TNSname(0)&vbCrLf
							StringOnTNSname=StringOnTNSname&TNSname(1)&vbCrLf
		case "hs_use"		StringOnTNSname=StringOnTNSname&TNSname(0)&vbCrLf
		case "hs_set"		StringOnTNSname=StringOnTNSname&TNSname(0)&vbCrLf
		case "hs_dat"		StringOnTNSname=StringOnTNSname&TNSname(0)&vbCrLf
		'case "��ʱ_"	getTNSnameArrayByUserName=getTNSnameArrayByUserName(right(UserName,len(UserName)-2))
		case else 		msgbox "���ֿ���������"'getTNSnameArrayByUserName="hs_data"
						wscript.quit
	end select
	'StringOnTNSname=Left(StringOnTNSname,len(StringOnTNSname)-2)
	StringOnTNSname=setNoEndVbcrLf(StringOnTNSname)
	ArrayOnTNSname=split(StringOnTNSname,vbCrLf)
	getTNSnameArrayByUserName=ArrayOnTNSname
	'msgbox "ArrayOnTNSname:ubound:"&ubound(ArrayOnTNSname)
end function
function getConnArrayByUserName(UserName)
	'MsgBox 406
	'MsgBox ubound(getTNSnameArrayByUserName(UserName))
	TNSnameArray=getTNSnameArrayByUserName(UserName)'array����set and array Ҫ��ʼ��Ϊ array()
	'MsgBox getTNSnameArrayByUserName
	ConnArray=""
	for each TNSname in TNSnameArray
		'msgbox "TNSname"&TNSname&"$"
		ConnArray=ConnArray&getConnByTNSname(UserName,TNSname)&vbCrLf
	next
	ConnArray=setNoEndVbcrLf(ConnArray)
	getConnArrayByUserName= split(ConnArray,vbCrLf)
end Function

Function setNoEndVbcrLf(strline)
	ilen  		=Len(strline)
	tmpstring=""
	If ilen-1<0 Then 
		tmpstring=""
	Else 
		tmpstring=Left(strline,ilen-1)
	End if
	setNoEndVbcrLf=tmpstring
End Function
function createpdcListStringBySQLList
	'MsgBox 432
	SQLList=getStringArrayByFile("SQLList.txt")'array
	
	curUserName=""
	news=""
	tmpnews=""'tmpnew��ʼ��
	iSplit="unrar\"
	'typelen=Len(iSplit)
	'MsgBox 440
	For Each strline In  SQLList 
		'D:\�ݽ�������\unrar\    asset_abksett_or.sql
		FolderPath =getStringByLeftSplit(strline,iSplit,0)'0��,1��
		SQLFilename=getStringByLeftSplit(strline,iSplit,1)'0��,1��
		'MsgBox 445
		newUserName=getUserName(SQLFilename)
		'���Ҫȫ��������ſ���д��
		'MsgBox 448&vbCrLf&curUserName&vbCrLf&newUserName
		'����Conn��Ϣ!!
		If StrComp(newUserName,curUserName)<>0 Then
			'�����û�����ȡTNSname
			ConnArray=getConnArrayByUserName(curUserName)
			'MsgBox 457
			
			'news=news&expTNSnameByUserName(curUserName)&vbCrLf
			For Each iConn In ConnArray
				'MsgBox 461
				
				news=news&iConn&vbCrLf
				news=news&tmpnews&vbCrLf
			Next
			'MsgBox 465
			tmpnews="" 'tmpnew��ʼ��
			curUserName=newUserName
			'���ص�ConnArrayһ����5��,�����������>>TNSnameArray������
			'MsgBox "469:"&strline&vbCrLf&curUserName&vbCrLf&tmpnews&vbCrLf&				news

		End If
		'news=news&"@"&strline&vbCrLf
		'���浱ǰ�û���Ҫ�����Ľű�
		tmpnews=tmpnews&"@"&strline&vbCrLf
	Next
	'MsgBox 473
	createpdcListStringBySQLList=news
end function
Sub createpdcList	
End Sub
Function getStringOnPdcLog()
	curpath=CreateObject("Scripting.FileSystemObject").GetFolder(".").Path
	getStringOnPdcLog="spool "&curpath&"\sqlpdc.log"&vbcrlf
End Function


Function getErrorInfoByErrorPrefixArray(filename,iArray)
	filearray=getStringArrayByFile(filename)
	fileRows=UBound(filearray)
	'MsgBox fileRows
	s1=""
	s2=""
	news=""
	CurlinePath=""
	'typelen=Len(itype)
	
	For Each strline In  filearray 
		'MsgBox strline
		'For Each item In Array("SP2-")
		For Each item In iArray
			'itemlen=Len(item)
			strlinePrefix=getStringByLeftSplit(strline,item,0)
			'MsgBox strline&vbCrLf&"item:"&item&vbCrLf & "strlinePrefix:" & strlinePrefix
			If StrComp(strlinePrefix,item)=0 Then
				'MsgBox "find error"&strline
				news=news&strline&vbcrlf
			End If
		Next
	Next
	getErrorInfoByErrorPrefixArray=news
End Function

Sub setErrorInfoByExePCD()
	
	'cmd����pdc
	Set ws = CreateObject("WScript.shell")
	pdcpath=CreateObject("Scripting.FileSystemObject").GetFolder(".").Path&"\sqlpdc.pdc"
	
	ws.Run "cmd /k "&"sqlplus /nolog @"&pdcpath,1,true
	wscript.sleep 10000
	ErrorPrefixArray=Array("SP2-","ERROR:","����","ORA-","WAR")
	s=getErrorInfoByErrorPrefixArray("sqlpdc.log",ErrorPrefixArray)
	MsgBox s
	Call WriteTxtFile("ErrorInfo.log",s)

End Sub
sub mymsgbox(strline)
	msgbox ":"&strline&":"
end sub
sub runexe(folderpath,filename)
	Set ws = CreateObject("WScript.Shell")
	if strcomp(folderpath,"")=0 then
	'if strcomp(folderpath,"") then
		ws.Run filename
	else
		cmdstring="cmd /k "&left(folderpath,2)
		cmdstring=cmdstring&" & "&"cd "&folderpath
		cmdstring=cmdstring&" & "&filename
		ws.Run cmdstring,1,True
	end if
	
	
end Sub
Function getFilePathByEveryting(filename)
	'�����ļ�·��begin
	setClipboard(filename)
	call runexe("","Everything.exe")
	'ws.Run "Everything.exe",1,True
	Set ws = CreateObject("WScript.Shell")
	setKey("^V")
	'ws.SendKeys "^V"'���
	'WScript.Sleep 2000
	setKey(Chr(13)) '�س�
	setKey("^+C")	'ctrl+shift+c-�����ļ�·��
	'�����ļ�·��end
	'WScript.Quit
	getFilePathByEveryting=getClipboard
	
End Function

Sub step2V2
	stepstatus="step2V2"
	'filepath="E:\hstrade20\Documents\D3.Testing\05-UF20���Թ��߿���\CodeToolUI\CodeToolUI.jar"
	filepath=getFilePathByEveryting("CodetoolUi.jar")
	'MsgBox filepath
	folderpath=getStringByRightSplit(filepath,"\CodeToolUI.jar",0)
	'msgbox folderpath
	call runexe(folderpath,"run.bat")
	'cmd��codetoolUi end
	WScript.Sleep 1000
End Sub

DebugAction=InputBox("Debug enterence: 1:��ѹ or 2:����codetoolUI or 3:����pdc 4:ִ��pdc")
stepstatus=""
for ichar = 1 to 5
	if instr(DebugAction,ichar) then
		select case ichar
			case 1 step1'a.�ļ���ʱʵ���,��ѹ�ļ�
			case 2 step2V2'����codetoolUI
			case 3 step3'���ɲ�ִ��pdc,��ʱֻ����,��ִ��
			case 4 setErrorInfoByExePCD'����20161108
		End select
	end if
next