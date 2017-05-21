一、示例（自动打开QQ声音）
Loop ;循环体
{
WinWait, 与 qq009 交谈中,
IfWinNotActive, 与 qq009 交谈中, , WinActivate, 与 qq009 交谈中,
WinWaitActive, 与 qq009 交谈中,
Controlclick, Button36 ;接受请求
Sleep, 500
Control, Check, true, Button34 ;打开声音
Sleep, 100
}
return
 
二、常用命令
 
1、MsgBox命令有几种格式？
MsgBox, 文本 或 MsgBox [, 类型,标题, 文本, 显示时间 ]
 
2、MsgBox命令按钮有几种类型？
OK—0
OK/Cancel—1
Abort/Retry/Ignore—2
Yes/No/Cancel—3
Yes/No—4
Retry/Cancel—5
Icon Hand (stop/error)—16
Icon Question—32
Icon Exclamation—48
Icon Asterisk (info)—64
Make 2nd button the default—256
Make 3rd button the default—512
System Modal (always on top) —4096
Task Modal—8192 这些参数允许相加而得到复合效果。
 
3、显示含有yes/no按钮并总在顶端的对话框？
msgbox,4100,标题,内容
 
4、MsgBox如何换行？
MsgBox,你好，欢迎关注静海安澜阁 `n 请继续关注
 
5、如何对MsgBox命令的选择结果进行处理？
IfMsgBox, ButtonName
ButtonName可选项: Yes No OK Cancel Abort Ignore Retry Timeout
 
6、对话框显示时间，并以秒为单位？
msgbox , , 标题 , 内容 , 5
 
7、运行外部可执行程序或者直接打开文件？
Run, 目标文件[ , 工作目录 , Max|Min|Hide|UseErrorLevel , 输出PID 变量]
 
8、如何运行记事本并以最大化状态显示？
Run, Notepad.exe , , Max
 
9、如何直接打开文件？
Run, MyFile.txt
 
10、命令行解释器cmd.exe 用那个宏来表示？
%ComSpec% /k在执行完命令后保留命令提示窗口，而/c则在执行完命令之后关闭提示窗口
 
11、命令“dir c:\Windows\system32”如何实现？
Run, %ComSpec% /k dir c:\Windows\system32
 
12、如何打开网页？
Run, http://hi.baidu.com/xuejinglan
 
13、如何打开系统属性窗口？
Run control sysdm.cpl 需要的话可以搜索所有的*.cpl文件
 
14、打开控制面板？
run,control
 
15、如何打开搜索窗口且指定搜索位置？
Run, find C:\
 
16、如何显示指定文件的属性窗口？
Run, properties MyFile.txt 注意：AHK 在退出前将自动关闭打开的属性窗口！
 
17、如何打印指定文件？
Run, print MyFile.txt
 
18、等待窗口出现、被激活、被关闭用那些命令？
WinWait/WinWaitActive/WinWaitClose
 
19、如何使目标窗口出现之前不执行后面语句？
WinWait [, 窗口标题, 窗口文本, 超时时间, 排除标题, 排除文本]
 
20、如何使目标窗口成为活动窗口？
WinActivate [,窗口标题, 窗口文本, 排除标题, 排除文本]
 
21、关闭窗口有几种方式？
正常关闭窗口（WinClose ），强行关闭窗口（WinKill）：
WinClose/WinKill [ , 窗口标题, 窗口文本, 超时时间, 排除标题, 排除文本]
 
22、同名窗口使我们无法用窗口标题准确标识窗口，如何使用窗口ID来准确定位窗口？
使用获得窗口句柄的命令WinGet
WinGet[, 输出变量, CMD, 窗口标题, 窗口文本, 排除标题, 排除文本]
 
23、如何用窗口ID来替代窗口标题？
ahk_pid %ThisPID%
 
24、那个命令把鼠标点击事件发送到目标窗口的目标控件上？
ControlClick [, 目标控件或坐标位置, 窗口标题, 窗口文本, 鼠标按钮, 点击次数, 选项, 排除标题,排除文本]
 
25、ControlClick命令中，目标控件参数主要是什么？
目标控件参数是指要点击的控件的类别名（ClassNN）或控件文本，还可以使用控件句柄（若用的是控件句柄则第一个参数需留空，
 
并在第二个参数中使用ahk_id %控件句柄%）。
 
26、如何获得目标控件信息？
先打开你要进行操作的目标窗口，然后运行AutoIt3 Window Spy，把鼠标移到目标控件上
 
27、鼠标单击系统属性确定按钮代码是？
ControlClick, 确定, 系统属性
ControlClick, Button2, 系统属性
 
28、目标窗口或控件是隐藏状态，ControlClick还可以点击目标控件吗?
可以点击目标控件，但不能保证成功率。
 
29、如何设置控件文本？
ControlSetText [, 目标控件, 新文本, 窗口标题, 窗口文本, 排除标题, 排除文本]
例如：ControlSetText, Edit1, D:\foobar2000, Setup foobar
 
30、如何选中和取消单选框和复选框项目中的选择项目？
Control [, 命令, 值, 目标控件, 窗口标题, 窗口文本, 排除标题, 排除文本]
其中，“命令”就是让我们指定要进行何种设置的参数。对这些单选框/复选框按钮来说，适用的命令是“Check”和“UnCheck ”。
 
例如：Control, Check, , Button5, foobar
Control, UnCheck, , Button7, foobar
 
31、如何选择下拉列表的项目？
仍是使用Control命令，适用的命令是“Choose, N”和“ChooseString, String”，分别表示选中第N个项目和选中与字符串String
 
匹配的项目；例如：
Control, Choose, 5, ComboBox1, Installer
Control, ChooseString, 简体中文, ComboBox1, Installer
 
32、键盘如何重定义？
a::b
 
33、字符串如何进行自动替换？
::is::island of resistance或者
::china::
Clipboard=中华人民共和国
send,^V
Return
 
34、屏蔽或开启键盘、鼠标？
BlockInput 命令后，紧跟on，则屏蔽键盘鼠标操作，紧跟off，则重新启用用户输入。
如何仅仅屏蔽鼠标？如何恢复？ BlockInput,MouseMove 恢复为：BlockInput, MouseMoveOff
 
35、如何建立一个弹出式窗口例示文本？如何关闭？
SplashTextOn [, 宽度, 高度, 标题, 文本]
`n 可以在MsgBox和SplashTextOn等命令中对显示的文本进行换行。
SplashTextOff 为关闭SplashTextOn命令建立的弹出式窗口。
 
36、如何将一系列指令重复执行指定次数？ Loop [, Count]
{
循环体……
}
 
37、Loop中的count允许是表达式或者变量吗？
Count不允许是表达式，但允许是一个变量。
如何知道loop现在循环到第几次？ loop 指令隐含有一个变量 A_Index ，用来记录当前状态是第几次循环
 
38、如何中断循环？
if a_index > 25
break ; 中断循环
 
39、如何跳过本次循环？
if a_index < 20
continue ; 跳过本次循环，开始一次新的循环
 
40、如何使使脚本等待指定时间？
Sleep,时间 单位为毫秒
 
41、如进行数学运算，使用什么符来把表达式运算的结果赋予某变量？
使用冒号等号符。如：NetPrice := Price * (1 - Discount/100)
 
42、i := i+1 的简化写法是什么？
i + =1
 
43、如何获取指定区间的随机数？
Random, 输出变量 [, 最小值, 最大值]
 
44、如何从指定文本中读取指定行？
FileReadLine, 输出变量, 文件名, 行数
 
45、如何判断文本超出边界？
ErrorLevel 是命令内置的一个变量，当读取文件超出边界时将被赋值为1.
 
46、ErrorLevel 为0和1时一般代表什么？
一般情况下，为0代表操作成功，为1，代表操作失败。
 
47、一般情况下，编写弹出式菜单代码的顺序是什么？
1、先定义子菜单项；2、编写菜单项；3、编写令菜单显示的代码；4、编写删除代码；5、编写响应代码。
 
48、如何添加子菜单？
Menu,add,子菜单项,:子菜单变量如：menu,mymenu,add,常用程序,:amenu
 
49、用来在弹出式菜单中显示一条分割线的代码是？
Menu, MenuName, add
 
50、正常菜单项的代码是？
Menu, MenuName, add,菜单项,响应标志
 
51、响应代码的格式是？
响应标志：
响应代码……
return
 
52、形如：Menu,amenu,add,txt 的代码是什么意思？
它其实是Menu,amenu,add,txt,txt 的一种简写，代表菜单项和响应标志
 
53、在指定坐标处显示菜单项的代码是？
Menu,MenuName,show,X坐标,Y坐标 如省略坐标，则在鼠标当前位置显示菜单项。
 
54、如何指定显示菜单的背景色？
Menu,MenuName,color,颜色代码
 
55、删除所有菜单的代码是什么？有什么作用？
Menu,mymenu,deleteall
如果没有这句代码，代码中分割线会在菜单重显时翻倍。如无分割线，可免
 
56、重启、关闭、注销系统的指令是什么？
Shutdown 后跟0为注销1为关机，2为重启，4为强制关闭 8为关闭关闭电源
 
57、隐藏脚本图标有几种方法？
Menu , tray , noicon 或者#NoTrayIcon
 
58、显示脚本图标的代码？
Menu , tray , icon
 
59、脚本图标的气泡提示如何显示？
Menu , tray , tip , 我自己的脚本
 
60、如何设置脚本的图标？
Menu , tray , icon , %systemroot%\system32\shell32.dll ,22或者Menu , tray , icon , e:\ico\1.ico
 
61、如何利用快捷键退出脚本？
#x::ExitApp
 
62、如何移除托盘图标的所有标准菜单项？
Menu , tray , NoStandard
 
63、如何插入托盘图标菜单？
Menu , tray , add , myitem
 
64、如何显示托盘图标的标准菜单项？
Menu , tray , standard
 
65、在托盘图标显示一个二级菜单代码如何表示？
menu,mymenu,add,boke
menu,mymenu,add,luntan
menu,tray,add,相关网站,:mymenu
Return 注意：响应标志后是 ：不是：：
 
66、如何使非热键类的脚本持久运行？
#Persistent
 
67、显示一个标准的文件选择对话框的代码为？
FileSelectFile, OutputVar [, Options, RootDir, Prompt, Filter]
Option 参数如被省略，则为单选。M 多选，M后允许随意跟随一个数字。S: 显示保存对话框。数字为一般为3，即文件及路径必须存在。Filter 参数格式如：Example: Audio (*.wav; *.mp2; *.mp3)
 
68、FileSelectFile命令如用户选择了多个文件，输出变量如何分割？
输出变量用(`n)字符分割。第一个参数为路径，随后紧跟选定的各个文件名。
if files =
{
MsgBox, 用户放弃选择。
}
Loop, parse, files, `n
{
if a_index = 1
mypath = %A_LoopField%
else
{
runwait, %mypath%\%A_LoopField%
}
}
return
 
69、运行并等待程序完成的指令是？
runwait
 
70、从某字符串中逐次分解出一个个的子串。
Loop, Parse , 某字符串 , 用于分割的特征变量
 
71、用对话框显示音量递增10%？
MsgBox, 音量递增10`%
 
72、使静音或者取消静音状态？
SoundSet, +1, , mute 或者Send,{Volume_Mute}
 
73、使主音量提升（降低）10%？
SoundSet ,+（-）10, MASTER
 
74、使音量中波形音量提升（降低）10%？
SoundSet , +（-）10, WAVE
 
75、#NoEnv 作用是什么？
主要是为了与以后兼容，也可以改善性能
 
76、如何对某些多媒体功能键重定义？
建个脚本内容为#InstallKeybdHook并执行，双击图标，窗口中选择菜单 view 第四项 key 开头的然后按多媒体键,f5刷新,看第二列内容比如a,显示的值是01e 。使用时就是sc01e::msgbox
 
77、显示器的宽度和高度用那两个常数表示？
A_ScreenWidth 和 A_ScreenHeight
 
78、如何移动鼠标光标？
MouseMove, X, Y [, Speed, R] Speed 参数的范围在 0 (最快) to 100 (最慢)之间取值.
R 参数 如果有此参数，则鼠标移动将以当前位置为基准，进行 x 和 y 像素的位移.
 
79、如何获取当前鼠标坐标？
MouseGetPos, X, Y
 
80、MouseGetPos还有什么作用？
MouseGetPos 指令用来返回鼠标的当前位置，以及鼠标当前悬停的窗口和控件。格式为：
MouseGetPos, [OutputVarX, OutputVarY, OutputVarWin, OutputVarControl
OutputVarWin 这个变量存储了当前鼠标悬停的窗口的ID ，即使窗口未处于激活状态。OutputVarControl 这个变量存储了当前鼠标悬停的控件的名称（ClassNN）。
 
81、MouseGetPos 命令在最后有1、2、3参数是什么意思？
1：在多文档界面程序（例如 SysEdit 或 TextPadThis ）中可以准确的获取激活或置顶的子窗口信息。对其它情况就不那么准确了。2 ：在 OutputVarControl 中存储 control's HWND/窗口句柄。3 ：同时包含 1 和 2 的功能。
 
82、如何在屏幕上建立一个紧随鼠标的弹出式窗口？
ToolTip [, Text, X, Y]
 
83、如何获得当前位置像素的颜色RGB的值？
PixelGetColor, OutputVar, X, Y [, RGB]
 
84、如何在系统托盘建立一个弹出式窗口？
TrayTip [, Title, Text, Seconds, Options] 注意senconds的取值一般在10到30之间
 
85、如何用指定时间间隔自动或重复激发某子程序？
SetTimer , Label , 时间间隔
 
86、关闭某进程的代码是？
Process,close,autohotkey.exe
 
87、如何检索鼠标所在位置的信息？
MouseGetPos , , , id , control ; 得到鼠标所在位置窗口的id及控件名称
WinGetTitle, title, ahk_id %id% ；检索到相应id对应窗口的标题
WinGetClass, class, ahk_id %id% ；检索到相应id对应窗口的类名
 
88、如何得到当天的日期？
dd = %A_YYYY%年%A_MM%月%A_DD%日
 
89、如何给剪贴板赋值？
clipboard = %var%
 
90、当前桌面那个常数表示?
%A_Desktop%
 
91、如何设置鼠标速度？
SetDefaultMouseSpeed 30; 默认的是2 ，可以从0调到100，越小越快
 
92、如何设置鼠标动作结束之后的延迟？
SetMouseDelay 30; 默认是10毫秒
 
93、如何实现ctrl+鼠标双击？
send ^{click 100,200 2}
 
94、使滚轮向上滚2次？
click wheelup 2 ; wheelup 可以写成WU
 
95、滚轮向下滚一次？
click wheeldown ；wheeldown 可以简化为WD
 
96、使鼠标滚轮向下滚5次有几种方法？
Click , WD,5或
loop 5
click WD
 
97、当前位置鼠标单击左键
click ；
right 右键，left左键（默认可省略），middle 中键
 
98、当前位置鼠标双击左键？
click 2
 
99、移动鼠标到30，40？
click 30 , 40 , 0
 
100、点击鼠标右键的代码如何编写？
Click , 100 , 200 , right
 
101、如果鼠标点击的坐标是动态的如何表达?
Click %x% %y%
 
102、拖动某图标?
click 30,40 down
click 50,60 up
 
103、如何设置一个进度条？
Progress , %i% , 进度条下文本 , 进度条上文本 , 标题
 
104、如何创建快捷方式？
FileCreateShortcut, 目标文件, 快捷方式名 [, 工作目录, 用空格分开的参数, 描述, 图标, 快捷键, 图标标号, 运行状态]
注意：只需指定单个按键，所有的快捷键被指定为 CTRL+ALT + 快捷键，如果给该参数指定 B，将会产生一个 CTRL-ALT-B 的快捷键。运行状态1 - 正常(默认)3 - 最大化7 - 最小化
 
105、空格键
{space}
 
106、向左的箭头
{Left}
 
107、ctrl键？
^
 
108、alt键？
!
 
109、回车？
{enter}
 
110、小键盘的1？
Numpad1
 
111、Windows键?
#
 
112、Shift键？
+
 
113、逻辑与，把多个按键或鼠标组合成一个自定义键？
&
 
114、一对按键中的左边的按键？
< 如
 
116、通配符，表示热键被按下时，即使同时还有其他的按键按下，依然有效？
*
 
117、热键被触发后，动作不会被阻塞？
~
 
118、禁用某键？
在：：后紧跟return即可。如：RWin::return
 
119、按键重映射？
a::b 如：RAlt::Rbutton 右alt映射为鼠标右键Lbutton：：return 鼠标左键被屏蔽
 
120、仅在notepad中交换a、b键？
#IfWinActive ahk_class Notepad
a::b ;
#IfWinActive ;
 
121、鼠标定义？
LButton RButton MButton WheelDown WheelUp
 
122、键盘定义？
Space Tab Enter (or Return) Escape (or Esc) Backspace (or BS) Delete (or Del) Insert (or Ins) Home End PgUp PgDn Up Down Left Right ScrollLock CapsLock NumLock Numlock ON Numlock OFF Numpad0 NumpadPgUp NumpadDot (.) NumpadDel NumpadDiv (/) NumpadDiv (/) NumpadMult (*) NumpadMult (*) NumpadAdd (+) NumpadAdd (+) NumpadSub (-) NumpadSub (-) NumpadEnter NumpadEnter 1 a A LWin Control (or Ctrl) Alt Shift F1 PrintScreen CtrlBreak Pause Break
 
123、注释
；跟在需注释的语句之后，注意语句和分号之间至少要有一个空格。如果要注释多个语句可以使用
 
124、函数？
Add(x, y)
{
return x + y ; "Return" expects an expression.
}
函数调用时，变量的后面使用 ：= 例如：Var := Add(2, 3) ;
由于一个函数调用就是一个表达式，所以函数的参数列表里面的变量前面不能加百分号“%”，相反的，字符串要使用引号。当一个命令的参数调用函数的时候，如果命令的参数不支持表达式，就必须使用百分号“%”，如：
MsgBox % "The answer is: " Add(3, 2)
 
125、如果要想在热字符串替换后加上空格？
在语句的后边加上 `，:*:btw::By the way `
 
126、弹出光驱
Drive, Eject,, 0
 
127、收回光驱
Drive, Eject,, 1
 
128、使窗口透明，值在1-255之间？
WinSet, Transparent, 100,我的电脑
 
129、创建或更新启动界面？
SplashImage,d:\1.jpg,b fs18
Sleep,5000
b fs 18 可以去除界面边框。原因不明
 
130、修改脚本之后，按住左键后按R重新载入脚本
~LButton & r::
reload
return
 
131、打开/激活记事本
IfWinExist 无标题 - 记事本
{
WinActivate
}
Else
{
Run Notepad
WinWait 无标题 - 记事本
WinActivate
}
 
132、隐藏任务栏 WinHide ahk_class Shell_TrayWnd
显示任务栏 WinShow ahk_class Shell_TrayWnd
 
133、如何强制单线程？
#SingleInstance force
 
134、屏蔽Ctrl+Alt+Del？
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe, Debugger, Hotkey Disabled
解除屏蔽 RegDelete,HKLM,SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe
 
135、双击启动A程序.再双击,自动关闭A程序.
ifexist, 程序窗口标题
winkill, 程序窗口标题
else
run, 程序文件路径
return
 
136、当前窗口始终置于顶层?
WinSet AlwaysOnTop, on, A
 
137、关闭当前窗口置于顶层状态?
WinSet AlwaysOnTop, off, A
 
138、窗口还可以用表示?
ahk_class class、ahk_pid %PID%、ahk_id %ID%
 
139、音乐播放或暂停?
Send , {Media_Play_Pause}
 
140、音乐播放停止？
Send , {Media_Stop}
 
141、播放上一首？
Send , {Media_Prev}
 
142、播放下一首？
Send , {Media_Next}
 
143、按下浏览器回退键？
Send , {BROWSER_BACK}
 
144、按下浏览器 向前键？
Send , {BROWSER_FORWARD}
 
145、按下浏览器刷新键？
Send , {BROWSER_REFRESH}
 
146、按下浏览器停止键？
Send , {BROWSER_STOP}
 
147、按下浏览器搜索键？
Send , {BROWSER_SEARCH}
 
148、按下浏览器收藏键？
Send , {BROWSER_FAVORITES}
 
149、按下浏览器主页键？
Send , {BROWSER_HOME}
 
150、使静音？
Send , {VOLUME_MUTE}
 
151、降低音量？
Send , {VOLUME_DOWN}
 
152、提升音量？
Send , {VOLUME_UP}
 
153、打开邮件程序？
Send , {LAUNCH_MAIL}
 
154、打开播放器？
Send , {LAUNCH_MEDIA}
 
155、如何对字符串中某字符进行替换？
StringReplace,CodeString, CodeString, 被替换 , 替换, All
 
156、鼠标光标的状态用那个常数表示？
% A_Cursor %
 
157、当前脚本的运行路径用那个常数表示？
%A_WorkingDir%
 
158、常用判断语句运行失败的代码是？
if ErrorLevel
break
 
159、如何令鼠标进行相对移动？
在Click命令后使用Rel或者Relative参数，如：Click , 100 , 55 , rel
 
160、如何模拟Shift + 点击？
Send +{Click 100, 200}
 
161、如何模拟Ctrl +右键点击？
Send ^{Click 100, 200, right}
 
162、退出或终止某个 loop循环用那个命令？
Break如：
loop{ ... if var > 25 break ... if var <= 5 continue}
 
163、如何确定是否删除首位空格和Tab的设置？
判断% A_AutoTrim% （On 或者Off ）
 
164、单个空格和单个Tab用哪个常量表示？
% A_Space % 和 % A_Tab %
 
165、"Var1 = %Var2%" 表达式中自动省略 Var2 中首尾的空格和Tab 用哪个命令实现？
AutoTrim, On
 
166、点击或按住一个鼠标按键，或者滚动鼠标滚轮除了Click外还有哪个？
MouseClick [, WhichButton , X, Y, ClickCount, Speed, D|U, R]
 
167、鼠标滚轮：WU 向上滚动， WD 向下滚动滚轮，后续的 ClickCount 参数表示滚动滚轮的次数。ClickCount如省略，则默认点击1 次。D = 按住鼠标按键不放；U = 释放鼠标按键；R 相对移动
 
168、Mouse 开头的函数中WhichButton有那些选择？
WhichButton ：Left/左键，Right/右键，Middle/中键滚动
 
169、Mouse 开头的函数中Speed 有那些选择？
Speed 鼠标移动的速度，从 0（最快）到 100（最慢）
 
170、点击并按住指定的鼠标按键，移动鼠标到目标位置，释放鼠标按键？
MouseClickDrag, WhichButton, X1, Y1, X2, Y2 [, Speed, R]
X1, 起始位置　X2, Y2 目标位置坐标 R 相对移动
 
171、WinWaitActive,ahk_class MSPaintApp,, 2中最后2代表什么？
超时时间，秒为单位
 
172、ELSE后可跟什么命令？
任何单个命令都能和一个ELSE命令在同一行。如其后拥有多行，那些行必须被括入大括号。但是如果只有一行属于一个IF或一个ELSE命令，那么大括号是可选的。
 
173、无条件地终止脚本用哪个命令？
ExitApp 脚本将立即被终止，如果脚本有 OnExit 子程序，它将响应ExitApp而运行。
如：onexit,a
s::ExitApp
a:
msgbox,kk
Return
 
174、如何删除一个或多个文件？
FileDelete, FilePattern。FilePattern 单个文件的名称或一个像C:\Temp\*.tmp这样的通配符样式。如果绝对路径没被指定，FilePattern 会被假设在 %A_WorkingDir% 。
 
175、移除包含子文件夹和文件的整个文件夹？
FileRemoveDir，DirName
 
176、如何移除只读属性
FileSetAttrib, -R, C:\My File.txt
+ 增加属性- 取消属性^ 设置增加取消开关R = 只读A = 存档S = 系统H = 隐藏N = 普通 O = 脱机 T = 临时
 
177、跳到指定的标签并且继续执行?
Gosub, Label 。Label 跳转的标签、热键标签 或者 热字串标。Return脚本跳回Gosub下首个命令并继续执行。Exit终止当前的线程。
 
178、标签可以是变量吗？
Label 可以是一个 变量 如 %MyLabel%，如果Label不存在，将显示一个错误对话框。
 
179、哪个函数可以检验标签是否存在?
IsLabel(标签名) 如：
if IsLabel(VarContainingLabelName)
Gosub %VarContainingLabelName%
 
180、显示一个输入对话框，接受用户输入的数据？
InputBox, 输出变量 [, 标题, 提示文本, HIDE, 宽度, 高度, 横坐标, 纵坐标, 必须留空, Timeout, Default]
HIDE 如果这里使用单词 HIDE ，那么用户的输入内容会被隐藏。这在输入密码的时候很有用。Timeout 超时时间，单位是秒。Default 输入对话框出现时默认出现在输入框中的数据。
 
181、检查文件或文件夹或驱动器是否存在？
IfExist, FilePattern或者IfNotExist, FilePattern 如：
IfExist, D:\
MsgBox, 驱动器存在。
 
182、从一个字符串的左边或右边开始提取一定数量的字符用那个命令？
左边：StringLeft, OutputVar, InputVar, Count
右边：StringRight, OutputVar, InputVar, Count
Count 需要提取的字符数量，OutputVar 可以和 InputVar 相同。
 
183、如何获取字符串长度？
StringLen , OutputVar , InputVar InputVar 需要统计长度的字符串变量名。
 
184、如何将某字符串中的英文字母全部转换为大写或小写？参数中的T有什么作用？
小写：StringLower, OutputVar, InputVar [, T]
大写：StringUpper, OutputVar, InputVar [, T]
T 如果这个参数使用字母 T ，字符串将被转换为标题格式。
 
185、如何判断某字符串是否全部是大写或小写字母？
可以使用“if var is [not] upper/lower”。
 
186、如何从字符串中指定的位置返回一个或多个字符？
StringMid, OutputVar, InputVar, StartChar [, Count , L]
StartChar 提取的起始位置，Count如省略或留空，默认是一个足够存储所有字符的值。否则，该参数表示需要提取的字符数量，L从 StartChar 开始向左边提取字符
 
187、如何对字符串中指定的子字符串进行替换？
StringReplace, OutputVar, InputVar, SearchText [, ReplaceText, ReplaceAll ]
SearchText 被替换的文本，不区分大小写。ReplaceText 替换的文本。ReplaceAll如省略，只有第一个匹配 SearchText 的子字符串会被替换。如果这个参数是 1 、A 或者 All ，则所有匹配的子字符串都将被替换。如果这个参数是 UseErrorLevel 将在ErrorLevel中存储被替换的子字符串的数量
 
188、如何在剪贴板中移除换行？
StringReplace, clipboard, clipboard, `r`n, , All
 
189、如何从字符串的左边或右边移除指定数量的字符?
左边：StringTrimLeft, OutputVar, InputVar, Count 右边：StringTrimRight, OutputVar, InputVar, Count
 
190、写入一个值到注册表中用那个命令？
RegWrite, ValueType, RootKey, SubKey [, ValueName, Value]
 
191、从注册表中读取一个值用那个命令？
RegRead, OutputVar, RootKey, SubKey [, ValueName]
 
192、从注册表中删除一个子键或一个值用那个命令？
RegDelete, RootKey, SubKey [, ValueName]
 
193、ValueType有那些可选项？
只能是 REG_SZ ，REG_EXPAND_SZ ，REG_MULTI_SZ ，REG_DWORD 或者 REG_BINARY
 
194、RootKey 有那些可选项？
只能是HKEY_LOCAL_MACHINE 、HKEY_USERS 、HKEY_CURRENT_USER 、HKEY_CLASSES_ROOT 、HKEY_CURRENT_CONFIG 其中之一（或者它们的缩写，例如 HKLM ）。要访问远程注册表，在前面加上电脑名和一个冒号，例如：\\workstation01:HKEY_LOCAL_MACHINE
 
195、SubKey代表什么含义？
子键的名字如 Software\SomeApplication。如果 SubKey 不存在，将会在它的父类之下自动创建。如留空，将把值直接写入到 RootKey 中
 
196、ValueName 代表什么？
需要写入值的项的名称。如果留空或省略，默认修改的是 Subkey 的默认值，也就是在 RegEdit 中显示为“(Default)/默认”的值
 
197、Value 代表什么？ 需要写入的值。如省略，默认是一个空字符串，或 0
 
198、IfEqual, var, value 等同于？ if var = value
 
199、IfNotEqual, var, value 等同于？ if var <> value) (!= 能用来替代 <>)
 
200、IfGreater, var, value 等同于？ if var > value
 
201、IfGreaterOrEqual, var, value等同于？ if var >= value
 
202、IfLess, var, value 等同于？ if var < value
 
203、IfLessOrEqual, var, value 等同于？ if var <= value
 
204、If var 代表什么？ 如果变量的内容为空或是 0 ，那么它被认作 false。否则，将为 true。
 
205、检查一个变量是否在两个 values 之间用那个命令？
if var [not] between LowerBound and UpperBound
 
206、如何检查某变量是否存在于一个 values 列表内部？
if var [not] in value1,value2
if Done If ……if else ……if else 语句完毕
 
207、如何使指定窗口最大化？
WinMaximize [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
208、如某特定窗口没有准确地对WinMaximize 做出反应怎么办？
PostMessage, 0x112, 0xF030,,, WinTitle, WinText ; 0x112 = WM_SYSCOMMAND, 0xF030 = SC_MAXIMIZE此命令仅运作在匹配的最前端窗口上
 
209、用那个命令检索目标窗口有输入焦点的控件？
ControlGetFocus, OutputVar [, WinTitle, WinText, ExcludeTitle, ExcludeText]
OutputVar 存储控件标识符的变量名称，如 Button12。
 
210、如何防止当前线程被其他线程中断？
Critical [, On | Off]　如参数被省略或是 On，则当前的线程不会被其他线程中断。如是Off，则可中断。
 
211、如何取得谋控件的位置和大小？
ControlGetPos [, X, Y, Width, Height, Control, WinTitle, WinText, ExcludeTitle, ExcludeText]
X, Y 是控件左上角坐标。如省略坐标将不被储存。Width/Height 是控件的高和宽。Control 控件的名称/文本或 ClassNN (控件的类名和序号)
 
212、Edit命令有什么作用？
Edit 命令使用关联的编辑器打开当前脚本进行编辑，相当于托盘图标菜单的"Edit This Script"命令。
 
213、是否允许某脚本重复次运行？
#SingleInstance [force|ignore|off]　参数 FORCE 将跳过对话框，并自动地替换旧的实例，实际上同 Reload 命令相似。参数IGNORE 将跳过对话框，并让旧的实例运行。单词 OFF 允许多个脚本实例同时运行。如参数被省略，将显示一个对话框，询问是保持旧的实例还是使用新的实例来替换它。
 
214、#HotkeyInterval随同 #MaxHotkeysPerInterval 一起的作用是什么？
指定 热键 激活的速率，当超过这一速率时，将会显示一个警告对话框。
格式为：#HotkeyInterval Milliseconds 参数：Milliseconds 间隔的长度，以毫秒为单位。
 
215、哪个命令用来等待匹配指定条件的窗口被关闭？
WinWaitClose [, WinTitle, WinText, Seconds, ExcludeTitle, ExcludeText]
 
216、如何调用窗口菜单项？
WinMenuSelectItem, WinTitle, WinText, Menu [, SubMenu1, SubMenu2, SubMenu3, SubMenu4, SubMenu5, SubMenu6, ExcludeTitle, ExcludeText]
 
217、在WinMenuSelectItem命令中Menu参数代表什么？
Menu 是顶级菜单的名称，例如 File、Edit等，SubMenu1 需要选择的菜单的名称或位置，SubMenu2 如果 SubMenu1 本身还有子菜单，那么这个参数就是子菜单项的名称或位置。以此类推。也可以使用 1& 表示第一个菜单项，2&表示第二个菜单项。
 
218、用那个命令强制关闭窗口？
WinKill [, WinTitle, WinText, SecondsToWait, ExcludeTitle, ExcludeText]
 
219、WinKill命令中SecondsToWait参数有何含义？
如果省略或留空，命令完全不会等待。如果使用 0 ，会等待 500ms 。否则，它会等待指定的时间（可以包含小数点或者是一个 表达式 ）来让窗口彻底关闭。
 
220、隐藏/显示指定窗口的命令是？
WinHide/WinShow [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
221、最小化匹指定窗口到任务栏的命令是？
WinMinimize [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
222、如果某些窗口不能正确响应 WinMinimize ，可以尝试使用脚本？
PostMessage, 0x112, 0xF020,,, WinTitle, WinText ; 0x112 = WM_SYSCOMMAND ，0xF020 = SC_MINIMIZE　这个命令只对匹配窗口中处于最前端的进行操作
 
223、激活最底端的窗口的命令是？
WinActivateBottom [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
224、关闭指定窗口的命令是？
WinClose [, WinTitle, WinText, SecondsToWait, ExcludeTitle, ExcludeText] 或者是PostMessage, 0x112, 0xF060,,,WinTitle, WinText ; 0x112 = WM_SYSCOMMAND, 0xF060 = SC_CLOSE
 
225、等待指定窗口处于激活或未激活状态的命令是？
WinWaitActive [, WinTitle, WinText, Seconds, ExcludeTitle, ExcludeText]
WinWaitNotActive [, WinTitle, WinText, Seconds, ExcludeTitle, ExcludeText]
Seconds 超时时间。留空表示无限等待。指定 0 等同于 0.5 。
 
226、等待指定窗口出现的命令是？
WinWait [, WinTitle, WinText, Seconds, ExcludeTitle, ExcludeText]　　
 
227、改变指定窗口的标题的命令是？
WinSetTitle, NewTitle 或WinSetTitle, WinTitle, WinText, NewTitle [, ExcludeTitle, ExcludeText]
NewTitle 目标窗口的新标题。如果只有此参数，默认是上一次匹配窗口 。
 
228、最小化或还原所有窗口的命令是？
WinMinimizeAll / WinMinimizeAllUndo 这个命令等同于 Explore 的 Win-M 和 Win-D 快捷键。
 
229、移动指定窗口的命令是？
WinMove, X, Y
 
230、移动窗口更改大小的命令是？
WinMove, WinTitle, WinText, X, Y [, Width, Height, ExcludeTitle, ExcludeText]
 
231、还原指定窗口的命令是？
WinRestore [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
232、如果某些窗口不能正确响应 WinRestore ，可以尝试使用的脚本为？
PostMessage, 0x112, 0xF120,,, WinTitle, WinText ; 0x112 = WM_SYSCOMMAND ，0xF120 = SC_RESTORE
 
233、匹配指定条件的窗口进行设置，如“总在最前”，以及透明度等使用那个命令？
WinSet, Attribute, Value [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
234、WinSet中后紧跟AlwaysOnTop有什么含义？
让一个窗口处于置顶状态。使用 ON 开启设置，使用 OFF 关闭设置，使用 TOOGLE 切换设置。如果省略，默认是 TOOGLE。也可以使用单词 Topmost 替换 AlwaysOnTop。
 
235、如何切换计算器的“总在最前”状态？
WinSet, AlwaysOnTop, toggle, Calculator
 
236、WinSet中后紧跟Bottom有什么含义？
将一个窗口放到最底端，即所有窗口的下面。类似使用 Alt－Escape 快捷键。例如：
WinSet, Bottom,, WinTitle
 
237、WinSet中后紧跟Top有什么含义？
将一个窗口放到最前端而不进行激活。但多数情况下系统都会自动激活它。
 
238、WinSet中后紧跟Disable 或 Enable有什么含义？
停用或启用一个窗口。当一个窗口处于停用状态的时候，用户不能移动它或利用它的控件进行交互。另外，停用的窗口也不会出现在alt-tab 列表中。
 
239、WinSet中后紧跟Redraw有什么含义？
通过通知系统某个窗口区域需要重绘，来刷新一个窗口的界面和内容。
 
240、WinSet中后紧跟Style,N 或 ExStyle,N有什么含义？
分别设置窗口的样式或扩展样式。如果 N 中的第一个字符是加号或减号，则窗口会增加或移除 N 中指定的样式（可同时指定多个样式，下同）；如果第一个字符是符号“`”，窗口将对 N 中指定的样式进行切换操作；如果第一个字符是数字，窗口原来的所有样式将被覆盖，彻底变成 N 中指定的样式。更改了一个窗口的样式之后，可能使用命令 WinSet Redraw 重绘窗口
 
241、移除当前激活窗口的标题栏？
WinSet, Style, -0xC00000, A
 
242、将窗口添加到/移除于 alt-tab 列表中。
WinSet, ExStyle, ^0x80, WinTitle
 
243、更改某窗口的形状为指定形状？
WinSet, Region [, Options, WinTitle, ...]
 
244、WinSet, Region后Options 参数留空有何作用？
窗口将恢复到原来的形状
 
245、WinSet, Region后Options 参数可以指定那些参数？
请用空格分隔各个参数。
Wn：方形或椭圆形的宽度如：w200。 Hn：方形或椭圆形的高度。例如：h300
X-Y：X轴 和 Y轴 坐标。如，200-0 E：将窗口形状设置为椭圆形。
R[w-h]：设置方形窗口的圆角。如，R30-30 ，如省略 w-h ，默认使用 30-30 。
 
246、设置一个椭圆窗口的代码如？
WinSet, Region, 50-0 W200 H250 E, WinTitle
 
247、如何设置一个多边形窗口？
如果同时指定了 W 和 H 参数，并且在 X-Y 参数中指定了多组坐标，窗口的形状将变成多边形（每组坐标以窗口左上角为原点）。
 
例如，如果指定了 3 组坐标，大多数情况下窗口的形状会变成三角形，具体的形状取决于 3 组坐标的顺序。此外，在 Options 参数中也可以加上单词 Wind ，这将会使用一种弯曲的方式来决定多边形的形状。
 
248、如何设置窗口的透明度？
WinSet, Transparent, N, WinTitle ；N 为一个 0 到 255 的数字：0 表示完全透明，255 表示完全不透明。使用单词 OFF 彻底关闭窗口的透明效果。
 
249、还有那种属性设置也可以让窗口设置透明度？
Gui -Caption +ToolWindow.
 
250、设置任务栏的透明度？
WinSet, Transparent, 150, ahk_class Shell_TrayWnd
 
251、如何使目标窗口中指定颜色的区域透明？
WinSet, TransColor, Color [N], WinTitle Color 参数可以是一个颜色名称或一个 RGB 值，可以在颜色参数后跟一表示透明度的数字（0 - 255）。例如：WinSet, TransColor, EEAA99 150, WinTitle　　如果用户点击窗口中的透明部分，点击事件会“穿透”该窗口传递给下面的窗口。
 
252、如何让窗口中白色的部分透明？
WinSet, TransColor, White, Untitled - Notepad ;
 
253、如何完全关闭窗口的透明设置？
WinSet, Transparent, Off, WinTitle 或者 WinSet, TransColor, Off, WinTitle
 
254、取消脚本的 SplashText 窗口的置顶状态？
WinSet , AlwaysOnTop , Off , SplashText窗口的标题
 
255、让窗口只显示指定的方形部分？
WinSet, Region, 50-0 W200 H250, WinTitle
 
256、让窗口有圆角的方形？
WinSet, Region, 50-0 W200 H250 R40-40, WinTitle
 
257、倒三角形窗口？
WinSet, Region, 50-0 250-0 150-250, WinTitle
 
258、将窗口恢复原状？
WinSet, Region,, WinTitle
 
259、在窗口中创建了一个方形的“洞”?
WinSet, Region, 0-0 300-0 300-300 0-300 0-0 100-100 200-100 200-200 100-200 100-100, WinTitle
 
260、返回符合指定条件的窗口的 uID，进程ID，进程名称，或控件列表,包含所有符合指定条件的窗口的列表？
WinGet, OutputVar [, Cmd, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
261、WinGet中 Cmd参数处如留空或是ID有何含义？
返回窗口的 uID（HWND/句柄）。
 
262、WinGet中 Cmd参数处为IDLast有何含义?
当匹配的窗口超过一个的时候，它返回的是 最底端/最后使用 的窗口的 ID。
 
263、WinGet中 Cmd参数处为PID有何含义？
返回窗口的 进程ID（PID）。
 
264、WinGet中 Cmd参数处为ProcessName有何含义？
返回窗口所属进程的进程名称
 
265、WinGet中 Cmd参数处为Count有何含义？
返回符合指定条件的窗口数量（如果没有匹配窗口则返回 0 ）。要统计当前总窗口数，省略所有和 标题/文本 有关的参数。
 
266、WinGet中 Cmd参数处为List有何含义？
返回所有符合指定条件的窗口的 uID 。每个 ID 由一个 数组元素 存储，数组元素名从 OutputVar 开始，而 OutputVar 本身则存储了数组的长度。例如，OutputVar 使用 MyArray ，有 2 个匹配窗口，则变量 MyArray1 存储了第一个窗口的 ID ，变量MyArray2 存储了第二个窗口的 ID
 
267、WinGet中 Cmd参数处为MinMax有何含义？
返回窗口的 最小化/最大化 状态。返回下列数值之一：-1：窗口处于最小化状态;　1：窗口处于最大化状态。0：窗口既不处于最大化也不处于最小化状态。
 
268、WinGet中 Cmd参数处为ControlList有何含义？
返回一个列表，包含窗口中所有控件的名称。每个控件的名称由它的 class 名和序号（ClassNN）组成，除了最后一个控件的名称之外，每个名称后都跟着一个换行符（`n）。要单独遍历所有的控件名称，使用 parsing loop
 
269、WinGet中 Cmd参数处为ControlListHwnd何义？
功能同上，不同的是它返回的是控件的 窗口句柄（HWND）。
 
270、WinGet中 Cmd参数处为Transparent有何含义？
返回窗口的透明度,OutputVar 存储一个 0 到 255 之间的值，0 表示完全透明，255 表示不透明。
 
271、WinGet中 Cmd参数处为TransColor有何含义？
返回窗口的透明色OutputVar 存储一个 6 位的十六进制数，表示 RGB 颜色如 0x00CC99 。
 
272、WinGet中 Cmd参数处为Style 或 ExStyle何含义？
返回一个 8 位的十六进制数，表示窗口的样式或扩展样式。
 
273、检测一个窗口是否具有 WS_DISABLED 样式?
WinGet, Style, Style, My Window Title
if (Style & 0x8000000) ; 0x8000000 表示 WS_DISABLED
 
274、检测一个窗口是否具有置顶样式?
WinGet, ExStyle, ExStyle, My Window Title
if (ExStyle & 0x8) ; 0x8 表示 WS_EX_TOPMOST.
 
275、激活当前窗口并获得位置、大小信息？
WinGetActiveStats, Title, Width, Height, X, Y 说明：Title 存储当前激活窗口的标题。Width/Height 存储当前激活窗口的宽或高。X, Y 存储当前激活窗口左上角坐标标。
 
276、获取当前激活窗口的标题？
WinGetActiveTitle, OutputVar
 
277、如何得到指定窗口的 class 名?
WinGetClass, OutputVar [, WinTitle, WinText, ExcludeTitle, ExcludeText]　
 
278、如何得到指定窗口的位置和大小？
WinGetPos [, X, Y, Width, Height, WinTitle, WinText, ExcludeTitle, ExcludeText]
X, Y 目标窗口左上角的坐标。Width/Height 目标窗口的宽或高。如参数 WinTitle 使用“Program Manager”，该命令会返回桌面
 
279、如何得到指定窗口中的文本？
WinGetText, OutputVar [, WinTitle, WinText, ExcludeTitle, ExcludeText]
OutputVar 存储获取的文本。每个获取的文本元素之后都跟着一个回车换行符，在脚本中用 `r`n 表示。
 
280、如何得到指定窗口的标题？
WinGetTitle, OutputVar [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
281、如何激活指定窗口，将它置于最前端？
WinActivate [, WinTitle, WinText, ExcludeTitle, ExcludeText ]
 
282、等待直到 剪贴板中含有数据为止?
ClipWait [, 等待N秒, 1] 参数若省略，则等候时间无期限。
 
283、如何加载某个外部文件中定义的 函数？
#Include 文件名或目录名 或者 #IncludeAgain 文件名或目录名
如：#Include C:\My Documents\Scripts\Utility Subroutines.ahk
#Include 会确保每个文件仅被装入一次，#IncludeAgain允许多次装入同一个文件。
给文件名参数前加上一个 *i 前缀和一个空格符后，程序将忽略加载装入文件时发生的任何错误。例如：#Include *i SpecialOptions.ahk。