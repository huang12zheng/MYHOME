'*********************************脚本描述**************************************
'	脚本名称	：
'	创建人		：	hz
'	创建日期	：
'	输入参数	：
'	功能描述	：
'*******************************************************************************
'修改历史
public function Openreporttab()
   Openreporttab = "PASS"

call openTabConfig
rc=openTab	'openUtil
print rc
If rc <> true Then
	Openreporttab = "FAIL"
	Exit Function
Else
	'SC-步骤2:-<【等待打开结算入账页面】
	'Call HSRCP_WaitButtonLoadTest(systemName&" - .*"&subformname&".*",subformname,"确定","60")
End if 
End function