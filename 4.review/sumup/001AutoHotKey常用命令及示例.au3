һ��ʾ�����Զ���QQ������
Loop ;ѭ����
{
WinWait, �� qq009 ��̸��,
IfWinNotActive, �� qq009 ��̸��, , WinActivate, �� qq009 ��̸��,
WinWaitActive, �� qq009 ��̸��,
Controlclick, Button36 ;��������
Sleep, 500
Control, Check, true, Button34 ;������
Sleep, 100
}
return
 
������������
 
1��MsgBox�����м��ָ�ʽ��
MsgBox, �ı� �� MsgBox [, ����,����, �ı�, ��ʾʱ�� ]
 
2��MsgBox���ť�м������ͣ�
OK��0
OK/Cancel��1
Abort/Retry/Ignore��2
Yes/No/Cancel��3
Yes/No��4
Retry/Cancel��5
Icon Hand (stop/error)��16
Icon Question��32
Icon Exclamation��48
Icon Asterisk (info)��64
Make 2nd button the default��256
Make 3rd button the default��512
System Modal (always on top) ��4096
Task Modal��8192 ��Щ����������Ӷ��õ�����Ч����
 
3����ʾ����yes/no��ť�����ڶ��˵ĶԻ���
msgbox,4100,����,����
 
4��MsgBox��λ��У�
MsgBox,��ã���ӭ��ע���������� `n �������ע
 
5����ζ�MsgBox�����ѡ�������д���
IfMsgBox, ButtonName
ButtonName��ѡ��: Yes No OK Cancel Abort Ignore Retry Timeout
 
6���Ի�����ʾʱ�䣬������Ϊ��λ��
msgbox , , ���� , ���� , 5
 
7�������ⲿ��ִ�г������ֱ�Ӵ��ļ���
Run, Ŀ���ļ�[ , ����Ŀ¼ , Max|Min|Hide|UseErrorLevel , ���PID ����]
 
8��������м��±��������״̬��ʾ��
Run, Notepad.exe , , Max
 
9�����ֱ�Ӵ��ļ���
Run, MyFile.txt
 
10�������н�����cmd.exe ���Ǹ�������ʾ��
%ComSpec% /k��ִ�����������������ʾ���ڣ���/c����ִ��������֮��ر���ʾ����
 
11�����dir c:\Windows\system32�����ʵ�֣�
Run, %ComSpec% /k dir c:\Windows\system32
 
12����δ���ҳ��
Run, http://hi.baidu.com/xuejinglan
 
13����δ�ϵͳ���Դ��ڣ�
Run control sysdm.cpl ��Ҫ�Ļ������������е�*.cpl�ļ�
 
14���򿪿�����壿
run,control
 
15����δ�����������ָ������λ�ã�
Run, find C:\
 
16�������ʾָ���ļ������Դ��ڣ�
Run, properties MyFile.txt ע�⣺AHK ���˳�ǰ���Զ��رմ򿪵����Դ��ڣ�
 
17����δ�ӡָ���ļ���
Run, print MyFile.txt
 
18���ȴ����ڳ��֡���������ر�����Щ���
WinWait/WinWaitActive/WinWaitClose
 
19�����ʹĿ�괰�ڳ���֮ǰ��ִ�к�����䣿
WinWait [, ���ڱ���, �����ı�, ��ʱʱ��, �ų�����, �ų��ı�]
 
20�����ʹĿ�괰�ڳ�Ϊ����ڣ�
WinActivate [,���ڱ���, �����ı�, �ų�����, �ų��ı�]
 
21���رմ����м��ַ�ʽ��
�����رմ��ڣ�WinClose ����ǿ�йرմ��ڣ�WinKill����
WinClose/WinKill [ , ���ڱ���, �����ı�, ��ʱʱ��, �ų�����, �ų��ı�]
 
22��ͬ������ʹ�����޷��ô��ڱ���׼ȷ��ʶ���ڣ����ʹ�ô���ID��׼ȷ��λ���ڣ�
ʹ�û�ô��ھ��������WinGet
WinGet[, �������, CMD, ���ڱ���, �����ı�, �ų�����, �ų��ı�]
 
23������ô���ID��������ڱ��⣿
ahk_pid %ThisPID%
 
24���Ǹ������������¼����͵�Ŀ�괰�ڵ�Ŀ��ؼ��ϣ�
ControlClick [, Ŀ��ؼ�������λ��, ���ڱ���, �����ı�, ��갴ť, �������, ѡ��, �ų�����,�ų��ı�]
 
25��ControlClick�����У�Ŀ��ؼ�������Ҫ��ʲô��
Ŀ��ؼ�������ָҪ����Ŀؼ����������ClassNN����ؼ��ı���������ʹ�ÿؼ���������õ��ǿؼ�������һ�����������գ�
 
���ڵڶ���������ʹ��ahk_id %�ؼ����%����
 
26����λ��Ŀ��ؼ���Ϣ��
�ȴ���Ҫ���в�����Ŀ�괰�ڣ�Ȼ������AutoIt3 Window Spy��������Ƶ�Ŀ��ؼ���
 
27����굥��ϵͳ����ȷ����ť�����ǣ�
ControlClick, ȷ��, ϵͳ����
ControlClick, Button2, ϵͳ����
 
28��Ŀ�괰�ڻ�ؼ�������״̬��ControlClick�����Ե��Ŀ��ؼ���?
���Ե��Ŀ��ؼ��������ܱ�֤�ɹ��ʡ�
 
29��������ÿؼ��ı���
ControlSetText [, Ŀ��ؼ�, ���ı�, ���ڱ���, �����ı�, �ų�����, �ų��ı�]
���磺ControlSetText, Edit1, D:\foobar2000, Setup foobar
 
30�����ѡ�к�ȡ����ѡ��͸�ѡ����Ŀ�е�ѡ����Ŀ��
Control [, ����, ֵ, Ŀ��ؼ�, ���ڱ���, �����ı�, �ų�����, �ų��ı�]
���У����������������ָ��Ҫ���к������õĲ���������Щ��ѡ��/��ѡ��ť��˵�����õ������ǡ�Check���͡�UnCheck ����
 
���磺Control, Check, , Button5, foobar
Control, UnCheck, , Button7, foobar
 
31�����ѡ�������б����Ŀ��
����ʹ��Control������õ������ǡ�Choose, N���͡�ChooseString, String�����ֱ��ʾѡ�е�N����Ŀ��ѡ�����ַ���String
 
ƥ�����Ŀ�����磺
Control, Choose, 5, ComboBox1, Installer
Control, ChooseString, ��������, ComboBox1, Installer
 
32����������ض��壿
a::b
 
33���ַ�����ν����Զ��滻��
::is::island of resistance����
::china::
Clipboard=�л����񹲺͹�
send,^V
Return
 
34�����λ������̡���ꣿ
BlockInput ����󣬽���on�������μ���������������off�������������û����롣
��ν���������ꣿ��λָ��� BlockInput,MouseMove �ָ�Ϊ��BlockInput, MouseMoveOff
 
35����ν���һ������ʽ������ʾ�ı�����ιرգ�
SplashTextOn [, ���, �߶�, ����, �ı�]
`n ������MsgBox��SplashTextOn�������ж���ʾ���ı����л��С�
SplashTextOff Ϊ�ر�SplashTextOn������ĵ���ʽ���ڡ�
 
36����ν�һϵ��ָ���ظ�ִ��ָ�������� Loop [, Count]
{
ѭ���塭��
}
 
37��Loop�е�count�����Ǳ��ʽ���߱�����
Count�������Ǳ��ʽ����������һ��������
���֪��loop����ѭ�����ڼ��Σ� loop ָ��������һ������ A_Index ��������¼��ǰ״̬�ǵڼ���ѭ��
 
38������ж�ѭ����
if a_index > 25
break ; �ж�ѭ��
 
39�������������ѭ����
if a_index < 20
continue ; ��������ѭ������ʼһ���µ�ѭ��
 
40�����ʹʹ�ű��ȴ�ָ��ʱ�䣿
Sleep,ʱ�� ��λΪ����
 
41���������ѧ���㣬ʹ��ʲô�����ѱ��ʽ����Ľ������ĳ������
ʹ��ð�ŵȺŷ����磺NetPrice := Price * (1 - Discount/100)
 
42��i := i+1 �ļ�д����ʲô��
i + =1
 
43����λ�ȡָ��������������
Random, ������� [, ��Сֵ, ���ֵ]
 
44����δ�ָ���ı��ж�ȡָ���У�
FileReadLine, �������, �ļ���, ����
 
45������ж��ı������߽磿
ErrorLevel ���������õ�һ������������ȡ�ļ������߽�ʱ������ֵΪ1.
 
46��ErrorLevel Ϊ0��1ʱһ�����ʲô��
һ������£�Ϊ0��������ɹ���Ϊ1���������ʧ�ܡ�
 
47��һ������£���д����ʽ�˵������˳����ʲô��
1���ȶ����Ӳ˵��2����д�˵��3����д��˵���ʾ�Ĵ��룻4����дɾ�����룻5����д��Ӧ���롣
 
48���������Ӳ˵���
Menu,add,�Ӳ˵���,:�Ӳ˵������磺menu,mymenu,add,���ó���,:amenu
 
49�������ڵ���ʽ�˵�����ʾһ���ָ��ߵĴ����ǣ�
Menu, MenuName, add
 
50�������˵���Ĵ����ǣ�
Menu, MenuName, add,�˵���,��Ӧ��־
 
51����Ӧ����ĸ�ʽ�ǣ�
��Ӧ��־��
��Ӧ���롭��
return
 
52�����磺Menu,amenu,add,txt �Ĵ�����ʲô��˼��
����ʵ��Menu,amenu,add,txt,txt ��һ�ּ�д������˵������Ӧ��־
 
53����ָ�����괦��ʾ�˵���Ĵ����ǣ�
Menu,MenuName,show,X����,Y���� ��ʡ�����꣬������굱ǰλ����ʾ�˵��
 
54�����ָ����ʾ�˵��ı���ɫ��
Menu,MenuName,color,��ɫ����
 
55��ɾ�����в˵��Ĵ�����ʲô����ʲô���ã�
Menu,mymenu,deleteall
���û�������룬�����зָ��߻��ڲ˵�����ʱ���������޷ָ��ߣ�����
 
56���������رա�ע��ϵͳ��ָ����ʲô��
Shutdown ���0Ϊע��1Ϊ�ػ���2Ϊ������4Ϊǿ�ƹر� 8Ϊ�رչرյ�Դ
 
57�����ؽű�ͼ���м��ַ�����
Menu , tray , noicon ����#NoTrayIcon
 
58����ʾ�ű�ͼ��Ĵ��룿
Menu , tray , icon
 
59���ű�ͼ���������ʾ�����ʾ��
Menu , tray , tip , ���Լ��Ľű�
 
60��������ýű���ͼ�ꣿ
Menu , tray , icon , %systemroot%\system32\shell32.dll ,22����Menu , tray , icon , e:\ico\1.ico
 
61��������ÿ�ݼ��˳��ű���
#x::ExitApp
 
62������Ƴ�����ͼ������б�׼�˵��
Menu , tray , NoStandard
 
63����β�������ͼ��˵���
Menu , tray , add , myitem
 
64�������ʾ����ͼ��ı�׼�˵��
Menu , tray , standard
 
65��������ͼ����ʾһ�������˵�������α�ʾ��
menu,mymenu,add,boke
menu,mymenu,add,luntan
menu,tray,add,�����վ,:mymenu
Return ע�⣺��Ӧ��־���� �����ǣ���
 
66�����ʹ���ȼ���Ľű��־����У�
#Persistent
 
67����ʾһ����׼���ļ�ѡ��Ի���Ĵ���Ϊ��
FileSelectFile, OutputVar [, Options, RootDir, Prompt, Filter]
Option �����类ʡ�ԣ���Ϊ��ѡ��M ��ѡ��M�������������һ�����֡�S: ��ʾ����Ի�������Ϊһ��Ϊ3�����ļ���·��������ڡ�Filter ������ʽ�磺Example: Audio (*.wav; *.mp2; *.mp3)
 
68��FileSelectFile�������û�ѡ���˶���ļ������������ηָ
���������(`n)�ַ��ָ��һ������Ϊ·����������ѡ���ĸ����ļ�����
if files =
{
MsgBox, �û�����ѡ��
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
 
69�����в��ȴ�������ɵ�ָ���ǣ�
runwait
 
70����ĳ�ַ�������ηֽ��һ�������Ӵ���
Loop, Parse , ĳ�ַ��� , ���ڷָ����������
 
71���öԻ�����ʾ��������10%��
MsgBox, ��������10`%
 
72��ʹ��������ȡ������״̬��
SoundSet, +1, , mute ����Send,{Volume_Mute}
 
73��ʹ���������������ͣ�10%��
SoundSet ,+��-��10, MASTER
 
74��ʹ�����в����������������ͣ�10%��
SoundSet , +��-��10, WAVE
 
75��#NoEnv ������ʲô��
��Ҫ��Ϊ�����Ժ���ݣ�Ҳ���Ը�������
 
76����ζ�ĳЩ��ý�幦�ܼ��ض��壿
�����ű�����Ϊ#InstallKeybdHook��ִ�У�˫��ͼ�꣬������ѡ��˵� view ������ key ��ͷ��Ȼ�󰴶�ý���,f5ˢ��,���ڶ������ݱ���a,��ʾ��ֵ��01e ��ʹ��ʱ����sc01e::msgbox
 
77����ʾ���Ŀ�Ⱥ͸߶���������������ʾ��
A_ScreenWidth �� A_ScreenHeight
 
78������ƶ�����ꣿ
MouseMove, X, Y [, Speed, R] Speed �����ķ�Χ�� 0 (���) to 100 (����)֮��ȡֵ.
R ���� ����д˲�����������ƶ����Ե�ǰλ��Ϊ��׼������ x �� y ���ص�λ��.
 
79����λ�ȡ��ǰ������ꣿ
MouseGetPos, X, Y
 
80��MouseGetPos����ʲô���ã�
MouseGetPos ָ�������������ĵ�ǰλ�ã��Լ���굱ǰ��ͣ�Ĵ��ںͿؼ�����ʽΪ��
MouseGetPos, [OutputVarX, OutputVarY, OutputVarWin, OutputVarControl
OutputVarWin ��������洢�˵�ǰ�����ͣ�Ĵ��ڵ�ID ����ʹ����δ���ڼ���״̬��OutputVarControl ��������洢�˵�ǰ�����ͣ�Ŀؼ������ƣ�ClassNN����
 
81��MouseGetPos �����������1��2��3������ʲô��˼��
1���ڶ��ĵ������������ SysEdit �� TextPadThis ���п���׼ȷ�Ļ�ȡ������ö����Ӵ�����Ϣ������������Ͳ���ô׼ȷ�ˡ�2 ���� OutputVarControl �д洢 control's HWND/���ھ����3 ��ͬʱ���� 1 �� 2 �Ĺ��ܡ�
 
82���������Ļ�Ͻ���һ���������ĵ���ʽ���ڣ�
ToolTip [, Text, X, Y]
 
83����λ�õ�ǰλ�����ص���ɫRGB��ֵ��
PixelGetColor, OutputVar, X, Y [, RGB]
 
84�������ϵͳ���̽���һ������ʽ���ڣ�
TrayTip [, Title, Text, Seconds, Options] ע��senconds��ȡֵһ����10��30֮��
 
85�������ָ��ʱ�����Զ����ظ�����ĳ�ӳ���
SetTimer , Label , ʱ����
 
86���ر�ĳ���̵Ĵ����ǣ�
Process,close,autohotkey.exe
 
87����μ����������λ�õ���Ϣ��
MouseGetPos , , , id , control ; �õ��������λ�ô��ڵ�id���ؼ�����
WinGetTitle, title, ahk_id %id% ����������Ӧid��Ӧ���ڵı���
WinGetClass, class, ahk_id %id% ����������Ӧid��Ӧ���ڵ�����
 
88����εõ���������ڣ�
dd = %A_YYYY%��%A_MM%��%A_DD%��
 
89����θ������帳ֵ��
clipboard = %var%
 
90����ǰ�����Ǹ�������ʾ?
%A_Desktop%
 
91�������������ٶȣ�
SetDefaultMouseSpeed 30; Ĭ�ϵ���2 �����Դ�0����100��ԽСԽ��
 
92�����������궯������֮����ӳ٣�
SetMouseDelay 30; Ĭ����10����
 
93�����ʵ��ctrl+���˫����
send ^{click 100,200 2}
 
94��ʹ�������Ϲ�2�Σ�
click wheelup 2 ; wheelup ����д��WU
 
95���������¹�һ�Σ�
click wheeldown ��wheeldown ���Լ�ΪWD
 
96��ʹ���������¹�5���м��ַ�����
Click , WD,5��
loop 5
click WD
 
97����ǰλ����굥�����
click ��
right �Ҽ���left�����Ĭ�Ͽ�ʡ�ԣ���middle �м�
 
98����ǰλ�����˫�������
click 2
 
99���ƶ���굽30��40��
click 30 , 40 , 0
 
100���������Ҽ��Ĵ�����α�д��
Click , 100 , 200 , right
 
101�����������������Ƕ�̬����α��?
Click %x% %y%
 
102���϶�ĳͼ��?
click 30,40 down
click 50,60 up
 
103���������һ����������
Progress , %i% , ���������ı� , ���������ı� , ����
 
104����δ�����ݷ�ʽ��
FileCreateShortcut, Ŀ���ļ�, ��ݷ�ʽ�� [, ����Ŀ¼, �ÿո�ֿ��Ĳ���, ����, ͼ��, ��ݼ�, ͼ����, ����״̬]
ע�⣺ֻ��ָ���������������еĿ�ݼ���ָ��Ϊ CTRL+ALT + ��ݼ���������ò���ָ�� B���������һ�� CTRL-ALT-B �Ŀ�ݼ�������״̬1 - ����(Ĭ��)3 - ���7 - ��С��
 
105���ո��
{space}
 
106������ļ�ͷ
{Left}
 
107��ctrl����
^
 
108��alt����
!
 
109���س���
{enter}
 
110��С���̵�1��
Numpad1
 
111��Windows��?
#
 
112��Shift����
+
 
113���߼��룬�Ѷ�������������ϳ�һ���Զ������
&
 
114��һ�԰����е���ߵİ�����
< ��
 
116��ͨ�������ʾ�ȼ�������ʱ����ʹͬʱ���������İ������£���Ȼ��Ч��
*
 
117���ȼ��������󣬶������ᱻ������
~
 
118������ĳ����
�ڣ��������return���ɡ��磺RWin::return
 
119��������ӳ�䣿
a::b �磺RAlt::Rbutton ��altӳ��Ϊ����Ҽ�Lbutton����return ������������
 
120������notepad�н���a��b����
#IfWinActive ahk_class Notepad
a::b ;
#IfWinActive ;
 
121����궨�壿
LButton RButton MButton WheelDown WheelUp
 
122�����̶��壿
Space Tab Enter (or Return) Escape (or Esc) Backspace (or BS) Delete (or Del) Insert (or Ins) Home End PgUp PgDn Up Down Left Right ScrollLock CapsLock NumLock Numlock ON Numlock OFF Numpad0 NumpadPgUp NumpadDot (.) NumpadDel NumpadDiv (/) NumpadDiv (/) NumpadMult (*) NumpadMult (*) NumpadAdd (+) NumpadAdd (+) NumpadSub (-) NumpadSub (-) NumpadEnter NumpadEnter 1 a A LWin Control (or Ctrl) Alt Shift F1 PrintScreen CtrlBreak Pause Break
 
123��ע��
��������ע�͵����֮��ע�����ͷֺ�֮������Ҫ��һ���ո����Ҫע�Ͷ��������ʹ��
 
124��������
Add(x, y)
{
return x + y ; "Return" expects an expression.
}
��������ʱ�������ĺ���ʹ�� ��= ���磺Var := Add(2, 3) ;
����һ���������þ���һ�����ʽ�����Ժ����Ĳ����б�����ı���ǰ�治�ܼӰٷֺš�%�����෴�ģ��ַ���Ҫʹ�����š���һ������Ĳ������ú�����ʱ���������Ĳ�����֧�ֱ��ʽ���ͱ���ʹ�ðٷֺš�%�����磺
MsgBox % "The answer is: " Add(3, 2)
 
125�����Ҫ�������ַ����滻����Ͽո�
�����ĺ�߼��� `��:*:btw::By the way `
 
126����������
Drive, Eject,, 0
 
127���ջع���
Drive, Eject,, 1
 
128��ʹ����͸����ֵ��1-255֮�䣿
WinSet, Transparent, 100,�ҵĵ���
 
129������������������棿
SplashImage,d:\1.jpg,b fs18
Sleep,5000
b fs 18 ����ȥ������߿�ԭ����
 
130���޸Ľű�֮�󣬰�ס�����R��������ű�
~LButton & r::
reload
return
 
131����/������±�
IfWinExist �ޱ��� - ���±�
{
WinActivate
}
Else
{
Run Notepad
WinWait �ޱ��� - ���±�
WinActivate
}
 
132������������ WinHide ahk_class Shell_TrayWnd
��ʾ������ WinShow ahk_class Shell_TrayWnd
 
133�����ǿ�Ƶ��̣߳�
#SingleInstance force
 
134������Ctrl+Alt+Del��
Regwrite,REG_SZ,HKEY_LOCAL_MACHINE,SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe, Debugger, Hotkey Disabled
������� RegDelete,HKLM,SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe
 
135��˫������A����.��˫��,�Զ��ر�A����.
ifexist, ���򴰿ڱ���
winkill, ���򴰿ڱ���
else
run, �����ļ�·��
return
 
136����ǰ����ʼ�����ڶ���?
WinSet AlwaysOnTop, on, A
 
137���رյ�ǰ�������ڶ���״̬?
WinSet AlwaysOnTop, off, A
 
138�����ڻ������ñ�ʾ?
ahk_class class��ahk_pid %PID%��ahk_id %ID%
 
139�����ֲ��Ż���ͣ?
Send , {Media_Play_Pause}
 
140�����ֲ���ֹͣ��
Send , {Media_Stop}
 
141��������һ�ף�
Send , {Media_Prev}
 
142��������һ�ף�
Send , {Media_Next}
 
143��������������˼���
Send , {BROWSER_BACK}
 
144����������� ��ǰ����
Send , {BROWSER_FORWARD}
 
145�����������ˢ�¼���
Send , {BROWSER_REFRESH}
 
146�����������ֹͣ����
Send , {BROWSER_STOP}
 
147�������������������
Send , {BROWSER_SEARCH}
 
148������������ղؼ���
Send , {BROWSER_FAVORITES}
 
149�������������ҳ����
Send , {BROWSER_HOME}
 
150��ʹ������
Send , {VOLUME_MUTE}
 
151������������
Send , {VOLUME_DOWN}
 
152������������
Send , {VOLUME_UP}
 
153�����ʼ�����
Send , {LAUNCH_MAIL}
 
154���򿪲�������
Send , {LAUNCH_MEDIA}
 
155����ζ��ַ�����ĳ�ַ������滻��
StringReplace,CodeString, CodeString, ���滻 , �滻, All
 
156��������״̬���Ǹ�������ʾ��
% A_Cursor %
 
157����ǰ�ű�������·�����Ǹ�������ʾ��
%A_WorkingDir%
 
158�������ж��������ʧ�ܵĴ����ǣ�
if ErrorLevel
break
 
159�����������������ƶ���
��Click�����ʹ��Rel����Relative�������磺Click , 100 , 55 , rel
 
160�����ģ��Shift + �����
Send +{Click 100, 200}
 
161�����ģ��Ctrl +�Ҽ������
Send ^{Click 100, 200, right}
 
162���˳�����ֹĳ�� loopѭ�����Ǹ����
Break�磺
loop{ ... if var > 25 break ... if var <= 5 continue}
 
163�����ȷ���Ƿ�ɾ����λ�ո��Tab�����ã�
�ж�% A_AutoTrim% ��On ����Off ��
 
164�������ո�͵���Tab���ĸ�������ʾ��
% A_Space % �� % A_Tab %
 
165��"Var1 = %Var2%" ���ʽ���Զ�ʡ�� Var2 ����β�Ŀո��Tab ���ĸ�����ʵ�֣�
AutoTrim, On
 
166�������סһ����갴�������߹��������ֳ���Click�⻹���ĸ���
MouseClick [, WhichButton , X, Y, ClickCount, Speed, D|U, R]
 
167�������֣�WU ���Ϲ����� WD ���¹������֣������� ClickCount ������ʾ�������ֵĴ�����ClickCount��ʡ�ԣ���Ĭ�ϵ��1 �Ρ�D = ��ס��갴�����ţ�U = �ͷ���갴����R ����ƶ�
 
168��Mouse ��ͷ�ĺ�����WhichButton����Щѡ��
WhichButton ��Left/�����Right/�Ҽ���Middle/�м�����
 
169��Mouse ��ͷ�ĺ�����Speed ����Щѡ��
Speed ����ƶ����ٶȣ��� 0����죩�� 100��������
 
170���������סָ������갴�����ƶ���굽Ŀ��λ�ã��ͷ���갴����
MouseClickDrag, WhichButton, X1, Y1, X2, Y2 [, Speed, R]
X1, ��ʼλ�á�X2, Y2 Ŀ��λ������ R ����ƶ�
 
171��WinWaitActive,ahk_class MSPaintApp,, 2�����2����ʲô��
��ʱʱ�䣬��Ϊ��λ
 
172��ELSE��ɸ�ʲô���
�κε�������ܺ�һ��ELSE������ͬһ�С������ӵ�ж��У���Щ�б��뱻��������š��������ֻ��һ������һ��IF��һ��ELSE�����ô�������ǿ�ѡ�ġ�
 
173������������ֹ�ű����ĸ����
ExitApp �ű�����������ֹ������ű��� OnExit �ӳ���������ӦExitApp�����С�
�磺onexit,a
s::ExitApp
a:
msgbox,kk
Return
 
174�����ɾ��һ�������ļ���
FileDelete, FilePattern��FilePattern �����ļ������ƻ�һ����C:\Temp\*.tmp������ͨ�����ʽ���������·��û��ָ����FilePattern �ᱻ������ %A_WorkingDir% ��
 
175���Ƴ��������ļ��к��ļ��������ļ��У�
FileRemoveDir��DirName
 
176������Ƴ�ֻ������
FileSetAttrib, -R, C:\My File.txt
+ ��������- ȡ������^ ��������ȡ������R = ֻ��A = �浵S = ϵͳH = ����N = ��ͨ O = �ѻ� T = ��ʱ
 
177������ָ���ı�ǩ���Ҽ���ִ��?
Gosub, Label ��Label ��ת�ı�ǩ���ȼ���ǩ ���� ���ִ��ꡣReturn�ű�����Gosub���׸��������ִ�С�Exit��ֹ��ǰ���̡߳�
 
178����ǩ�����Ǳ�����
Label ������һ�� ���� �� %MyLabel%�����Label�����ڣ�����ʾһ������Ի���
 
179���ĸ��������Լ����ǩ�Ƿ����?
IsLabel(��ǩ��) �磺
if IsLabel(VarContainingLabelName)
Gosub %VarContainingLabelName%
 
180����ʾһ������Ի��򣬽����û���������ݣ�
InputBox, ������� [, ����, ��ʾ�ı�, HIDE, ���, �߶�, ������, ������, ��������, Timeout, Default]
HIDE �������ʹ�õ��� HIDE ����ô�û����������ݻᱻ���ء��������������ʱ������á�Timeout ��ʱʱ�䣬��λ���롣Default ����Ի������ʱĬ�ϳ�����������е����ݡ�
 
181������ļ����ļ��л��������Ƿ���ڣ�
IfExist, FilePattern����IfNotExist, FilePattern �磺
IfExist, D:\
MsgBox, ���������ڡ�
 
182����һ���ַ�������߻��ұ߿�ʼ��ȡһ���������ַ����Ǹ����
��ߣ�StringLeft, OutputVar, InputVar, Count
�ұߣ�StringRight, OutputVar, InputVar, Count
Count ��Ҫ��ȡ���ַ�������OutputVar ���Ժ� InputVar ��ͬ��
 
183����λ�ȡ�ַ������ȣ�
StringLen , OutputVar , InputVar InputVar ��Ҫͳ�Ƴ��ȵ��ַ�����������
 
184����ν�ĳ�ַ����е�Ӣ����ĸȫ��ת��Ϊ��д��Сд�������е�T��ʲô���ã�
Сд��StringLower, OutputVar, InputVar [, T]
��д��StringUpper, OutputVar, InputVar [, T]
T ����������ʹ����ĸ T ���ַ�������ת��Ϊ�����ʽ��
 
185������ж�ĳ�ַ����Ƿ�ȫ���Ǵ�д��Сд��ĸ��
����ʹ�á�if var is [not] upper/lower����
 
186����δ��ַ�����ָ����λ�÷���һ�������ַ���
StringMid, OutputVar, InputVar, StartChar [, Count , L]
StartChar ��ȡ����ʼλ�ã�Count��ʡ�Ի����գ�Ĭ����һ���㹻�洢�����ַ���ֵ�����򣬸ò�����ʾ��Ҫ��ȡ���ַ�������L�� StartChar ��ʼ�������ȡ�ַ�
 
187����ζ��ַ�����ָ�������ַ��������滻��
StringReplace, OutputVar, InputVar, SearchText [, ReplaceText, ReplaceAll ]
SearchText ���滻���ı��������ִ�Сд��ReplaceText �滻���ı���ReplaceAll��ʡ�ԣ�ֻ�е�һ��ƥ�� SearchText �����ַ����ᱻ�滻�������������� 1 ��A ���� All ��������ƥ������ַ����������滻�������������� UseErrorLevel ����ErrorLevel�д洢���滻�����ַ���������
 
188������ڼ��������Ƴ����У�
StringReplace, clipboard, clipboard, `r`n, , All
 
189����δ��ַ�������߻��ұ��Ƴ�ָ���������ַ�?
��ߣ�StringTrimLeft, OutputVar, InputVar, Count �ұߣ�StringTrimRight, OutputVar, InputVar, Count
 
190��д��һ��ֵ��ע��������Ǹ����
RegWrite, ValueType, RootKey, SubKey [, ValueName, Value]
 
191����ע����ж�ȡһ��ֵ���Ǹ����
RegRead, OutputVar, RootKey, SubKey [, ValueName]
 
192����ע�����ɾ��һ���Ӽ���һ��ֵ���Ǹ����
RegDelete, RootKey, SubKey [, ValueName]
 
193��ValueType����Щ��ѡ�
ֻ���� REG_SZ ��REG_EXPAND_SZ ��REG_MULTI_SZ ��REG_DWORD ���� REG_BINARY
 
194��RootKey ����Щ��ѡ�
ֻ����HKEY_LOCAL_MACHINE ��HKEY_USERS ��HKEY_CURRENT_USER ��HKEY_CLASSES_ROOT ��HKEY_CURRENT_CONFIG ����֮һ���������ǵ���д������ HKLM ����Ҫ����Զ��ע�����ǰ����ϵ�������һ��ð�ţ����磺\\workstation01:HKEY_LOCAL_MACHINE
 
195��SubKey����ʲô���壿
�Ӽ��������� Software\SomeApplication����� SubKey �����ڣ����������ĸ���֮���Զ������������գ�����ֱֵ��д�뵽 RootKey ��
 
196��ValueName ����ʲô��
��Ҫд��ֵ��������ơ�������ջ�ʡ�ԣ�Ĭ���޸ĵ��� Subkey ��Ĭ��ֵ��Ҳ������ RegEdit ����ʾΪ��(Default)/Ĭ�ϡ���ֵ
 
197��Value ����ʲô�� ��Ҫд���ֵ����ʡ�ԣ�Ĭ����һ�����ַ������� 0
 
198��IfEqual, var, value ��ͬ�ڣ� if var = value
 
199��IfNotEqual, var, value ��ͬ�ڣ� if var <> value) (!= ��������� <>)
 
200��IfGreater, var, value ��ͬ�ڣ� if var > value
 
201��IfGreaterOrEqual, var, value��ͬ�ڣ� if var >= value
 
202��IfLess, var, value ��ͬ�ڣ� if var < value
 
203��IfLessOrEqual, var, value ��ͬ�ڣ� if var <= value
 
204��If var ����ʲô�� �������������Ϊ�ջ��� 0 ����ô�������� false�����򣬽�Ϊ true��
 
205�����һ�������Ƿ������� values ֮�����Ǹ����
if var [not] between LowerBound and UpperBound
 
206����μ��ĳ�����Ƿ������һ�� values �б��ڲ���
if var [not] in value1,value2
if Done If ����if else ����if else ������
 
207�����ʹָ��������󻯣�
WinMaximize [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
208����ĳ�ض�����û��׼ȷ�ض�WinMaximize ������Ӧ��ô�죿
PostMessage, 0x112, 0xF030,,, WinTitle, WinText ; 0x112 = WM_SYSCOMMAND, 0xF030 = SC_MAXIMIZE�������������ƥ�����ǰ�˴�����
 
209�����Ǹ��������Ŀ�괰�������뽹��Ŀؼ���
ControlGetFocus, OutputVar [, WinTitle, WinText, ExcludeTitle, ExcludeText]
OutputVar �洢�ؼ���ʶ���ı������ƣ��� Button12��
 
210����η�ֹ��ǰ�̱߳������߳��жϣ�
Critical [, On | Off]���������ʡ�Ի��� On����ǰ���̲߳��ᱻ�����߳��жϡ�����Off������жϡ�
 
211�����ȡ��ı�ؼ���λ�úʹ�С��
ControlGetPos [, X, Y, Width, Height, Control, WinTitle, WinText, ExcludeTitle, ExcludeText]
X, Y �ǿؼ����Ͻ����ꡣ��ʡ�����꽫�������档Width/Height �ǿؼ��ĸߺͿ�Control �ؼ�������/�ı��� ClassNN (�ؼ������������)
 
212��Edit������ʲô���ã�
Edit ����ʹ�ù����ı༭���򿪵�ǰ�ű����б༭���൱������ͼ��˵���"Edit This Script"���
 
213���Ƿ�����ĳ�ű��ظ������У�
#SingleInstance [force|ignore|off]������ FORCE �������Ի��򣬲��Զ����滻�ɵ�ʵ����ʵ����ͬ Reload �������ơ�����IGNORE �������Ի��򣬲��þɵ�ʵ�����С����� OFF �������ű�ʵ��ͬʱ���С��������ʡ�ԣ�����ʾһ���Ի���ѯ���Ǳ��־ɵ�ʵ������ʹ���µ�ʵ�����滻����
 
214��#HotkeyInterval��ͬ #MaxHotkeysPerInterval һ���������ʲô��
ָ�� �ȼ� ��������ʣ���������һ����ʱ��������ʾһ������Ի���
��ʽΪ��#HotkeyInterval Milliseconds ������Milliseconds ����ĳ��ȣ��Ժ���Ϊ��λ��
 
215���ĸ����������ȴ�ƥ��ָ�������Ĵ��ڱ��رգ�
WinWaitClose [, WinTitle, WinText, Seconds, ExcludeTitle, ExcludeText]
 
216����ε��ô��ڲ˵��
WinMenuSelectItem, WinTitle, WinText, Menu [, SubMenu1, SubMenu2, SubMenu3, SubMenu4, SubMenu5, SubMenu6, ExcludeTitle, ExcludeText]
 
217����WinMenuSelectItem������Menu��������ʲô��
Menu �Ƕ����˵������ƣ����� File��Edit�ȣ�SubMenu1 ��Ҫѡ��Ĳ˵������ƻ�λ�ã�SubMenu2 ��� SubMenu1 �������Ӳ˵�����ô������������Ӳ˵�������ƻ�λ�á��Դ����ơ�Ҳ����ʹ�� 1& ��ʾ��һ���˵��2&��ʾ�ڶ����˵��
 
218�����Ǹ�����ǿ�ƹرմ��ڣ�
WinKill [, WinTitle, WinText, SecondsToWait, ExcludeTitle, ExcludeText]
 
219��WinKill������SecondsToWait�����кκ��壿
���ʡ�Ի����գ�������ȫ����ȴ������ʹ�� 0 ����ȴ� 500ms ����������ȴ�ָ����ʱ�䣨���԰���С���������һ�� ���ʽ �����ô��ڳ��׹رա�
 
220������/��ʾָ�����ڵ������ǣ�
WinHide/WinShow [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
221����С��ƥָ�����ڵ��������������ǣ�
WinMinimize [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
222�����ĳЩ���ڲ�����ȷ��Ӧ WinMinimize �����Գ���ʹ�ýű���
PostMessage, 0x112, 0xF020,,, WinTitle, WinText ; 0x112 = WM_SYSCOMMAND ��0xF020 = SC_MINIMIZE���������ֻ��ƥ�䴰���д�����ǰ�˵Ľ��в���
 
223��������׶˵Ĵ��ڵ������ǣ�
WinActivateBottom [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
224���ر�ָ�����ڵ������ǣ�
WinClose [, WinTitle, WinText, SecondsToWait, ExcludeTitle, ExcludeText] ������PostMessage, 0x112, 0xF060,,,WinTitle, WinText ; 0x112 = WM_SYSCOMMAND, 0xF060 = SC_CLOSE
 
225���ȴ�ָ�����ڴ��ڼ����δ����״̬�������ǣ�
WinWaitActive [, WinTitle, WinText, Seconds, ExcludeTitle, ExcludeText]
WinWaitNotActive [, WinTitle, WinText, Seconds, ExcludeTitle, ExcludeText]
Seconds ��ʱʱ�䡣���ձ�ʾ���޵ȴ���ָ�� 0 ��ͬ�� 0.5 ��
 
226���ȴ�ָ�����ڳ��ֵ������ǣ�
WinWait [, WinTitle, WinText, Seconds, ExcludeTitle, ExcludeText]����
 
227���ı�ָ�����ڵı���������ǣ�
WinSetTitle, NewTitle ��WinSetTitle, WinTitle, WinText, NewTitle [, ExcludeTitle, ExcludeText]
NewTitle Ŀ�괰�ڵ��±��⡣���ֻ�д˲�����Ĭ������һ��ƥ�䴰�� ��
 
228����С����ԭ���д��ڵ������ǣ�
WinMinimizeAll / WinMinimizeAllUndo ��������ͬ�� Explore �� Win-M �� Win-D ��ݼ���
 
229���ƶ�ָ�����ڵ������ǣ�
WinMove, X, Y
 
230���ƶ����ڸ��Ĵ�С�������ǣ�
WinMove, WinTitle, WinText, X, Y [, Width, Height, ExcludeTitle, ExcludeText]
 
231����ԭָ�����ڵ������ǣ�
WinRestore [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
232�����ĳЩ���ڲ�����ȷ��Ӧ WinRestore �����Գ���ʹ�õĽű�Ϊ��
PostMessage, 0x112, 0xF120,,, WinTitle, WinText ; 0x112 = WM_SYSCOMMAND ��0xF120 = SC_RESTORE
 
233��ƥ��ָ�������Ĵ��ڽ������ã��硰������ǰ�����Լ�͸���ȵ�ʹ���Ǹ����
WinSet, Attribute, Value [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
234��WinSet�к����AlwaysOnTop��ʲô���壿
��һ�����ڴ����ö�״̬��ʹ�� ON �������ã�ʹ�� OFF �ر����ã�ʹ�� TOOGLE �л����á����ʡ�ԣ�Ĭ���� TOOGLE��Ҳ����ʹ�õ��� Topmost �滻 AlwaysOnTop��
 
235������л��������ġ�������ǰ��״̬��
WinSet, AlwaysOnTop, toggle, Calculator
 
236��WinSet�к����Bottom��ʲô���壿
��һ�����ڷŵ���׶ˣ������д��ڵ����档����ʹ�� Alt��Escape ��ݼ������磺
WinSet, Bottom,, WinTitle
 
237��WinSet�к����Top��ʲô���壿
��һ�����ڷŵ���ǰ�˶������м�������������ϵͳ�����Զ���������
 
238��WinSet�к����Disable �� Enable��ʲô���壿
ͣ�û�����һ�����ڡ���һ�����ڴ���ͣ��״̬��ʱ���û������ƶ������������Ŀؼ����н��������⣬ͣ�õĴ���Ҳ���������alt-tab �б��С�
 
239��WinSet�к����Redraw��ʲô���壿
ͨ��֪ͨϵͳĳ������������Ҫ�ػ棬��ˢ��һ�����ڵĽ�������ݡ�
 
240��WinSet�к����Style,N �� ExStyle,N��ʲô���壿
�ֱ����ô��ڵ���ʽ����չ��ʽ����� N �еĵ�һ���ַ��ǼӺŻ���ţ��򴰿ڻ����ӻ��Ƴ� N ��ָ������ʽ����ͬʱָ�������ʽ����ͬ���������һ���ַ��Ƿ��š�`�������ڽ��� N ��ָ������ʽ�����л������������һ���ַ������֣�����ԭ����������ʽ�������ǣ����ױ�� N ��ָ������ʽ��������һ�����ڵ���ʽ֮�󣬿���ʹ������ WinSet Redraw �ػ洰��
 
241���Ƴ���ǰ����ڵı�������
WinSet, Style, -0xC00000, A
 
242����������ӵ�/�Ƴ��� alt-tab �б��С�
WinSet, ExStyle, ^0x80, WinTitle
 
243������ĳ���ڵ���״Ϊָ����״��
WinSet, Region [, Options, WinTitle, ...]
 
244��WinSet, Region��Options ���������к����ã�
���ڽ��ָ���ԭ������״
 
245��WinSet, Region��Options ��������ָ����Щ������
���ÿո�ָ�����������
Wn�����λ���Բ�εĿ���磺w200�� Hn�����λ���Բ�εĸ߶ȡ����磺h300
X-Y��X�� �� Y�� ���ꡣ�磬200-0 E����������״����Ϊ��Բ�Ρ�
R[w-h]�����÷��δ��ڵ�Բ�ǡ��磬R30-30 ����ʡ�� w-h ��Ĭ��ʹ�� 30-30 ��
 
246������һ����Բ���ڵĴ����磿
WinSet, Region, 50-0 W200 H250 E, WinTitle
 
247���������һ������δ��ڣ�
���ͬʱָ���� W �� H ������������ X-Y ������ָ���˶������꣬���ڵ���״����ɶ���Σ�ÿ�������Դ������Ͻ�Ϊԭ�㣩��
 
���磬���ָ���� 3 �����꣬���������´��ڵ���״���������Σ��������״ȡ���� 3 �������˳�򡣴��⣬�� Options ������Ҳ���Լ��ϵ��� Wind ���⽫��ʹ��һ�������ķ�ʽ����������ε���״��
 
248��������ô��ڵ�͸���ȣ�
WinSet, Transparent, N, WinTitle ��N Ϊһ�� 0 �� 255 �����֣�0 ��ʾ��ȫ͸����255 ��ʾ��ȫ��͸����ʹ�õ��� OFF ���׹رմ��ڵ�͸��Ч����
 
249������������������Ҳ�����ô�������͸���ȣ�
Gui -Caption +ToolWindow.
 
250��������������͸���ȣ�
WinSet, Transparent, 150, ahk_class Shell_TrayWnd
 
251�����ʹĿ�괰����ָ����ɫ������͸����
WinSet, TransColor, Color [N], WinTitle Color ����������һ����ɫ���ƻ�һ�� RGB ֵ����������ɫ�������һ��ʾ͸���ȵ����֣�0 - 255�������磺WinSet, TransColor, EEAA99 150, WinTitle��������û���������е�͸�����֣�����¼��ᡰ��͸���ô��ڴ��ݸ�����Ĵ��ڡ�
 
252������ô����а�ɫ�Ĳ���͸����
WinSet, TransColor, White, Untitled - Notepad ;
 
253�������ȫ�رմ��ڵ�͸�����ã�
WinSet, Transparent, Off, WinTitle ���� WinSet, TransColor, Off, WinTitle
 
254��ȡ���ű��� SplashText ���ڵ��ö�״̬��
WinSet , AlwaysOnTop , Off , SplashText���ڵı���
 
255���ô���ֻ��ʾָ���ķ��β��֣�
WinSet, Region, 50-0 W200 H250, WinTitle
 
256���ô�����Բ�ǵķ��Σ�
WinSet, Region, 50-0 W200 H250 R40-40, WinTitle
 
257���������δ��ڣ�
WinSet, Region, 50-0 250-0 150-250, WinTitle
 
258�������ڻָ�ԭ״��
WinSet, Region,, WinTitle
 
259���ڴ����д�����һ�����εġ�����?
WinSet, Region, 0-0 300-0 300-300 0-300 0-0 100-100 200-100 200-200 100-200 100-100, WinTitle
 
260�����ط���ָ�������Ĵ��ڵ� uID������ID���������ƣ���ؼ��б�,�������з���ָ�������Ĵ��ڵ��б�
WinGet, OutputVar [, Cmd, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
261��WinGet�� Cmd�����������ջ���ID�кκ��壿
���ش��ڵ� uID��HWND/�������
 
262��WinGet�� Cmd������ΪIDLast�кκ���?
��ƥ��Ĵ��ڳ���һ����ʱ�������ص��� ��׶�/���ʹ�� �Ĵ��ڵ� ID��
 
263��WinGet�� Cmd������ΪPID�кκ��壿
���ش��ڵ� ����ID��PID����
 
264��WinGet�� Cmd������ΪProcessName�кκ��壿
���ش����������̵Ľ�������
 
265��WinGet�� Cmd������ΪCount�кκ��壿
���ط���ָ�������Ĵ������������û��ƥ�䴰���򷵻� 0 ����Ҫͳ�Ƶ�ǰ�ܴ�������ʡ�����к� ����/�ı� �йصĲ�����
 
266��WinGet�� Cmd������ΪList�кκ��壿
�������з���ָ�������Ĵ��ڵ� uID ��ÿ�� ID ��һ�� ����Ԫ�� �洢������Ԫ������ OutputVar ��ʼ���� OutputVar ������洢������ĳ��ȡ����磬OutputVar ʹ�� MyArray ���� 2 ��ƥ�䴰�ڣ������ MyArray1 �洢�˵�һ�����ڵ� ID ������MyArray2 �洢�˵ڶ������ڵ� ID
 
267��WinGet�� Cmd������ΪMinMax�кκ��壿
���ش��ڵ� ��С��/��� ״̬������������ֵ֮һ��-1�����ڴ�����С��״̬;��1�����ڴ������״̬��0�����ڼȲ��������Ҳ��������С��״̬��
 
268��WinGet�� Cmd������ΪControlList�кκ��壿
����һ���б��������������пؼ������ơ�ÿ���ؼ������������� class ������ţ�ClassNN����ɣ��������һ���ؼ�������֮�⣬ÿ�����ƺ󶼸���һ�����з���`n����Ҫ�����������еĿؼ����ƣ�ʹ�� parsing loop
 
269��WinGet�� Cmd������ΪControlListHwnd���壿
����ͬ�ϣ���ͬ���������ص��ǿؼ��� ���ھ����HWND����
 
270��WinGet�� Cmd������ΪTransparent�кκ��壿
���ش��ڵ�͸����,OutputVar �洢һ�� 0 �� 255 ֮���ֵ��0 ��ʾ��ȫ͸����255 ��ʾ��͸����
 
271��WinGet�� Cmd������ΪTransColor�кκ��壿
���ش��ڵ�͸��ɫOutputVar �洢һ�� 6 λ��ʮ������������ʾ RGB ��ɫ�� 0x00CC99 ��
 
272��WinGet�� Cmd������ΪStyle �� ExStyle�κ��壿
����һ�� 8 λ��ʮ������������ʾ���ڵ���ʽ����չ��ʽ��
 
273�����һ�������Ƿ���� WS_DISABLED ��ʽ?
WinGet, Style, Style, My Window Title
if (Style & 0x8000000) ; 0x8000000 ��ʾ WS_DISABLED
 
274�����һ�������Ƿ�����ö���ʽ?
WinGet, ExStyle, ExStyle, My Window Title
if (ExStyle & 0x8) ; 0x8 ��ʾ WS_EX_TOPMOST.
 
275�����ǰ���ڲ����λ�á���С��Ϣ��
WinGetActiveStats, Title, Width, Height, X, Y ˵����Title �洢��ǰ����ڵı��⡣Width/Height �洢��ǰ����ڵĿ��ߡ�X, Y �洢��ǰ��������Ͻ�����ꡣ
 
276����ȡ��ǰ����ڵı��⣿
WinGetActiveTitle, OutputVar
 
277����εõ�ָ�����ڵ� class ��?
WinGetClass, OutputVar [, WinTitle, WinText, ExcludeTitle, ExcludeText]��
 
278����εõ�ָ�����ڵ�λ�úʹ�С��
WinGetPos [, X, Y, Width, Height, WinTitle, WinText, ExcludeTitle, ExcludeText]
X, Y Ŀ�괰�����Ͻǵ����ꡣWidth/Height Ŀ�괰�ڵĿ��ߡ������ WinTitle ʹ�á�Program Manager����������᷵������
 
279����εõ�ָ�������е��ı���
WinGetText, OutputVar [, WinTitle, WinText, ExcludeTitle, ExcludeText]
OutputVar �洢��ȡ���ı���ÿ����ȡ���ı�Ԫ��֮�󶼸���һ���س����з����ڽű����� `r`n ��ʾ��
 
280����εõ�ָ�����ڵı��⣿
WinGetTitle, OutputVar [, WinTitle, WinText, ExcludeTitle, ExcludeText]
 
281����μ���ָ�����ڣ�����������ǰ�ˣ�
WinActivate [, WinTitle, WinText, ExcludeTitle, ExcludeText ]
 
282���ȴ�ֱ�� �������к�������Ϊֹ?
ClipWait [, �ȴ�N��, 1] ������ʡ�ԣ���Ⱥ�ʱ�������ޡ�
 
283����μ���ĳ���ⲿ�ļ��ж���� ������
#Include �ļ�����Ŀ¼�� ���� #IncludeAgain �ļ�����Ŀ¼��
�磺#Include C:\My Documents\Scripts\Utility Subroutines.ahk
#Include ��ȷ��ÿ���ļ�����װ��һ�Σ�#IncludeAgain������װ��ͬһ���ļ���
���ļ�������ǰ����һ�� *i ǰ׺��һ���ո���󣬳��򽫺��Լ���װ���ļ�ʱ�������κδ������磺#Include *i SpecialOptions.ahk��