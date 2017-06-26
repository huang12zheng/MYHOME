
'会话 映射对象 
class session
	SessionName
	NumberOfOccurrence
	IsClean
	IsFrequent
	Private Sub Initialize()
		SessionName="no name"
		NumberOfOccurrence = 0
		IsClean =true
		IsFrequent=false
	end Sub
	Private Sub Initialize(name)
		SessionName=name
		NumberOfOccurrence = 0
		IsClean =true
		IsFrequent=false
	end Sub
	Private Sub addNumberOfOccurrence()
		NumberOfOccurrence=NumberOfOccurrence+1
	end Sub
end class
sub function show
	count=0
	if count=35 then
		count=0
		msgbox str
		str="会话:"
	end if
end function
sub function IsNeedDealwith(onesession)
	'如果经常出现那么要判断一下
	num=onesession.NumberOfOccurrence
	for i=1 to 3
		if num=5^i then
			return true
		end if
	next
end function
end function
sub function createwordlist
	Set objWord = CreateObject("Word.Application")
	Set colTasks = objWord.Tasks
	
	for each colTask in colTasks
		name=colTask.name
		if (objDictionary.exists(name)) then
			set onesession = objDictionary.Key(name)
			onesession.addNumberOfOccurrence()
			if IsNeedDealwith(onesession) = true then
				content=Inputbox("是否是经常处理","1=true")
				if content=1 then
					onesession.IsFrequent=true
					onesession.IsClean=false'有IsNeedDealwith,可以不用了
				else
					content=Inputbox("是否是不要定时关闭","1=true")
					if content=1 then
						onesession.IsClean=false'有IsNeedDealwith,可以不用了
					end if
				end if
				
				
			end if
		else
			set onesession = new session
			onesession.Initialize(name)
			content=Inputbox("是否是经常处理","1=true")
			if content=1 then
				onesession.IsFrequent=true
				onesession.IsClean=false
			end if
			objDictionary.Add(name,onesession)
		end if
		
	next
	objWord.Quit
end function
Rem sub function DictionaryAddWord



Rem end function
Set wShell=WScript.CreateObject("WScript.Shell")
Set objWord = CreateObject("Word.Application")
'Set objDictionary = Server.CreateObject("Scripting.Dictionary")
Set objDictionary = CreateObject("Scripting.Dictionary")

wShell.Run("notepad.exe D:\myworkspace\vbs\wordlist.txt")

'Set colTasks = objWord.Tasks