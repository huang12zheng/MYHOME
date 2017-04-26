'Program1 = "C:\Program Files (x86)\Tencent\QQLite\Bin\qq.exe"
'Set wShell=createobject("wscript.shell")
'Set oExec=wShell.Exec(Program1)

Set wShell=WScript.CreateObject("WScript.Shell")
Set objWord = CreateObject("Word.Application")
Set objDictionary = CreateObject("Scripting.Dictionary")
set colTasks=objWord.Tasks
Set fso =CreateObject("Scripting.FileSystemObject")
Set MyFile =fso.CreateTextFile("tasklist_testfile.txt", True)
for each colTask in colTasks
	MyFile.WriteLine(colTask.name)
next
objWord.Quit