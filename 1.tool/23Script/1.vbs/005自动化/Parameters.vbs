'AtoB
'Idto(A,B)--IdtoA,AtoB>>Idto(A,B)
'
'可能没有用了,用于检查对象的值是否正确
function msggenreportobject(iobject)
	if not(IsEmpty(iobject.key1))	then
		msgbox iobject.key1
	end if
	if not(IsEmpty(iobject.key2)) then
		msgbox iobject.key2
	end if
end function
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
'设置数据字典
function setDictionarg(ByRef dict,stringArray)
	for each strline in stringArray
		'对于非过滤的行,才处理
		if (instr("#'",Left(strline,1))=0) then
			set iobject=splitString(strline,VbTab)
			dict(iobject.key1)=iobject.key2
		end if
	next
	set setDictionarg=dict
end function
function Dictinit(Byref iobject)
	if IsEmpty(iobject) then
		set iobject=CreateObject("Scripting.Dictionary") 'genreportObjectList(1)=a,b
	end if
	set Dictinit=iobject
end function
set AtoB_Dict=Dictinit(AtoB_Dict)'VBS对象引用会有问题.
set IDtoB_Dict=Dictinit(IDtoAB_Dict)
set IDtoA_Dict=Dictinit(IDtoA_Dict)


'后台变量与前台控件的映射关第

'此类型用于,描述有关系的两个变量
Class rekey
    Dim key1,key2
End Class