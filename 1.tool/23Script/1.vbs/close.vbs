Set wShell=WScript.CreateObject("WScript.Shell")
Set objWord = CreateObject("Word.Application")
str="会话:"
count=0
Set colTasks = objWord.Tasks
for each colTask in colTasks
REM if Ucase(colTask.name)="游戏文件夹" then
rem msgbox colTask.name
str=str&chr(13)&colTask.name
count=count+1
if count=35 then
count=0
msgbox str
str="会话:"
end if
if instr(Ucase(colTask.name),Ucase("Image"))<>0 then
colTask.close
end if
next
msgbox str
objWord.Quit
'Created By escortmnm from VBS团队