'============================================================================
' Name         : 008MYHOME
' Author       : hz
' Version      : V0.1
' Date         : 20170516  
' License      : No License
' Description  : this is a start menu,you could use it as a help list.
'============================================================================

set fso = createobject("scripting.filesystemobject")
set ws = createobject("wscript.shell")
vbsname=WScript.ScriptName
vbsname=left(vbsname,len(vbsname)-4)
usr=fso.GetFile(Wscript.ScriptFullName).ParentFolder.Path&"\"&vbsname&"_usr\"

'ws.run usr&strline

strarray=split(FSO.opentextfile(usr&"operlist.txt").readall,vbCrLf)
'setDict from ftd
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
function setDictionarg(ByRef dict,stringArray)
	for each strline in stringArray
		'对于非过滤的行,才处理
		if (instr("#'",Left(strline,1))=0 ) then
			set iobject=splitString(strline,":")
			dict(iobject.key1)=iobject.key2
		end if
	next
	set setDictionarg=dict
end function
Set dict_oper = CreateObject("Scripting.Dictionary")
set dict_oper = setDictionarg(dict_oper,strarray)

'''''''''''''''''''''''''''''
ActionList=InputBox("enterence with|: "&vbCrLf&strlines)
if ActionList="" then WScript.quit


for each item in split(ActionList,"|")
	ws.run item
next
