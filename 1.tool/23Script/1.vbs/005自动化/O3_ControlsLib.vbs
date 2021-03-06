'************************************HS_03_SelectMenu**************************************
' Description:   树桩菜单选择
' *
' Parameters :    objName ：对象名称    *
'   item    ：    分级菜单名称
'   BUTTON : 按钮
'   Offset : 
'********************************************************************************************
public Function HS_O3_ClickOnText(obj,text,matchwholeonly)
		Dim x,y,r,b
		If  obj.GetTextLocation(text,x,y,r,b,matchwholeonly)  Then
			  obj.Click x,y
			  HS_O3_ClickOnText  = true
		else
		      HS_O3_ClickOnText = false
		End If
End Function

public function HS_03_SelectMenu(item)
   On Error  Resume Next
	Dim obj,counts,itemArray,rc
	Dim menu01,menu02,menu03
  
   set obj = this.WinObject("一级菜单")
   If not obj. Exist Then
	      this.Type micCtrlDwn + "l" + micCtrlUp
   End If
   If  not obj.Exist(30) Then
	       Err.Raise 102,"选择菜单", "Fail:" & "没有找到一级菜单！"
   End If

	'this.Type micCtrlDwn + micF4 + micCtrlUp
   this.Type micCtrlDwn + micShiftDwn + "w" + micShiftUp + micCtrlUp

   '先找最后一个节点()
    itemArray = split(item,"|")
    menu01= itemArray(0)
	if UBound(itemArray) >= 1 then
         menu02= itemArray(1)
	end if 
	if UBound(itemArray) >= 2 then
         menu03= itemArray(2)
	end if
    rc = 0
	'this.WinObject("text:=" &menu01).Click 
   if not  HS_O3_ClickOnText(obj,menu01,true) then
	        rc = 1
   end if
   wait(1)
   If rc = 0 Then
			If  menu03 <> "" Then
				  this.WinTreeView("二级菜单").Select menu02 & "|" & menu03
			else
			    'call HS_O3_ClickOnText( this.WinTreeView("二级菜单"),menu02,true)
			    this.WinTreeView("二级菜单").Select menu02
			End If	       
   End If
   wait(1)

end Function


Public function ScriptTrearDown     
				' 结束处理
				 On Error  Resume Next
			

				If ScriptTrearDown = "" Then
					  ScriptTrearDown = "PASS"
				End If
End Function


function Func_GetNumStr (str_In, byref str1,byref str2)

	dim i, j, length_str, str_i, str_temp
	str_temp = ""
	j = 1
	str_In = str_In &"完"
	length_str = len (str_In)
	For i =1 to length_str 
			str_i = left(str_In,1)
			str_In = right (str_In, len (str_In) -1)
			If instr("0123456789",str_i) > 0 Then
				 str_temp = str_temp & str_i
			else
			     if  str_temp <> "" then
						if  str1 = "" then
							str1 = str_temp
						elseif str2 = "" then
							str2 = str_temp
						end if
						 str_temp = ""
				end if
			End If
	Next

end function 


Public function Func_InitDBEntironment
        Func_InitDBEntironment = "PASS"
End Function




'************************************O3_HsWinComboBoxSelect**************************************
' Description:   重新定义了O3_HsWinComboBoxSelect的select方法
' *
' Parameters :    objName ：对象名称    *
'   Item    ：    值
'   BUTTON    ：    
'   Offset    ：    
'***************************************************************************************

public Function	O3_HsWinComboBoxSelect(object,InputValue)
  
  dim valText,sAllItems,varLocation,ItemsArray

  if(InputValue = "-") then
	O3_HsWinComboBoxSelect = rc
	Exit function
  end If
  If object.WaitProperty("hwnd",micNotEqual(vEmpty),5000)  then
		'控件不可用的情况下，需要比较当前的值是否和输入的值一致，如果一致则算通过，如果不一致则
		'认为是失败
        valText = object.GetRoProperty("text")
		if not object.GetROProperty("Enabled") then			
			if len(valText)>0 and instr(valText ,InputValue)=0  then' 输入框现在的值不是要输入的值，才输入
				rc = 1
			else
				O3_HsWinComboBoxSelect = rc
				Exit function
			end if
		end if
       '判断选项是否存在
       sAllItems=object.GetROProperty("all items")
     If instr(sAllItems,InputValue) = 0 Then
			rc=2
     else 
		 For i = 0 to object.GetROProperty("items count")-1
			If instr(object.GetItem(i),InputValue) > 0 Then
				object.Select i
				Exit For
			End If
			Next
		end if
	Else
	    rc = 3	   
	end if
	object.Type MicReturn

  Set object = Nothing

  O3_HsWinComboBoxSelect = rc

  On Error goto 0

  if rc = 1 then
  	 throw 71, "O3_HsWinComboBoxSelect","Fail:" & CURRENT_OBJECTNAME &  "对象不可用，无法选择对应的值" & InputValue
  end if
  if rc = 2 then
  	 throw 72, "O3_HsWinComboBoxSelect","Fail:" &  CURRENT_OBJECTNAME &  "选项中不存在，对应的值" & InputValue
  end if
  if rc = 3 then
  	 throw 73, "O3_HsWinComboBoxSelect","Fail:" &  CURRENT_OBJECTNAME&  "控件不存在" 
  end if  


   If rc = 0 Then
	    call  Hs_UIAutoCheck(AutoCheckFlag)
   End If

End Function