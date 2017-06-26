'关闭指定的进程
'传入参数为进程名称
function CloseProcess
	On Error Resume Next
	set argus=wscript.arguments
	if argus.count <> 1 then
		CloseProcess   = "FAIL:传入参数个数错误！"
		exit function
	end if
	ProcessName = argus(0)
     for each ps in getobject("winmgmts:\\.\root\cimv2:win32_process").instances_ '循环进程  
           if Ucase(ps.name)=Ucase(ProcessName) then  
                 ps.terminate  
           end if  
     next
     
     CloseProcess = "PASS"  
end function

call CloseProcess