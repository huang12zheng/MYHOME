'Program1 = "C:\Program Files (x86)\Tencent\QQLite\Bin\qq.exe"
'Set wShell=createobject("wscript.shell")
'Set oExec=wShell.Exec(Program1)

Set wShell=WScript.CreateObject("WScript.Shell")
Set objWord = CreateObject("Word.Application")
Set objDictionary = CreateObject("Scripting.Dictionary")
set colTasks=objWord.Tasks
Set fso =CreateObject("Scripting.FileSystemObject")
Set MyFile =fso.CreateTextFile("tasklist_property.txt", True)

for each colTask in colTasks
	str="Application: "&colTask.Application&"  "
	str=str&"Creator: "&colTask.Creator&"  "
	str=str&"Parent: "&colTask.Parent&"  "
	str=str&"WindowState: "&colTask.WindowState&"  "
	str=str&colTask.name
	MyFile.WriteLine(str)
next
objWord.Quit