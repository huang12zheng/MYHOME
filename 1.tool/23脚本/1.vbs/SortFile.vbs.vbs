Function fSortArray(aSortThisArray)
	Dim oArrayList, iElement
	Set oArrayList = CreateObject( "System.Collections.ArrayList" )
	'对象重构,以便使用新方法
	For iElement = 0 To UBound(aSortThisArray)
		oArrayList.Add aSortThisArray(iElement)
	Next
	oArrayList.Sort
	set fSortArray = oArrayList
End Function 
set ws=createobject("WSCRIPT.SHELL")
set fso=createobject("Scripting.FileSystemObject")
Set unNamedArguments = WScript.Arguments.UnNamed
if unNamedArguments.count <> 1 then
	wscript.quit
else
	filepath=unNamedArguments.Item(0)
	old_array=split(fso.opentextfile(FilePath).readall,vbCrLf)
	'这里有一个set
	set new_array=fSortArray(old_array)
	'排序之后，开始写入文件
	strlines=""
	for each item in new_array
		if item<>"" then
			strlines=strlines&item&vbCrLf
		end if
	next
	set MYFILE = fso.opentextfile(filepath,2,true)
	MYFILE.write strlines
end if
