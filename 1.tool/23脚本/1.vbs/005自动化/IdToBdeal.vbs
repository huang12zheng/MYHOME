Function include(file) '载入其他文件并当作VBS代码加载运行
	Str=CreateObject("Scripting.FileSystemObject").OpenTextFile(file,1).ReadAll
	ExecuteGlobal Str
End Function

'include "Parameters.vbs"
'include "FileUtil.vbs"
include "E:\自动化测试工具2.0\QTP\TYBB_UI\Parameters.vbs"
include "E:\自动化测试工具2.0\QTP\TYBB_UI\FileUtil.vbs"


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

'进行A到B,的转换.
function switch(strline)
	elementArray=split(strline,"|")
	n_strline=""
	for each item in elementArray
		if AtoB_Dict.Exists(item) then
			n_strline=n_strline&AtoB_Dict(item)&"|"
		else
			if (instr(item,"special_edit")>0 or instr(item,"special_chc")>0 or	instr(item,"special_cmb")>0	or	instr(item,"special_chbc")>0) then
			'if (instr(ed_special_edit")>0 or instr(item,"chc_special_chc")>0 or	instr(item,"cmb_special_cmb")>0	or	instr(item,"chc_special_chbc")>0) then
				'取第一个,之左的.
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
	'转换后检查  msgbox n_strline
end function
	'设置ID到控件B的新映射关系
function setIDtoB(IDtoA_Dict,AtoB_Dict)
	set tmpdict=Dictinit(tmpdict)
	Dim objKeys, objItems, i
	objKeys = IDtoA_Dict.Keys
	objItems = IDtoA_Dict.Items
	'msgbox AtoB_Dict.Count
	For i = 0 To IDtoA_Dict.Count - 1
		'进行A到B,的转换.
		'msgbox objItems(i)  转换前检查
		n_strline=switch(objItems(i))
		tmpdict(objKeys(i))=n_strline
	Next
	set setIDtoB=tmpdict
end function
function runMain()
'获取处理对象[IdA_List],并转换为数组,元素为每行字符串
	IdtoAstringArray=getStringArrayByFilepath("E:\自动化测试工具2.0\QTP\TYBB_UI\AConditionByTable.txt")
'获取处理对象[AtoB_List],并转换为数组,元素为每行字符串
	AtoBstringArray=getStringArrayByFilepath("E:\自动化测试工具2.0\QTP\TYBB_UI\AtoBCondition.txt")
'''生成对应的字典[哈希映射]
	'msgbox UBound(AtoBstringArray)
	
	call setDictionarg(AtoB_Dict,AtoBstringArray)'提前退回的话是不会有对象的.
	call setDictionarg(IDtoA_Dict,IdtoAstringArray)
'检查字典是否正确
'	msgbox AtoB_Dict.count
'	showdict(AtoB_Dict)
	msgbox "IDtoA_Dict:"&IDtoA_Dict.count
	'showdict(IDtoA_Dict)
'生成IDto控件B
	set IDtoB_Dict=setIDtoB(IDtoA_Dict,AtoB_Dict)
	'msgbox IDtoB_Dict("1")
	showdict2(IDtoB_Dict)
end function