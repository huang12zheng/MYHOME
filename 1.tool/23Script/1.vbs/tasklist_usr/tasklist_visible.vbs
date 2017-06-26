'Program1 = "C:\Program Files (x86)\Tencent\QQLite\Bin\qq.exe"
'Set wShell=createobject("wscript.shell")
'Set oExec=wShell.Exec(Program1)

Set wShell=WScript.CreateObject("WScript.Shell")
Set objWord = CreateObject("Word.Application")
Set objDictionary = CreateObject("Scripting.Dictionary")
set colTasks=objWord.Tasks
Set fso =CreateObject("Scripting.FileSystemObject")
Set MyFile =fso.CreateTextFile("tasklist_all.txt", True)
Set MyFileVisible =fso.CreateTextFile("tasklist_Visible.txt", True)

for each colTask in colTasks
	if colTask.visible then
		MyFileVisible.WriteLine(colTask.name)
	end if
	
	MyFile.WriteLine(colTask.name)
next
objWord.Quit