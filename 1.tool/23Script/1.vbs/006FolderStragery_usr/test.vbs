'V1 2017-5-7 10:36:45 添加便利文件夹的函数:如果文件夹为空,则添加一个readme.txt
dim fso,ws

set fso = createobject("scripting.filesystemobject") 
set ws = createobject("wscript.shell") 
vbsname=WScript.ScriptName
vbsname=left(vbsname,len(vbsname)-4)
usr=fso.GetFile(Wscript.ScriptFullName).ParentFolder.Path&"\"&vbsname&"_usr\"

'ws.run usr&strline

'folderpath=InputBox("Please input FolderPath")
'iMethor=InputBox("Please input Stragery,What is you want to use in FolderPath?")
'filepath="G:\MYHOME\1.tool\23脚本\1.vbs\tasklist_usr\tasklist_all.txt"
'filepath="SHOWEnv.vbs" '只可以是当前目录
'msgbox CreateObject("Scripting.FileSystemObject").FileExists("SHOWEnv.vbs")
msgbox "1"<>"1"
