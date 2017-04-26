'V9 20161108 cmd调用codetoolUI,
'V8 20161108 补充修改说明:1.依据Sqllist生成pdc文件;2对生成结果进行处理,生成errorinfo
'V7.1 20161107 只使用setSQLList,getFileListcase添加场景4,只获取路径
'V7.0 20161107 用生成对应的SQL文件列表及新增函数setSQLList,getLesstSQLList
'V6 20161106 用NewList替换FileList
'V5 20161106 调用unRAR(),unRAR.bat脚本
'V4.1 20161106 建立getStringByRightSplit(s),获取比较结果,除去日期 及 获取新增文件的列表
'V4.0 20161106 建立getNewFile(Filename),获取比较结果
'V3 20161106 修改getFileList,建立唯一增序索引-时间(名称没有增序的特点)
'V2 20161104 建立WriteTxtFile(filename) 在当前目录下
'V1 20161104 临时版本
Function getFileListcase(file,action)
	select Case action
		Case 1 getFileListcase=file.DateCreated & file.Path
		Case 2 getFileListcase=CreateObject("Scripting.FileSystemObject").GetFileVersion(file.Path)&vbTab &file.Path
		Case 3 getFileListcase=file.Path&file.DateCreated
		Case 4 getFileListcase=file.Path
	End select
End Function

function getFileList(filepath,itype,action,caseaction)'itype文件类型,action是否递归
  set folder=getFolder(filepath)
  s=""
  iTypeLength=len(itype)
  IF itype <> " " then '是文件
	  For Each file In folder.Files '遍历文件
	  
		ext = LCase(Right(file.Name, iTypeLength+1)) '获取扩展名
		If ext = "."&itype Then
		  'V3 20161106 修改getFileList,建立唯一增序索引-时间(名称没有增序的特点)
		  s = s & getFileListcase(file,caseaction)
		  's = s & file.DateCreated & file.Path
		  s = s & vbCrLf
		End If
	  Next
  ELSE
	  For Each file In folder.SubFolders '遍历文件夹
	    'V3 20161106 修改getFileList,建立唯一增序索引-时间(名称没有增序的特点)
		s = s & getFileListcase(file,caseaction)
		s = s & vbCrLf
	  Next
  END If
  'getFileList(file,itype,action) '递归当action=1
  if action="1" then 
		For Each file In folder.SubFolders  '遍历文件夹
				s=s & getFileList(file,itype,action,caseaction) '递归
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
msgbox		"enviroment文件中的测试路径找不到，请确认你的environment文件配置正确！",2
wscript.quit
	else
		''folder = ws.RegRead(filepath) ''未来可能要获取注册表
		set getFolder=FSO.GetFolder(filepath) 
		'MsgBox FSO.GetFolder(filepath).Path '展示文件夹路径
	end if
end function
function getTxtWriteFile(filepath)
	Set FSO = CreateObject("Scripting.FileSystemObject")
	if FSO.fileExists(filepath)=false then 
		msgbox "文件配置有误 getTxtWriteFile"
		wscript.quit
	end if
	set getTxtWriteFile=FSO.opentextfile(filepath,2,true) 
end Function
function getTxtReadFile(filepath)
	Set FSO = CreateObject("Scripting.FileSystemObject")
	if FSO.fileExists(filepath)=false then 
		msgbox "文件配置有误 getTxtReadFile"
		wscript.quit
	end if
	set getTxtReadFile=FSO.opentextfile(filepath)
	
	'set getTxtReadFile=FSO.GetFile(filepath) '注意getTxtReadFile和getTxtWriteFile有不同
end function
function WriteTxtFile(filename,s)
	'cmd创建filename对应的txt文件
	Set ws = CreateObject("WScript.Shell")
	ws.Run "cmd /c "&"echo>"&filename
	wscript.sleep 1000

	'获取txt文件路径 
	currentpath = createobject("Scripting.FileSystemObject").GetFolder(".").Path
	filepath=currentpath&"\"&filename'不要少了\,不然对象不匹配
	'获取对象
	set file=getTxtWriteFile(filepath)
	
	'写文件
	file.write(s)
	file.close
	WriteTxtFile=true
end function
function sortFile(filename,action)'action=0 顺序 action=1 倒序
	'创建txt文件
	Set ws = CreateObject("WScript.Shell")
	'cmd排序
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
	'获取对比文件对象
	
	'获取对比文件数据化 及 行数
	fileoldarray=getStringArrayByFile(filename1)
	filenewarray=getStringArrayByFile(filename2)
	getfileoldRows=UBound(fileoldarray)
	getfilenewRows=UBound(filenewarray)
	'Wscript.Quit 调试时用
	s1=""
	s2=""
	'快速比较,获取s1,s2,对应不同文件多余项
	iold=0:inew=0 '不是&
	Do While iold<getfileoldRows And inew<getfilenewRows 'iold是从0开始的
		'MsgBox fileoldarray(iold) 调试时用
		'MsgBox fileoldarray(inew) 调试时用
		cmpans=StrComp(fileoldarray(iold),filenewarray(inew))
		If cmpans=0 Then
			iold=iold+1
			inew=inew+1
		ElseIf cmpans=-1 then '说明是多出来的
			s1 = s1& fileoldarray(iold) & vbCrLf
			iold=iold+1
		ElseIf cmpans= 1 then '说明是多出来的
			s2 = s2& filenewarray(inew) & vbCrLf
			inew=inew+1
		End If
	loop
	Do While iold<getfileoldRows
		s1 = s1& fileoldarray(iold) & vbCrLf'要先赋值
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
	If action=0 Then'取左
		tmpstring=Left(strline,iinstr)
	Else 			'取右
		If ilen-iinstr<0 Then 
			tmpstring=""
		Else 
			tmpstring=Right(strline,ilen-iinstr)
		End if
	End If
	getStringByLeftSplit=tmpstring
End Function
Function getStringByRightSplit(strline,isplit,action)
	'2016-10-31 10:01:37D:\递交包下载\集成-M201610080075-日终清算-蒋迪-20161008-V1.rar
	tmpstring=""
	ilen  = Len(strline)
	iinstr= InStr(strline,iSplit)-1
'	if iinstr<0 then iinstr=0 end if
	If action=0 Then'取左
		tmpstring=Left(strline,iinstr)
	Else 			'取右
		tmpstring=Right(strline,ilen-iinstr)

	End If
	getStringByRightSplit=tmpstring
End Function
Sub unRarByFolderAndFile(filepath,filename)
	'初始化 及 路径初始化
	Set ws = CreateObject("WScript.Shell")
	currentpath = CreateObject("Scripting.FileSystemObject").GetFolder(".").Path
	
	ws.Run "unzip.bat"&" "&filepath&" "&currentpath&"\"&filename,1,true
End Sub
Sub setNewFile
	'比较结果
	Call sortFile("FileList.txt",0)
	Call sortFile("NewList.txt" ,0)
	s=getCompAns("FileList.txt","NewList.txt",1)'msgbox
	'通过比较获取新增文件的列表(有附加信息时间的)
	'2016-10-31 10:01:37D:\递交包下载\集成-M201610080075-日终清算-蒋迪-20161008-V1.rar
	'V9 可能有多行的情况?!!!
	sarray=Split(s,vbCrLf)
	s=""
	For Each strline In sarray
		s=s&getStringByRightSplit(strline,"D:\递交包下载\",1)&vbCrLf
	Next
	Call WriteTxtFile("NewFile.txt",s)
End Sub
Sub copyFileToFile(filename1,filename2)
	Set ws = CreateObject("WScript.Shell")
	currentpath = createobject("Scripting.FileSystemObject").GetFolder(".").Path
	'将文件1复制给文件2
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
	getClipboard = objHtmlDoc.parentWindow.clipboardData.GetData("text")'获取剪贴板信息
	Set objHtmlDoc = Nothing
End function
Sub setKey(input)
	Set Ws=CreateObject("Wscript.Shell")
	WScript.Sleep 1000
	ws.SendKeys input
	'MsgBox "setkey"&input&"&"
End Sub
Sub step1'a.文件夹时实监控
	'获取文件夹下rar列表
	stepstatus="step1"
	filepath = "D:\递交包下载"'不用set
	s=getFileList(filepath,"rar","0",1)
	'生成新的文件列表,可以命名有点不规范
	Call WriteTxtFile("NewList.txt",s)'调用过程(Sub)时不能使用括号 call'FileList'NewList
	'生成新文件列表(对比后结果),可以命名有点不规范
	Call setNewFile
	'调用解压bat
	Call unRarByFolderAndFile("D:\递交包下载","NewFile.txt")
	'最后要打开
	IsCoverFileList=InputBox("Enter your Y/N to create new Integrated package list:",,"Y")
	If StrComp(IsCoverFileList,"Y")=0 Then
		Call copyFileToFile("NewList.txt","FileList.txt")
	End if
End Sub
Sub step3'a生成sql列表
	stepstatus="step3"
	Call setSQLList
	
	
	s=createpdcListStringBySQLList'生成pdc列表对应的string
	s=getStringOnPdcLog()& s & "spool off"'记得spool off
	Call WriteTxtFile("sqlpdc.pdc",s)'生成pdc列表对应的pdc文件
	'调试20161108
	'setErrorInfoByExePCD
End Sub
Sub step4
	
End Sub

Function getStringArrayByFile(filename)
	currentpath = createobject("Scripting.FileSystemObject").GetFolder(".").Path
	Set file =getTxtReadFile(currentpath&"\"&filename)
	'MsgBox currentpath&"\"&filename
	'输入超出了文件尾-800A003E-在于没有判断自己使用readall的文件是否是空文件，如果是空就会返回这个错误。
	getStringArrayByFile=split(file.readall,vbCrLf)
	
End Function


function getLesstFileList(filename,itype)'参考快速比较getCompAns
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
	'将SQLList映射为新的news,规则为:
	'strline的path StrlinePath 与当前存留的path CurlinePath 比较,
	'如果CurlinePath!=StrlinePath,那么说明是新的字段,进行处理:
	'但这个是获取第一条,不是获取全部
	'场景1:StrlinePath:"dsad" CurlinePath:"">>保留dsad,处理之前的
	'场景2:StrlinePath:"dsad" CurlinePath:"dsad">>保留dsad
	'场景3:StrlinePath:"dsad" CurlinePath:"">>保留"dsad",处理之前的
		'获取StrlinePath

		StrlinePath=getStringByLeftSplit(strline,itype,0)
		'MsgBox strline&vbCrLf&StrlinePath&vbCrLf&CurlinePath&vbCrLf&StrComp(StrlinePath,CurlinePath)
		If StrComp(StrlinePath,CurlinePath)<>0 Then
		'If StrlinePath<>CurlinePath Then
			CurlinePath=StrlinePath'但这个是获取第一条,不是获取全部,没问题
			news=news&strline&vbCrLf
		End If
	Next
	'返回函数写错了
	getLesstFileList=news
End function
Sub setSQLList
'获取文件夹下sql列表
	filepath = "D:\递交包下载\unrar"'
	s=getFileList(filepath,"sql","0",4)
	's=getFileList(filepath,"sql","0",2) 没有版本!!
	'MsgBox s
	'生成新的文件列表,可以命名有点不规范
	Call WriteTxtFile("SQLList.txt",s)'调用过程(Sub)时不能使用括号 call'FileList'NewList
	Call sortFile("SQLList.txt",1)
End Sub
Sub getLesstSQLList
	Call sortFile("SQLList.txt",1)'降序
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
	'D:\递交包下载\unrar\asset_abksett_or.sql
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
		case "临时_"	getUserName=getUserName(right(sqlfilename,len(sqlfilename)-2))
		case else 		msgbox "发现可能有问题"'getUserName="hs_data"
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
	'D:\递交包下载\unrar\asset_abksett_or.sql
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
		'case "临时_"	getTNSnameArrayByUserName=getTNSnameArrayByUserName(right(UserName,len(UserName)-2))
		case else 		msgbox "发现可能有问题"'getTNSnameArrayByUserName="hs_data"
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
	TNSnameArray=getTNSnameArrayByUserName(UserName)'array不用set and array 要初始化为 array()
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
	tmpnews=""'tmpnew初始化
	iSplit="unrar\"
	'typelen=Len(iSplit)
	'MsgBox 440
	For Each strline In  SQLList 
		'D:\递交包下载\unrar\    asset_abksett_or.sql
		FolderPath =getStringByLeftSplit(strline,iSplit,0)'0左,1右
		SQLFilename=getStringByLeftSplit(strline,iSplit,1)'0左,1右
		'MsgBox 445
		newUserName=getUserName(SQLFilename)
		'这个要全部处理完才可以写入
		'MsgBox 448&vbCrLf&curUserName&vbCrLf&newUserName
		'生成Conn信息!!
		If StrComp(newUserName,curUserName)<>0 Then
			'依据用户名获取TNSname
			ConnArray=getConnArrayByUserName(curUserName)
			'MsgBox 457
			
			'news=news&expTNSnameByUserName(curUserName)&vbCrLf
			For Each iConn In ConnArray
				'MsgBox 461
				
				news=news&iConn&vbCrLf
				news=news&tmpnews&vbCrLf
			Next
			'MsgBox 465
			tmpnews="" 'tmpnew初始化
			curUserName=newUserName
			'返回的ConnArray一定是5个,这样有问题的>>TNSnameArray有问题
			'MsgBox "469:"&strline&vbCrLf&curUserName&vbCrLf&tmpnews&vbCrLf&				news

		End If
		'news=news&"@"&strline&vbCrLf
		'保存当前用户需要升级的脚本
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
	
	'cmd调用pdc
	Set ws = CreateObject("WScript.shell")
	pdcpath=CreateObject("Scripting.FileSystemObject").GetFolder(".").Path&"\sqlpdc.pdc"
	
	ws.Run "cmd /k "&"sqlplus /nolog @"&pdcpath,1,true
	wscript.sleep 10000
	ErrorPrefixArray=Array("SP2-","ERROR:","警告","ORA-","WAR")
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
	'复制文件路径begin
	setClipboard(filename)
	call runexe("","Everything.exe")
	'ws.Run "Everything.exe",1,True
	Set ws = CreateObject("WScript.Shell")
	setKey("^V")
	'ws.SendKeys "^V"'黏贴
	'WScript.Sleep 2000
	setKey(Chr(13)) '回车
	setKey("^+C")	'ctrl+shift+c-复制文件路径
	'复制文件路径end
	'WScript.Quit
	getFilePathByEveryting=getClipboard
	
End Function

Sub step2V2
	stepstatus="step2V2"
	'filepath="E:\hstrade20\Documents\D3.Testing\05-UF20测试工具开发\CodeToolUI\CodeToolUI.jar"
	filepath=getFilePathByEveryting("CodetoolUi.jar")
	'MsgBox filepath
	folderpath=getStringByRightSplit(filepath,"\CodeToolUI.jar",0)
	'msgbox folderpath
	call runexe(folderpath,"run.bat")
	'cmd打开codetoolUi end
	WScript.Sleep 1000
End Sub

DebugAction=InputBox("Debug enterence: 1:解压 or 2:调用codetoolUI or 3:生成pdc 4:执行pdc")
stepstatus=""
for ichar = 1 to 5
	if instr(DebugAction,ichar) then
		select case ichar
			case 1 step1'a.文件夹时实监控,解压文件
			case 2 step2V2'调用codetoolUI
			case 3 step3'生成并执行pdc,暂时只生成,不执行
			case 4 setErrorInfoByExePCD'调试20161108
		End select
	end if
next