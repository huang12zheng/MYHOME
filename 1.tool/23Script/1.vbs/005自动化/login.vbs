'*********************************脚本描述**************************************
'	脚本名称	：
'	创建人		：	cuirj
'	创建日期	：	
'	输入参数	：
'	功能描述	：
'*******************************************************************************
'修改历史
public function login
   login = "PASS"

systemutil.CloseProcessByName "HSRCP.exe"
If Window("text:=提示").Exist Then
	Window("text:=提示").Activate
	this.WinButton("text:=&Yes").Click
	
End If

'根据柜台安装目录设置该路径
SystemUtil.Run "E:\hundsun-92\HSRCP.exe"

Call HSRCP_WaitWindowLoadTest("登录",30)

'SC-步骤1:-<【激活 : 登录】
Window("text:=登录").Activate

testenv = GetValueByCol("环境")

'因登录窗口存在4个相同的Wincombobox控件，qtp无法直接区分，故采用描述性编程处理
Dim descLogin
Dim combobox
Set descLogin = Description.Create()
descLogin("regexpwndclass").Value="THs08ComboBox"
Set combobox = Window("text:=登录").ChildObjects(descLogin)
comboboxCount = combobox.count
For i = 0 To (comboboxCount-1)
	itemCount = combobox(i).GetItemsCount ()

	For j = 0 To (itemCount-1)
		If combobox(i).GetItem (j) = testenv Then
			combobox(i).select j
			Exit for
		End If
		
		If combobox(i).GetItem (j) = "0|普通登录" Then
			combobox(i).select j
			Exit for 
		End If
		
		If combobox(i).GetItem (j) = "1 操作员" Then
			combobox(i).select j
			Exit for
		End If
	Next

Next

Set descLogin = nothing
Set combobox= nothing
Set comboboxCount =  nothing
'>
'SC-步骤2:-<【选择 : "100"】
'this.WinComboBox("HSNAME:=LoginDlg.cmbboxServers").Select "92"
'this.WinComboBox("regexpwndclass:=THs08ComboBox").Select "92"
'>
'SC-步骤3:-<【选择 : "0|普通登录"】
'this.WinComboBox("regexpwndtitle:=0|普通登录").Select "0|普通登录"
'>
'SC-步骤4:-<【选择 : "1|操作员"】
'this.WinComboBox("regexpwndtitle:=1 操作员").Select "1 操作员"
'>
'SC-步骤5:-<【输入 : "8888"】
this.WinEdit("HSNAME:=rzpnl2.account").Set GetValueByCol("用户名")
'this.WinEdit("HSNAME:=rzpnl2.account").Set "8888"
'>
'SC-步骤6:-<【输入 : "@%#!*$"】
this.WinEdit("HSNAME:=rzpnl2.PasswordEdit1").Set GetValueByCol("密码")
'this.WinEdit("HSNAME:=rzpnl2.PasswordEdit1").Set "1"
'>
'SC-步骤7:-<【点击 : 确定】
this.WinButton("text:=确定").Click'>

'SC-步骤8:-<【判断登陆成功】
Call HSRCP_WaitWindowLoadTest(GetValueByCol("证券名称"),10)

'#####################################
'SC-步骤9:-<【处理各种弹框】
If Window("text:=更新").Exist Then
	Window("text:=更新").Activate
	this.WinButton("text:=取消").Click
End If
If Window("text:=.* - .*复核任务.*").Exist Then
	Window("text:=.* - .*复核任务.*").Activate
	this.WinButton("text:=退出").Click	
End If
'#####################################
Window("text:="&systemName).WaitProperty "text",systemName,1000
	

End function 