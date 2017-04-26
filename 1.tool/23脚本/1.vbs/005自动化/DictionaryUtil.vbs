'字典打印
function showdict(dict)
	Dim objKeys, objItems, i
	strline=""
	objKeys = dict.Keys
	objItems = dict.Items
	For i = 0 To dict.Count - 1
		strline=strline&objKeys(i) & VbTab & objItems(i)&vbCrLf
	Next
	msgbox strline
end function
function showdict2(dict)
	Dim objKeys, objItems, i
	strline=""
	objKeys = dict.Keys
	objItems = dict.Items
	For i = 0 To dict.Count - 1
		strline=strline&objKeys(i) & VbTab & objItems(i)&vbCrLf
	Next
	msgbox strline
	Call WriteTxtFile("IDtoB.txt",strline)
end function
function setDictionarg(ByRef dict,stringArray)
	for each strline in stringArray
		'对于非过滤的行,才处理
		if (instr("#'",Left(strline,1))=0 ) then
			set iobject=splitString(strline,VbTab)
			dict(iobject.key1)=iobject.key2
		end if
	next
	set setDictionarg=dict
end function
function Dictinit(Byref iobject)
	set iobject=nothing
	if IsEmpty(iobject) then
		set iobject=CreateObject("Scripting.Dictionary") 'genreportObjectList(1)=a,b
	end if
	set Dictinit=iobject
end function

function AS_setEnvironment_DictByPath(Dict_name,filepath)
	Set Dict = CreateObject("Scripting.Dictionary")
	iArray=getStringArrayByFilepath(filepath)
	for each strline in iArray
		'对于非过滤的行,才处理
		if (instr("#'",Left(strline,1))=0 ) then
			set iobject=splitString(strline,VbTab)
			dict(iobject.key1)=iobject.key2
		end if
	next
	environment(Dict_name)=Dict
	set AS_setEnvironment_DictByPath=dict
end function