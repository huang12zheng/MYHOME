'AtoB
'Idto(A,B)--IdtoA,AtoB>>Idto(A,B)
'
'����û������,���ڼ������ֵ�Ƿ���ȷ
function msggenreportobject(iobject)
	if not(IsEmpty(iobject.key1))	then
		msgbox iobject.key1
	end if
	if not(IsEmpty(iobject.key2)) then
		msgbox iobject.key2
	end if
end function
'�ֵ��ӡ
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
'���������ֵ�
function setDictionarg(ByRef dict,stringArray)
	for each strline in stringArray
		'���ڷǹ��˵���,�Ŵ���
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
set AtoB_Dict=Dictinit(AtoB_Dict)'VBS�������û�������.
set IDtoB_Dict=Dictinit(IDtoAB_Dict)
set IDtoA_Dict=Dictinit(IDtoA_Dict)


'��̨������ǰ̨�ؼ���ӳ��ص�

'����������,�����й�ϵ����������
Class rekey
    Dim key1,key2
End Class