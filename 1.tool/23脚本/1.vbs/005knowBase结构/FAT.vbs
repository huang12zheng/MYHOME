WORKPATH=createobject("Scripting.FileSystemObject").GetFolder(".").Path
KNOWPATH=createobject("Scripting.FileSystemObject").GetFolder(".\֪ʶ��Ԫ").Path
'BUSIPATH=createobject("Scripting.FileSystemObject").GetFolder(".\ҵ���").Path
'MENUPATH=createobject("Scripting.FileSystemObject").GetFolder(".\�˵���").Path

Set oFso	= CreateObject("Scripting.FileSystemObject")    
Set oFolder = oFso.GetFolder(KNOWPATH)
busilist=""
menulist=""
sub writelog(str)
	Set ws = CreateObject("WScript.shell")
	ws.Run "cmd /Q echo "&str&">>log.txt"
end sub
function iappend(str, appendstr)
	if str="" then
		iappend=appendstr
	else
		iappend=str&";"&appendstr
	end if
end function
sub createfolder(path,foldlist)
	Set ws = CreateObject("WScript.shell")
	ws.Run "cmd /Q/C cd "&path&" & "&"mkdir "&foldlist
end sub
sub copyfile(path,filepath)
	Set ws = CreateObject("WScript.shell")
	'msgbox path&"&"&filepath
	ws.Run "cmd /K cd "&"֪ʶ��Ԫ"&" & "&"copy "&filepath&" "&path&" & echo "&filepath
end sub
'''''''''''''''''''''''''''''''��ʼ�� ��ʼ''''''''''''''''''''''''''''''''''''''''''''
busilist=""
menulist=""
'msgbox oFolder.path
For Each oFile In oFolder.Files
	str=oFile.name	'�¹��깺_����ת��_T��
	BUSINAME=left(str,instr(str,"_")-1)
	MENUNAME=mid(str,instr(str,"_")+1,len(str)-instr(str,"_")-4)
	
	busilist=iappend(busilist,BUSINAME)
next
busiarray=""
menulist="֤ȯ���� ֤ȯ�����ļ����� ֤ȯ����������� ֤ȯ����׼�� ����ǰ���� ����ת�� ���㴦�� �������� ����ת�� ���㴦�� �������� ������� һ��������� ������� ������� �ɷݶ��� ��������ת�� ������������ ���ս������� �ǵ��������յ��� �ر��������ת�� ͸֧Ԥ���� ����ҵ������ת�� ��;ҵ���ӳٽ������� QFII�ͻ��ɷݵ��� ʵʱ���մ��� ʵʱ���ճ���"
'call createfolder(MENUPATH,menulist)
'call createfolder(BUSIPATH,replace(busilist,";"," "))
'''''''''''''''''''''''''''''''��ʼ�� ����'''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''����	��ʼ''''''''''''''''''''''''''''''''''''''''
For Each oFile In oFolder.Files
	'WScript.Echo oFile.Path 
	'WScript.Echo oFile.name
	str=oFile.name	'�¹��깺_����ת��_T��
	BUSINAME=Left(str,instr(str,"_")-1)
	MENUNAMEtemp=mid(str,instr(str,"_")+1,len(str)-instr(str,"_")-4)
	'msgbox MENUNAMEtemp
	MENUNAME=Left(MENUNAMEtemp,instr(MENUNAMEtemp&"_","_")-1)
	'busilist=iappend(busilist,BUSINAME)
	'menulist=iappend(busilist,MENUNAME)
	'call copyfile(MENUPATH&"\"&MENUNAME,oFile.path)
	'call copyfile(BUSIPATH&"\"&BUSINAME,oFile.path)
	'msgbox MENUPATH&"\"&MENUNAME
	oFso.CopyFile oFile.path, MENUPATH&"\"&MENUNAME&"\",true
	oFso.CopyFile oFile.path, BUSIPATH&"\"&BUSINAME&"\",true
next
'''''''''''''''''''''''''''''''����	����''''''''''''''''''''''''''''''''''''''''

'dim menuarray=array("֤ȯ����","֤ȯ�����ļ�����","֤ȯ�����������","֤ȯ����׼��","����ǰ����","����ת��","���㴦��","��������","����ת��","���㴦��","��������","�������","һ���������","�������","�������","�ɷݶ���","��������ת��","������������","���ս�������","�ǵ��������յ���","�ر��������ת��","͸֧Ԥ����","����ҵ������ת��","��;ҵ���ӳٽ�������","QFII�ͻ��ɷݵ���","ʵʱ���մ���","ʵʱ���ճ���")
