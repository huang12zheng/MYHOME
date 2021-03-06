public function ReportSummaryExport
   ReportSummaryExport = "PASS"

   Window("投资管理系统").Activate


   Call HS_03_SelectMenu(GetValueByCol("菜单"))
'报表汇总处的报表都会有报表名称
   If GetValueByCol("报表名称")<>"" and  GetValueByCol("报表名称")<>"-" Then 
     If this.WinTreeView("HSNAME:=pnlLeft.tvMenu").exist(300) Then
	this.WinTreeView("HSNAME:=pnlLeft.tvMenu").Select GetValueByCol("报表名称")
	call this.WinTreeView("HSNAME:=pnlLeft.tvMenu").WaitProperty("enabled",TRUE,900000)
     End If

   End If

   Window("投资管理系统").Activate
'下面是选择各TAB页
   If   GetValueByCol("Tab页")<>""  and GetValueByCol("Tab页")<>"-"Then  
      If  instr(GetValueByCol("菜单"),"财务管理|资金类管理|资金管理" ) Then
	 CALL WaitObject("HSNAME:=frFundCashMg.pg1",60)
         this.WinTab("HSNAME:=frFundCashMg.pg1").Select GetValueByCol("Tab页")
      elseif  instr(GetValueByCol("菜单"), "财务管理|证券类管理|证券管理") Then
	CALL WaitObject("HSNAME:=frStockMg.pg1",60)
	this.WinTab("HSNAME:=frStockMg.pg1").Select GetValueByCol("Tab页")
      elseif  instr(GetValueByCol("菜单"), "指令管理|持仓分析") Then
	CALL WaitObject("HSNAME:=formGroupQueryMain.pgcQuery",60)
	this.WinTab("HSNAME:=formGroupQueryMain.pgcQuery").Select GetValueByCol("Tab页")
      elseif  instr(GetValueByCol("菜单"), "指令管理|指令查询") Then
	CALL WaitObject("HSNAME:=QueryForm.pgMain",60)
	this.WinTab("HSNAME:=QueryForm.pgMain").Select GetValueByCol("Tab页")
      elseif  instr(GetValueByCol("菜单"), "信息查询|持仓交易分析") Then
	CALL WaitObject("HSNAME:=pnlShow.PCMain",60)
	this.WinTab("HSNAME:=pnlShow.PCMain").Select GetValueByCol("Tab页")
      elseif  instr(GetValueByCol("菜单"), "信息查询|ETF跟踪误差管理") Then
	CALL WaitObject("HSNAME:=frmTrackDifMain.pgcQuery",60)
	this.WinTab("HSNAME:=frmTrackDifMain.pgcQuery").Select GetValueByCol("Tab页")   
      elseif  instr(GetValueByCol("菜单"), "信息查询|指数基金跟踪误差管理") Then
	CALL WaitObject("HSNAME:=FrmIndexFundTrack.pgcQuery",60)
	this.WinTab("HSNAME:=FrmIndexFundTrack.pgcQuery").Select GetValueByCol("Tab页")   
      elseif  instr(GetValueByCol("报表名称"), "变现风险控制报表") Then
	CALL WaitObject("HSNAME:=FramFluid.pag",60)
	this.WinTab("HSNAME:=FramFluid.pag").Select GetValueByCol("Tab页")

      elseif  instr(GetValueByCol("报表名称"), "合笔委托查询")  OR  instr(GetValueByCol("报表名称"), "合笔成交查询") Then

      else 
        CALL WaitObject("HSNAME:=pnlClient.pgQueryMgnt",60) '报表汇总，净值持仓监控，账户组资产比较，止盈止损监控，期货持仓分析
	this.WinTab("HSNAME:=pnlClient.pgQueryMgnt").Select GetValueByCol("Tab页") 

      end if 
   End If


   Window("投资管理系统").Activate

'以下报表点击刷新按钮
   If   instr(GetValueByCol("报表名称"), "变现风险控制报表")  Then
     If  instr(GetValueByCol("Tab页"),"证券流动性风险") Then
		this.WinButton("HSNAME:=Panel2.btnrefresh").Click
     elseif  instr(GetValueByCol("Tab页"),"流通受限类股票流动性风险")  then
		this.WinButton("HSNAME:=Panel3.HsBitBtnNTS").Click
     elseif  instr(GetValueByCol("Tab页"),"申购赎回流动性风险")   then
		this.WinButton("HSNAME:=pnl2.HsBitBtnApply").Click
     elseif  instr(GetValueByCol("Tab页"),"基金周转率")   then
		this.WinButton("HSNAME:=Panel4.HsBitBtnturn").Click
     elseif  instr(GetValueByCol("Tab页"),"基金流动性占比")   then
		this.WinButton("HSNAME:=Panel7.HsBitBtnratio").Click
     End If 
'以下报表点击查询
  else 
     If this.WinButton("text:=查询").exist(2) then
          this.WinButton("text:=查询").Click
	elseif this.WinButton("text:=查询.*").exist(2) then
          this.WinButton("text:=查询.*").Click
	elseif this.WinButton("HSNAME:=btnQuery").exist(2)  then '指令查询
          this.WinButton("HSNAME:=btnQuery").Click	  
'     elseif this.WinButton("HSNAME:=pnlCommon.btnQuery").exist(2)  then '指令查询
'          this.WinButton("HSNAME:=pnlCommon.btnQuery").Click
'     elseif this.WinButton("HSNAME:=pnlTop.btnQuery").exist(2)   then '指令查询
'          this.WinButton("HSNAME:=pnlTop.btnQuery").CLICK
'     elseif this.winbutton("HSNAME:=pnlOptToolbar.btnQuery").exist(2) then'基金日报
'          this.winbutton("HSNAME:=pnlOptToolbar.btnQuery").click
     end if 
  End If

  '以下报表无查询窗口需要激活
If   instr(GetValueByCol("报表名称"), "变现风险控制报表")  Then '

'激活查询窗口
ELSE 
      if window("regexpwndclass:=TfrmDimDlg;regexpwndtitle:=维度持仓分析查询").exist  then '维度持仓分析
             window("regexpwndclass:=TfrmDimDlg;regexpwndtitle:=维度持仓分析查询").Activate
       elseif  Window("text:=.*查询").exist(2) Then
             Window("text:=.*查询").Activate
       elseif  Window("text:=查询.*").exist(2)  then '股票及权益统计
             Window("text:=查询.*").Activate  
	    elseif  Window("text:=.*查询条件").exist(2)  then 
			 	              Window("text:=.*查询条件").Activate  
       elseif Window("regexpwndclass:=TfrmWorkLoadDlg").exist(2)  then'交易员工作统计-工作量统计
             Window("regexpwndclass:=TfrmWorkLoadDlg").Activate
       elseif Window("regexpwndclass:=TfrmBLRDlg").exist(2)  then'在途债券借贷查询
             Window("regexpwndclass:=TfrmBLRDlg").Activate
      elseif Window("regexpwndclass:=TfrmBLCDlg").exist(2)  then'债券借贷l流水查询
             Window("regexpwndclass:=TfrmBLCDlg").Activate
        elseif  Window("regexpwndclass:=TfrmInsSubtotalDlg").exist(2)  then '指令小计　　
            Window("regexpwndclass:=TfrmInsSubtotalDlg").Activate
        elseif  Window("regexpwndtitle:=查询").exist(2)  then '交易报表,资产单元结息
              Window("regexpwndtitle:=查询").Activate  
        elseif Window("regexpwndtitle:=基金资产分析").exist(2)  then 
              Window("regexpwndtitle:=基金资产分析").Activate  
         elseif window("regexpwndclass:=TfrmSingleStockDlg").exist(2)  then  '单只证券持仓
              window("regexpwndclass:=TfrmSingleStockDlg").Activate
         elseif window("regexpwndclass:=TfrmAssetClassDlg").exist(2) then  '资产类别持仓
             window("regexpwndclass:=TfrmAssetClassDlg").Activate
          End If

         If  GetValueByCol("菜单")="指令管理|持仓分析"     Then
			  If   GetValueByCol("账户分类")<>"-" and   GetValueByCol("账户分类")<>"" and  this.WinComboBox("HSNAME:=fmAccountType.cboDict").exist Then
				     this.WinComboBox("HSNAME:=fmAccountType.cboDict").type GetValueByCol("账户分类")
			  END IF 
			 If   GetValueByCol("汇总类型")<>"-" and   GetValueByCol("汇总类型")<>"" and   this.WinCheckBox("text:="&GetValueByCol("汇总类型")&";location:=0").exist(3) Then
				     this.WinCheckBox("text:="&GetValueByCol("汇总类型")&";location:=0").click
			 elseif GetValueByCol("汇总类型")<>"-" and   GetValueByCol("汇总类型")<>"" and  this.WinRadioButton("text:="&GetValueByCol("汇总类型")&";location:=0").exist(3)  then
				     this.WinRadioButton("text:="&GetValueByCol("汇总类型")&";location:=0").click
			  End If
			  If   GetValueByCol("维度分类")<>"-" and   GetValueByCol("维度分类")<>"" and this.WinRadioButton("text:="&GetValueByCol("维度分类")).exist Then
				     this.WinRadioButton("text:="&GetValueByCol("维度分类")).click
			  End If
			  If   GetValueByCol("证券分类")<>"-" and   GetValueByCol("证券分类")<>"" and  this.WinComboBox("HSNAME:=pnlWorkArea.cboStockClass").exist Then
				     this.WinComboBox("HSNAME:=pnlWorkArea.cboStockClass").type GetValueByCol("证券分类")
			  End If

         End If
     If  GetValueByCol("菜单")="信息查询|账户组资产比较"   Then
        IF GetValueByCol("账户分类")<>"-" and   GetValueByCol("账户分类")<>"" and  this.WinComboBox("HSNAME:=fmAccountGroup.cboAccountType").exist(2) Then
				     this.WinComboBox("HSNAME:=fmAccountGroup.cboAccountType").type GetValueByCol("账户分类")
		 End If
     End IF

        If  GetValueByCol("报表名称")="基金交易情况汇总表"  Then
	          While (this.winobject("HSNAME:=fmFund1.chkcboFund").getroproperty("text")) <>""
           	this.winobject("HSNAME:=fmFund1.chkcboFund").Type  micBack 
              Wend
               this.winobject("HSNAME:=fmFund1.chkcboFund").Type "1"
                Set objShell = CreateObject("Wscript.Shell")'>
                objShell.SendKeys "{Enter}"'>      
                this.WinRadioButton("text:=自定义").CLICK
         End If
         If  GetValueByCol("菜单")="信息查询|券商佣金管理"  Then
              this.WinComboBox("HSNAME:=pnlWorkArea.cboDateType").type "4"
         End If
         If  GetValueByCol("Tab页")="交易所指令撤单比率查询"  Then
             this.WinComboBox("HSNAME:=pnlWorkArea.cboDateType").type "5"
         End If

         If GetValueByCol("报表名称")="股票盈亏比例查询表" Then
             If  GetValueByCol("日期1控件名")<>"-" and GetValueByCol("日期1控件名")<>""  Then
                  this.WinComboBox("HSNAME:=pnlWorkArea.cboDateLayer").Select "2"
         		 this.WinCalendar("HSNAME:="&GetValueByCol("日期1控件名")).SetDate GetValueByCol("日期1")
         	End If
             If  GetValueByCol("日期2控件名")<>"-" and GetValueByCol("日期2控件名")<>""  Then
                   this.WinCalendar("HSNAME:="&GetValueByCol("日期2控件名")).SetDate GetValueByCol("日期2")
         	End If
		elseif  GetValueByCol("报表名称")="现金类产品预赎回查询" Then  
              
                  this.WinComboBox("HSNAME:=fmDictionary1.cboDict").Select "1"
          else 
              If GetValueByCol("日期1控件名")<>"-" and GetValueByCol("日期1控件名")<>"" then
                          this.WinCalendar("HSNAME:="&GetValueByCol("日期1控件名")).SetDate GetValueByCol("日期1")
              end if
              if GetValueByCol("日期2控件名")<>"-" and GetValueByCol("日期2控件名")<>"" then
                       this.WinCalendar("HSNAME:="&GetValueByCol("日期2控件名")).SetDate GetValueByCol("日期2")
              end if
             if GetValueByCol("日期3控件名")<>"-" and GetValueByCol("日期3控件名")<>"" then
                   this.WinCalendar("HSNAME:="&GetValueByCol("日期3控件名")).SetDate GetValueByCol("日期3")
             end if
            if GetValueByCol("日期4控件名")<>"-" and GetValueByCol("日期4控件名")<>"" then
               this.WinCalendar("HSNAME:="&GetValueByCol("日期4控件名")).SetDate GetValueByCol("日期4")
            end if
            if GetValueByCol("日期5控件名")<>"-" and GetValueByCol("日期5控件名")<>"" then
               this.WinCalendar("HSNAME:="&GetValueByCol("日期5控件名")).SetDate GetValueByCol("日期5")
            end if
            if GetValueByCol("日期6控件名")<>"-" and GetValueByCol("日期6控件名")<>"" then
               this.WinCalendar("HSNAME:="&GetValueByCol("日期6控件名")).SetDate GetValueByCol("日期6")
            end if
         end if

            this.WinButton("text:=确定.*").Click

'this.WinButton("text:=确定.*").Click
            call hs_DealAlert("警告","是.*")
END IF
call window("投资管理系统").WaitProperty("enabled",TRUE,900000)
Window("投资管理系统").Activate

'If GetValueByCol("报表名称")="对账单报表"  then
'	wait 30
'
'end if

If   (GetValueByCol("分基金打印")="N")   THEN
	If  this.WinCheckBox("text:=分基金打印").exist   Then
		If   this.WinCheckBox("text:=分基金打印").getroproperty("enabled") Then
			        this.WinCheckBox("text:=分基金打印").Set "OFF"
		End If


	elseif  this.wincheckbox("HSNAME:=pnlOptToolbar.chkByFund").exist then
	  If   this.wincheckbox("HSNAME:=pnlOptToolbar.chkByFund").getroproperty("enabled") Then
		         this.wincheckbox("HSNAME:=pnlOptToolbar.chkByFund").Set "OFF"
	  End If

	ELSEIF this.WinCheckBox("text:=分基金导出").exist THEN
	   If  this.WinCheckBox("text:=分基金导出").getroproperty("enabled") Then
	    this.WinCheckBox("text:=分基金导出").Set "OFF"
	   End If
	elseif this.wincheckbox("HSNAME:=pnlOptToolbar.hschkFiles").exist then
	  If   this.wincheckbox("HSNAME:=pnlOptToolbar.hschkFiles").getroproperty("enabled")  Then
		   this.wincheckbox("HSNAME:=pnlOptToolbar.hschkFiles").Set "OFF"
	  End If

	End If

END IF

If   (GetValueByCol("分交易员打印")="N")  then
  	If  this.WinCheckBox("text:=分交易员打印").exist   Then
		If   this.WinCheckBox("text:=分交易员打印").getroproperty("enabled") Then
			        this.WinCheckBox("text:=分交易员打印").Set "OFF"
		End If


	elseif  this.wincheckbox("HSNAME:=pnlOptToolbar.chkByOper").exist then
	  If   this.wincheckbox("HSNAME:=pnlOptToolbar.chkByOper").getroproperty("enabled") Then
		         this.wincheckbox("HSNAME:=pnlOptToolbar.chkByOper").Set "OFF"
	  End If

end if 
end if


If   (GetValueByCol("分资产单元打印")="N")  then
  	If  this.WinCheckBox("text:=分资产单元打印").exist   Then
		If   this.WinCheckBox("text:=分资产单元打印").getroproperty("enabled") Then
			        this.WinCheckBox("text:=分资产单元打印").Set "OFF"
		End If


	elseif  this.wincheckbox("HSNAME:=pnlOptToolbar.chkByAsset").exist then
	  If   this.wincheckbox("HSNAME:=pnlOptToolbar.chkByAsset").getroproperty("enabled") Then
		         this.wincheckbox("HSNAME:=pnlOptToolbar.chkByAsset").Set "OFF"
	  End If

end if 
end if



If   (GetValueByCol("分日期打印")="N")  then
  	If  this.WinCheckBox("text:=分日期打印").exist   Then
		If   this.WinCheckBox("text:=分日期打印").getroproperty("enabled") Then
			        this.WinCheckBox("text:=分日期打印").Set "OFF"
		End If


	elseif  this.wincheckbox("HSNAME:=pnlOptToolbar.chkByDate").exist then
	  If   this.wincheckbox("HSNAME:=pnlOptToolbar.chkByDate").getroproperty("enabled") Then
		         this.wincheckbox("HSNAME:=pnlOptToolbar.chkByDate").Set "OFF"
	  End If

end if 
end if




If  this.WinCheckBox("text:=按基金导出多文件").exist Then
If   this.WinCheckBox("text:=按基金导出多文件").getroproperty("enabled") Then
	  this.WinCheckBox("text:=按基金导出多文件").Set "OFF"
End If
end if 

If   GetValueByCol("按主从表格式导出")="Y" and    (this.WinCheckBox("text:=按主从表格式导出").exist  ) Then 'OR   this.WinCheckBox("HSNAME:=pnlOptToolbar.chkExcel").exist
    If   this.WinCheckBox("text:=按主从表格式导出").getroproperty("enabled")  Then
	         this.WinCheckBox("text:=按主从表格式导出").Set "ON"
'			  while this.WinCheckBox("text:=按主从表格式导出").getroproperty("checked") <>"ON"    
'			   wait 3	
'			   	this.WinCheckBox("text:=按主从表格式导出").Set "ON"
'				 wend 
	ELSEIF   this.WinCheckBox("text:=按主从表导出").getroproperty("enabled")   THEN
	       this.WinCheckBox("text:=按主从表导出").Set "ON"
'		        while this.WinCheckBox("text:=按主从表导出").getroproperty("checked") <>"ON"    
'			   wait 3	
'			   	this.WinCheckBox("text:=按主从表导出").Set "ON"
'				 wend 
    End If
elseif   this.WinCheckBox("text:=按主从表导出").exist then
      this.WinCheckBox("text:=按主从表导出").Set "ON"
'	           while this.WinCheckBox("text:=按主从表导出").getroproperty("checked") <>"OFF"    
'			   wait 3	
'			   	this.WinCheckBox("text:=按主从表导出").Set "ON"
'				 wend 
End If





window("投资管理系统").Activate
If  GetValueByCol("Tab页") ="基金净值监控" Then
'	   call this.Winobject("HSNAME:=pnl5.DBGridEhFund").WaitProperty("enabled",TRUE,900000)
'	   	this.Winobject("HSNAME:=pnl5.DBGridEhFund").click
elseif GetValueByCol("Tab页") ="最近建仓日在20个交易日之外的股票（最新价比N日均价）"  then
	 Call this.Winobject("HSNAME:=pnl4.DBGridEhStock").WaitProperty("enabled",TRUE,900000)
      this.Winobject("HSNAME:=pnl4.DBGridEhStock").click
elseif GetValueByCol("Tab页") ="股票浮动盈亏"  then
     Call  this.Winobject("HSNAME:=pnl2.DBGridEhFdyk").WaitProperty("enabled",TRUE,900000)
      this.Winobject("HSNAME:=pnl2.DBGridEhFdyk").click
elseif GetValueByCol("Tab页") ="最近建仓日在20个交易日之内的股票（最新价比成本价）"  then 
	 Call  this.Winobject("HSNAME:=pnl3.DBGridEhJcPrice").WaitProperty("enabled",TRUE,900000)
      this.Winobject("HSNAME:=pnl3.DBGridEhJcPrice").click
end if 
If GetValueByCol("Tab页") ="合笔委托"  Then
      this.Winobject("HSNAME:=tsEntrustsCombi.DBGehCombiEntrusts").click
ELSEIF  GetValueByCol("Tab页") ="分笔委托"   THEN
      this.Winobject("HSNAME:=tsEntrusts.DBGehPlacement").click
ELSEIF  GetValueByCol("Tab页") ="合笔成交"   THEN
      this.Winobject("HSNAME:=tsRealDealCombi.DBGRealDealCombi").click
ELSEIF  GetValueByCol("Tab页") ="分笔成交"   THEN
      this.Winobject("HSNAME:=tsRealDeal.DBGRealDeal").click
End If

If GetValueByCol("Tab页") ="期末持仓"  Then
      this.Winobject("HSNAME:=pnlWorkArea.DBGridEhStockHold").click
ELSEIF  GetValueByCol("Tab页") ="期间投资"   THEN
      this.Winobject("HSNAME:=pnlWorkArea.DBGridEh").click
end if 

call window("投资管理系统").WaitProperty("enabled",TRUE,900000)
'
If   instr(GetValueByCol("报表名称"), "变现风险控制报表")  Then
         this.type "F"
else 
If  this.WinButton("text:=导出").exist(3) Then
   this.WinButton("text:=导出").Click
elseIf  this.WinButton("text:=导出.*").exist(3) Then
   this.WinButton("text:=导出.*").Click
elseif  this.WinButton("HSNAME:=btnExport").exist(3)  THEN
this.WinButton("HSNAME:=btnExport").CLICK
'elseif  this.WinButton("HSNAME:=pnlTop.btnExport").exist(3) then
'  this.WinButton("HSNAME:=pnlTop.btnExport").CLICK 
'elseif  this.WinButton("HSNAME:=pnlOptToolbar.btnExport").exist(3) then
'  this.WinButton("HSNAME:=pnlOptToolbar.btnExport").CLICK
End If
END IF



If  Window("text:=数据导出到.*").exist(2)   then
Window("text:=数据导出到.*").Activate
this.WinEdit("HSNAME:=Edit1148").Set PATH_RESULTDRIVER & GetValueByCol("导出文件（待比对文件）")
this.WinButton("text:=保存.*;nativeclass:=Button").Click
elseif GetValueByCol("Tab页")="持仓查询" or  GetValueByCol("报表名称")="收盘持仓报表"  or GetValueByCol("报表名称")="证券持仓交易情况表"  or GetValueByCol("报表名称")="资金组交易汇总" Then
    If  Window("text:=数据导出到.*").exist(120)  Then
            Window("text:=数据导出到.*").Activate
            this.WinEdit("HSNAME:=Edit1148").Set PATH_RESULTDRIVER & GetValueByCol("导出文件（待比对文件）")
            this.WinButton("text:=保存.*;nativeclass:=Button").Click
     end if 
elseif  instr(GetValueByCol("报表名称"), "变现风险控制报表")  Then
      If  Window("text:=打开.*").exist(120)  Then
           Window("text:=打开.*").Activate
           this.WinEdit("HSNAME:=Edit1148").Set PATH_RESULTDRIVER & GetValueByCol("导出文件（待比对文件）")
           this.WinButton("text:=保存.*;nativeclass:=Button").Click
      end if
elseif  Window("text:=另存为").exist(120)  Then
Window("text:=另存为").Activate
this.WinEdit("HSNAME:=Edit1148").Set PATH_RESULTDRIVER & GetValueByCol("导出文件（待比对文件）")
this.WinButton("text:=保存.*;nativeclass:=Button").Click
end if
'If  GetValueByCol("Tab页")="持仓查询" or  GetValueByCol("报表名称")="收盘持仓报表"  or GetValueByCol("报表名称")="证券持仓交易情况表"  or Then
'      If  Window("text:=数据导出到.*").exist(120)  Then
'             Window("text:=数据导出到.*").Activate
'             this.WinEdit("HSNAME:=Edit1148").Set PATH_RESULTDRIVER & GetValueByCol("导出文件（待比对文件）")
'             this.WinButton("text:=保存.*;nativeclass:=Button").Click
'      End If
'
'elseif  instr(GetValueByCol("报表名称"), "变现风险控制报表")  Then
'      If  Window("text:=打开.*").exist(120)  Then
'             Window("text:=打开.*").Activate
'             this.WinEdit("HSNAME:=Edit1148").Set PATH_RESULTDRIVER & GetValueByCol("导出文件（待比对文件）")
'             this.WinButton("text:=保存.*;nativeclass:=Button").Click
'      End If
'
'else 
'      If  Window("text:=另存为").exist(120)  Then
'             Window("text:=另存为").Activate
'             this.WinEdit("HSNAME:=Edit1148").Set PATH_RESULTDRIVER & GetValueByCol("导出文件（待比对文件）")
'             this.WinButton("text:=保存.*;nativeclass:=Button").Click
'      End If
'
'End If

If GetValueByCol("报表名称")="股指期货成交查询" or   GetValueByCol("报表名称")="基金日报"  then 
If  window("text:=提示").Exist(300) Then
	call hs_DealAlert("提示","确定") '股指期货成交查询
End If
else 
	call hs_DealAlert("提示","确定") 
end if 
call	Window("投资管理系统").WaitProperty("enabled",TRUE,900000)
'If  instr(GetValueByCol("菜单"), "信息查询|报表汇总") Then
'If  this.WinTreeView("HSNAME:=pnlLeft.tvMenu").exist(600)  then
'	call this.WinTreeView("HSNAME:=pnlLeft.tvMenu").WaitProperty("enabled",TRUE,900000)
'End If
'end if
If  instr(GetValueByCol("报表名称"), "基金证券情况") Then
wait 400
end if
end function 




