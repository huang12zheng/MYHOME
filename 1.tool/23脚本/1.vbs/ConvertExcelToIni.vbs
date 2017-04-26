call ConvertExcelToIni

function ConvertExcelToIni
	'获取输入参数
	set argus=wscript.arguments
	if argus.count <> 4 then
		ConvertExcelToIni   = "FAIL:传入参数个数错误！"
		exit function
	end if
	
	arg_execlFileName = argus(0)
	arg_groupidStr = argus(1)
	arg_taskid = argus(2)
	arg_dstIniFilePath = argus(3)
	
	'msgbox arg_execlFileName & "|" & arg_groupidStr & "|" & arg_taskid & "|" & arg_dstIniFilePath
	
	'读取excel文件内容
	dim oExcel,oWorkBook,oSheet
	Set oExcel=CreateObject("excel.application")
	Set oWorkBook=oExcel.Workbooks.Open(arg_execlFileName)
	Set oSheet=oWorkBook.Sheets("sheet1")
	
	'获取用户输入的groupid
	inputGroupIds = GetGroupIdArray(arg_groupidStr)
	
	'读取groupids
	dim groupidArray()
	For i=1 to 65536        
		ExcValue = oSheet.Cells(i,1).Value
		If ExcValue="" then            
			exit For       
		End If
		ReDim Preserve groupidArray(i-1)
		groupidArray(i-1) = ExcValue 
	Next
	'showArray(groupidArray)
	
	'根据输入的groupid获取对应行的内容
	i=0
	valueNameStr = ""
	valueStr = ""
	for each groupId in inputGroupIds
		realLineNum = IndexOfArray(groupidArray,groupId)
		if realLineNum <> -1 then
			in_vc_value_name = oSheet.Cells(realLineNum,4)
			if in_vc_value_name <> "" and instr(valueNameStr,in_vc_value_name) <= 0 then
				i=i+1
				in_vc_value = oSheet.Cells(realLineNum,5)
				valueNameStr = valueNameStr & in_vc_value_name & chr(2)
				valueStr = valueStr & in_vc_value & chr(2)
			end if
		end if
	next
	
	'拼接所有配置
	commConfig = "COMMCONFIG=[ "& i & chr(2) & "1" & chr(2) & valueNameStr & valueStr & "]"
	'msgbox  commConfig
	allConfig = "["&arg_taskid&"]" & vbcrlf & "ARIP=127.0.0.1" & vbcrlf & "ARPORT=8009" & vbcrlf & "ROWCOUNT=3" & vbcrlf
	allConfig = allConfig & commConfig & vbcrlf
	allConfig = allConfig & "[BRANCHNO|995]" & vbcrlf & "SQIP=127.0.0.1" & vbcrlf & "SQPORT=2333" & vbcrlf & "SQBAKIP=" & vbcrlf & "SQBAKPORT=" & vbcrlf & "SQAUTHCODE=" & vbcrlf & "SQBROKERID=1035" & vbcrlf
	allConfig = allConfig & "[BRANCHNO|996]" & vbcrlf & "SQIP=127.0.0.1" & vbcrlf & "SQPORT=2333" & vbcrlf & "SQBAKIP=" & vbcrlf & "SQBAKPORT=" & vbcrlf & "SQAUTHCODE=" & vbcrlf & "SQBROKERID=1035"
	 
	 '写入配置文件
	 arg_dstIniFilePath = Replace(arg_dstIniFilePath,"\","/")
	 if right(arg_dstIniFilePath,1) <> "/" then
	 	arg_dstIniFilePath = arg_dstIniFilePath & "/"
	 end if
	 iniFileName = arg_dstIniFilePath & "FutureDataSource"&arg_taskid&".ini"
	 'msgbox iniFileName
	 dim fso,ini
	 set fso = CreateObject("scripting.filesystemobject")
	 set ini = fso.createTextFile(iniFileName,True)
	 ini.close
	 set ini = fso.openTextFile(iniFileName,2,false)
	 ini.writeline(allConfig)
	 ini.close
	
	oExcel.Quit
	Set oSheet=Nothing 
	Set oWorkBook=Nothing 
	Set oExcel=Nothing 
	set ini = Nothing
	set fso = Nothing
end function 


'将groupids : 1,2,3,4:10转换成一个数组
function GetGroupIdArray(groupIdStr)
	dim tempAry
	dim groupIdArray()
	groupIdStr = Replace(groupIdStr," ","")
	'groupIdStr = Replace(groupIdStr,"，",",")
	groupIdStr = Replace(groupIdStr,"：",":")
	tempAry = split(groupIdStr,"#")
	i=0
	for each temp in tempAry
		if InStr(temp,":") > 0 then
			tempAry2 = split(temp,":")
			for j=tempAry2(0) to tempAry2(1)
				ReDim Preserve groupIdArray(i)
				groupIdArray(i) = cstr(j)
				i=i+1
			next
		else
			ReDim Preserve groupIdArray(i)
			groupIdArray(i) = temp
			i=i+1
		end if
	next
	GetGroupIdArray = groupIdArray
end function

'返回value在ary中的位置
'如果不存在返回-1
function IndexOfArray(arr,value)
	For i = 0 To UBound(arr)
	    If arr(i) = value Then
	        Exit For
	    end if
	Next
	If i <= UBound(arr) Then
    	indexOfArray = i+1
    Else
    	indexOfArray = -1
	End If
end function

'显示array
function showArray(arr)
	strr = ""
	For i = 0 To UBound(arr)
		strr = strr & "|" & arr(i)
	next
	msgbox strr
end function