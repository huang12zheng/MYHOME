Function include(file) '载入其他文件并当作VBS代码加载运行
	Str=CreateObject("Scripting.FileSystemObject").OpenTextFile(file,1).ReadAll
	ExecuteGlobal Str
End Function

include "Parameters.vbs"
include "FileUtil.vbs"

	'获取处理对象[IdA_List],并转换为数组,元素为每行字符串
IdtoAstringArray=getStringArrayByFilepath("E:\自动化测试工具2.0\QTP\TYBB_UI\AConditionByTable.txt")
	'获取处理对象[AtoB_List],并转换为数组,元素为每行字符串
AtoBstringArray=getStringArrayByFilepath("E:\自动化测试工具2.0\QTP\TYBB_UI\AtoBCondition.txt")

strline=IdtoAstringArray(1)
msgbox strline
set iobject=splitString(strline,VbTab)
call msggenreportobject(iobject)