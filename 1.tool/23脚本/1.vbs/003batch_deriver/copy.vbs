Set wShell=WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Set MyFile = fso.GetFile("I:\MYHOME\1.tool\23重云\1.vbs\close.vbs")
MyFile.Copy("I:\MYHOME\1.tool\23重云\1.vbs\003batch_deriver\close.vbs")