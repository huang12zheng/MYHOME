Function include(file) '���������ļ�������VBS�����������
	Str=CreateObject("Scripting.FileSystemObject").OpenTextFile(file,1).ReadAll
	ExecuteGlobal Str
End Function

include "Parameters.vbs"
include "FileUtil.vbs"

	'��ȡ�������[IdA_List],��ת��Ϊ����,Ԫ��Ϊÿ���ַ���
IdtoAstringArray=getStringArrayByFilepath("E:\�Զ������Թ���2.0\QTP\TYBB_UI\AConditionByTable.txt")
	'��ȡ�������[AtoB_List],��ת��Ϊ����,Ԫ��Ϊÿ���ַ���
AtoBstringArray=getStringArrayByFilepath("E:\�Զ������Թ���2.0\QTP\TYBB_UI\AtoBCondition.txt")

strline=IdtoAstringArray(1)
msgbox strline
set iobject=splitString(strline,VbTab)
call msggenreportobject(iobject)