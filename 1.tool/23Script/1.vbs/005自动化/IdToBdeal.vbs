Function include(file) '���������ļ�������VBS�����������
	Str=CreateObject("Scripting.FileSystemObject").OpenTextFile(file,1).ReadAll
	ExecuteGlobal Str
End Function

'include "Parameters.vbs"
'include "FileUtil.vbs"
include "E:\�Զ������Թ���2.0\QTP\TYBB_UI\Parameters.vbs"
include "E:\�Զ������Թ���2.0\QTP\TYBB_UI\FileUtil.vbs"


function eleswitch(item)
	'msgbox item&"|"&MID(item,9,3)
	Select Case MID(item,9,3)'special_
		Case "edi" n_item="ed_"&item
		Case "chc" n_item="chc_"&item
		Case "cmb" n_item="cmb_"&item
		Case "chb" n_item="chc_"&item
	end Select
	eleswitch=n_item
end function

'����A��B,��ת��.
function switch(strline)
	elementArray=split(strline,"|")
	n_strline=""
	for each item in elementArray
		if AtoB_Dict.Exists(item) then
			n_strline=n_strline&AtoB_Dict(item)&"|"
		else
			if (instr(item,"special_edit")>0 or instr(item,"special_chc")>0 or	instr(item,"special_cmb")>0	or	instr(item,"special_chbc")>0) then
			'if (instr(ed_special_edit")>0 or instr(item,"chc_special_chc")>0 or	instr(item,"cmb_special_cmb")>0	or	instr(item,"chc_special_chbc")>0) then
				'ȡ��һ��,֮���.
				item=Left(item,instr(item,",")-1)
				n_item=eleswitch(item)
				if not (n_item="") then
					n_strline=n_strline & n_item&"|"
				end if
				'msgbox "'"&item&":"&n_item&"'"
			end if
		end if
	next
	switch=n_strline
	'ת������  msgbox n_strline
end function
	'����ID���ؼ�B����ӳ���ϵ
function setIDtoB(IDtoA_Dict,AtoB_Dict)
	set tmpdict=Dictinit(tmpdict)
	Dim objKeys, objItems, i
	objKeys = IDtoA_Dict.Keys
	objItems = IDtoA_Dict.Items
	'msgbox AtoB_Dict.Count
	For i = 0 To IDtoA_Dict.Count - 1
		'����A��B,��ת��.
		'msgbox objItems(i)  ת��ǰ���
		n_strline=switch(objItems(i))
		tmpdict(objKeys(i))=n_strline
	Next
	set setIDtoB=tmpdict
end function
function runMain()
'��ȡ�������[IdA_List],��ת��Ϊ����,Ԫ��Ϊÿ���ַ���
	IdtoAstringArray=getStringArrayByFilepath("E:\�Զ������Թ���2.0\QTP\TYBB_UI\AConditionByTable.txt")
'��ȡ�������[AtoB_List],��ת��Ϊ����,Ԫ��Ϊÿ���ַ���
	AtoBstringArray=getStringArrayByFilepath("E:\�Զ������Թ���2.0\QTP\TYBB_UI\AtoBCondition.txt")
'''���ɶ�Ӧ���ֵ�[��ϣӳ��]
	'msgbox UBound(AtoBstringArray)
	
	call setDictionarg(AtoB_Dict,AtoBstringArray)'��ǰ�˻صĻ��ǲ����ж����.
	call setDictionarg(IDtoA_Dict,IdtoAstringArray)
'����ֵ��Ƿ���ȷ
'	msgbox AtoB_Dict.count
'	showdict(AtoB_Dict)
	msgbox "IDtoA_Dict:"&IDtoA_Dict.count
	'showdict(IDtoA_Dict)
'����IDto�ؼ�B
	set IDtoB_Dict=setIDtoB(IDtoA_Dict,AtoB_Dict)
	'msgbox IDtoB_Dict("1")
	showdict2(IDtoB_Dict)
end function