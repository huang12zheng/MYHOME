
'getTxtReadFile,getStringArrayByFilepath 是获取文件,然后数组化
function WriteTxtFile(filename,s)
	'cmd创建filename对应的txt文件
	Set ws = CreateObject("WScript.Shell")
	ws.Run "cmd /c "&"echo>"&filename
	wscript.sleep 1000

	'获取txt文件路径 
	currentpath = createobject("Scripting.FileSystemObject").GetFolder(".").Path
	filepath=currentpath&"\"&filename'不要少了\,不然对象不匹配
	'获取对象
	Set FSO = CreateObject("Scripting.FileSystemObject")
	set file=FSO.opentextfile(filepath,2,true)
	
	
	'写文件
	file.write(s)
	file.close
	WriteTxtFile=true
end function
function getTxtReadFile(filepath)
	Set FSO = CreateObject("Scripting.FileSystemObject")
	if FSO.fileExists(filepath)=false then 
		msgbox "文件配置有误 getTxtReadFile"
		wscript.quit
	end if
	set getTxtReadFile=FSO.opentextfile(filepath)
end function
Function getStringArrayByFilepath(filepath)
	Set file =getTxtReadFile(filepath)
	getStringArrayByFilepath=split(file.readall,vbCrLf)
End Function


'
Function splitString(strline,iSplit)
	Set iobject = New rekey
	ilen  		=Len(strline)
	iSplitlen   =Len(iSplit)
	iinstr=InStr(strline,iSplit)
	'变量赋值
	iobject.key1	=Left(strline,iinstr-1)
	iobject.key2	=Right(strline,ilen-iinstr)
	set splitString=iobject
end function
Function SaveFile(filepath,filename)

	Set WshShell = CreateObject("WScript.Shell")  
	'输入路径
	If not filepath = "" Then
		WshShell.SendKeys "E:\Genreport"
		WshShell.SendKeys "{ENTER}"
		wait 1
	End If
	'输入文件名
	WshShell.SendKeys filename
	WshShell.SendKeys "{ENTER}"
	wait 1
	call HSRCP_WaitWindow("确认另存为")
	
	'关闭弹窗
	WshShell.SendKeys "{ENTER}"
	'HSRCP_WaitWindowText()	'调用crj的函数
	call HSRCP_WaitWindow("Confirm")
	'call HSRCP_WaitWindow("") 会打开别的程序
	Set WshShell = Nothing
	
End Function
Function setClipboard(input)
	Set Ws=CreateObject("Wscript.Shell")
	Clipboard="MsHta vbscript:ClipBoardData.setData(""Text"","""&input&""")(Window.Close)"
	Ws.Run(Clipboard)
	set Ws=nothing
End Function
Function getItem(strlines,id,splits)
	getItem=""
	iarray=split(strlines,vbLf)
	for each strline in iarray
		'对于非过滤的行,才处理
		if (instr(" '",Left(strline,1))=0 ) then
			set iobject=splitString(strline," ")
			if iobject.key1=id then
				getItem=strline
				exit for
			End if
		end if
	next
End Function