WORKPATH=createobject("Scripting.FileSystemObject").GetFolder(".").Path
KNOWPATH=createobject("Scripting.FileSystemObject").GetFolder(".\知识单元").Path
'BUSIPATH=createobject("Scripting.FileSystemObject").GetFolder(".\业务库").Path
'MENUPATH=createobject("Scripting.FileSystemObject").GetFolder(".\菜单库").Path

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
	ws.Run "cmd /K cd "&"知识单元"&" & "&"copy "&filepath&" "&path&" & echo "&filepath
end sub
'''''''''''''''''''''''''''''''初始化 开始''''''''''''''''''''''''''''''''''''''''''''
busilist=""
menulist=""
'msgbox oFolder.path
For Each oFile In oFolder.Files
	str=oFile.name	'新股申购_清算转入_T日
	BUSINAME=left(str,instr(str,"_")-1)
	MENUNAME=mid(str,instr(str,"_")+1,len(str)-instr(str,"_")-4)
	
	busilist=iappend(busilist,BUSINAME)
next
busiarray=""
menulist="证券日终 证券日终文件设置 证券结算对账设置 证券交易准备 清算前处理 清算转入 清算处理 清算入账 结算转入 结算处理 结算入账 清算后处理 一级清算对账 清算对账 结算对账 股份对账 场外数据转入 隔日清算入账 隔日结算入账 非担保交收日调整 特别结算数据转入 透支预处理 特殊业务数据转入 在途业务延迟交收设置 QFII客户股份调账 实时交收处理 实时交收冲正"
'call createfolder(MENUPATH,menulist)
'call createfolder(BUSIPATH,replace(busilist,";"," "))
'''''''''''''''''''''''''''''''初始化 结束'''''''''''''''''''''''''''''''''''''''''''''
'''''''''''''''''''''''''''''''分配	开始''''''''''''''''''''''''''''''''''''''''
For Each oFile In oFolder.Files
	'WScript.Echo oFile.Path 
	'WScript.Echo oFile.name
	str=oFile.name	'新股申购_清算转入_T日
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
'''''''''''''''''''''''''''''''分配	结束''''''''''''''''''''''''''''''''''''''''

'dim menuarray=array("证券日终","证券日终文件设置","证券结算对账设置","证券交易准备","清算前处理","清算转入","清算处理","清算入账","结算转入","结算处理","结算入账","清算后处理","一级清算对账","清算对账","结算对账","股份对账","场外数据转入","隔日清算入账","隔日结算入账","非担保交收日调整","特别结算数据转入","透支预处理","特殊业务数据转入","在途业务延迟交收设置","QFII客户股份调账","实时交收处理","实时交收冲正")
