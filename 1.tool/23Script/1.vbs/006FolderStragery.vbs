'V1 2017-5-7 10:36:45 添加便利文件夹的函数:如果文件夹为空,则添加一个readme.txt
dim fso,ws

set fso = createobject("scripting.filesystemobject") 
set ws = createobject("wscript.shell") 
vbsname=WScript.ScriptName
vbsname=left(vbsname,len(vbsname)-4)
usr=fso.GetFile(Wscript.ScriptFullName).ParentFolder.Path&"\"&vbsname&"_usr\"

'ws.run usr&strline


'folderpath=InputBox("Please input FolderPath")
'iMethor=InputBox("Please input Stragery,What is you want to use in FolderPath?")
'iMethorPath=getPath_001(iMethor)
folderpath=InputCheck_folderPath("")

'iMethor=InputCheck_filePath(ARRAY("Please input Stragery,What is you want to use in FolderPath?"))
iMethorPath=InputCheck_filePath(ARRAY("Please input Stragery,What is you want to use in FolderPath?"))

function InputCheck_folderPath(Remark)
	if trim(Remark)="" then
		Remark="请选择文件夹路径"
	end if
	'inputvalue=InputBox(Remark)
	Set WshShell=CreateObject("Shell.Application") 
	'http://blog.csdn.net/a8_8a/article/details/47783447
	'set Folder=WshShell.BrowseForFolder(0, Remark,0x0211, usr)
	'set Folder=WshShell.BrowseForFolder(0, Remark,0211, usr) '<<<<<<default
	set Folder=WshShell.BrowseForFolder(0, Remark,0211, ws.ExpandEnvironmentStrings("%MYHOME%"))
	inputvalue=Folder.Self.Path
	'while	CreateObject("Scripting.FileSystemObject").FolderExists(inputvalue)=FALSE AND UCase(inputvalue)<>"EXIT"
	'	inputvalue=InputBox(Remark,,inputvalue)
	'wend
	'if UCase(inputvalue)="EXIT" then wscript.quit
	if UCase(inputvalue)="" then wscript.quit
	InputCheck_folderPath=inputvalue
end function
'function InputCheck_filePath(filePath,Remark="",envPath="")
function InputCheck_filePath(ARRArgs)
	'msgbox TypeName(ARRArgs)
	ARRLEN=UBound(ARRArgs)
	if ARRLEN<0 then
		Remark="Please input File"
	else
		Remark=ARRArgs(0)
	end if
	REM if ARRLEN<1 then
		REM envPath=ws.ExpandEnvironmentStrings("%MYSCRIPTHOME%")&"1.vbs\" 
	REM else
		REM envPath=ARRArgs(1)
	REM end if
	
	inputvalue=InputBox(Remark,,"ADD_README.vbs")
	while	FileIsExist(inputvalue)=FALSE AND UCase(inputvalue)<>"EXIT"
		inputvalue=InputBox(Remark,,inputvalue)
	wend
	if UCase(inputvalue)="EXIT" then wscript.quit
	InputCheck_filePath=inputvalue
end function


On Error Resume Next

'Set fso = CreateObject("Scripting.FileSystemObject")
function getFolder(folderpath)
	Set FSO = CreateObject("Scripting.FileSystemObject")
	If fso.FolderExists(folderpath)=FALSE Then
		'ReportProgress if errorhappen
		msgbox		folderpath&" 文件中的路径找不到，请配置正确！",2
		wscript.quit
	else
		set getFolder=FSO.GetFolder(folderpath) 
	end if
end function
function FileIsExist(ByRef filepath)
	
	FileIsExist=FALSE
	Set FSO = CreateObject("Scripting.FileSystemObject")
	if fso.FileExists(filepath) then
		FileIsExist=TRUE
	end if
	envPath=ws.ExpandEnvironmentStrings("%MYSCRIPTHOME%")&"1.vbs\"
	if fso.FileExists(envPath&filepath) then
		filepath=envPath&filepath
		FileIsExist=TRUE
	end if
	if fso.FileExists(usr&filepath) then
		filepath=usr&filepath
		FileIsExist=TRUE
	end if
end function
REM function getPath_FromUSR(filepath)
	REM Set FSO = CreateObject("Scripting.FileSystemObject")
	REM if FSO.FileExists(filepath) then
		REM getPath_FromUSR=filepath
	REM else
		REM filepath=usr&filepath
		REM if FSO.FileExists(filepath)=FALSE then
			REM msgbox		filepath&" 文件中的路径找不到，请配置正确！",2
			REM wscript.quit
		REM end if
		REM getPath_FromUSR=filepath
	REM end if
REM end function
sub FolderStragery(Folder)
	For Each item In Folder.SubFolders
		if	instr(item.path,"'")=0 and instr(item.path,"#")=0	and instr(item.path,"\.")=0	then
			FolderStragery(item)
		end if
	next
	'msgbox Folder.path
	ws.run iMethorPath&" "&Folder.path
end sub
set folder=getFolder(folderpath)
call FolderStragery(Folder)