'*********************************脚本描述**************************************
'	脚本名称	：
'	创建人		：	hz
'	创建日期	：
'	输入参数	：
'	功能描述	：
'*******************************************************************************
'修改历史
public function MenuAddin
   MenuAddin = "PASS"
'systemName = GetValueByCol("主窗体名称")
'subformname= GetValueByCol("菜单名称")
'subformname2= GetValueByCol("菜单拼音")
'subformname3= GetValueByCol("菜单长名称")

'Execute "openSubformConfig"
Execute "InitConfig"

'SC-步骤1:-<【打开结算入账页面】
'rc = HSRCP_SelectMenuMul(systemName&".*","证券交易准备","zqjyzb","M510202-证券交易准备")
'rc = openSubform(systemName&".*",subformname,subformname2,subformname3) 'openUtil
rc = openSubform 'openUtil
print rc
If rc = false Then
	MenuAddin = "FAIL"
	Exit Function
Else
	'SC-步骤2:-<【等待打开结算入账页面】
	'Call HSRCP_WaitButtonLoadTest(systemName&" - .*"&subformname&".*",subformname,"确定","60")
End if 
End function