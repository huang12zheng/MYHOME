
'�Ự ӳ����� 
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
		str="�Ự:"
	end if
end function
sub function IsNeedDealwith(onesession)
	'�������������ôҪ�ж�һ��
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
				content=Inputbox("�Ƿ��Ǿ�������","1=true")
				if content=1 then
					onesession.IsFrequent=true
					onesession.IsClean=false'��IsNeedDealwith,���Բ�����
				else
					content=Inputbox("�Ƿ��ǲ�Ҫ��ʱ�ر�","1=true")
					if content=1 then
						onesession.IsClean=false'��IsNeedDealwith,���Բ�����
					end if
				end if
				
				
			end if
		else
			set onesession = new session
			onesession.Initialize(name)
			content=Inputbox("�Ƿ��Ǿ�������","1=true")
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