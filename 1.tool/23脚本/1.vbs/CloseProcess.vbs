'�ر�ָ���Ľ���
'�������Ϊ��������
function CloseProcess
	On Error Resume Next
	set argus=wscript.arguments
	if argus.count <> 1 then
		CloseProcess   = "FAIL:���������������"
		exit function
	end if
	ProcessName = argus(0)
     for each ps in getobject("winmgmts:\\.\root\cimv2:win32_process").instances_ 'ѭ������  
           if Ucase(ps.name)=Ucase(ProcessName) then  
                 ps.terminate  
           end if  
     next
     
     CloseProcess = "PASS"  
end function

call CloseProcess