REM SCHTASKS /parameter [arguments] 描述:
    REM 允许管理员创建、删除、查询、更改、运行和中止本地或远程系统上的计划任
    REM 务。参数列表:
    REM /Create         创建新计划任务。
	REM /Delete         删除计划任务。
	REM /Query          显示所有计划任务。
	REM /Change         更改计划任务属性。
	REM /Run            按需运行计划任务。
	REM /End            中止当前正在运行的计划任务。
	REM /ShowSid        显示与计划的任务名称相应的安全标识符。
    REM /?              显示此帮助消息。
REM Examples:
    REM SCHTASKS 
    REM SCHTASKS /?
    REM SCHTASKS /Run /?
    REM SCHTASKS /End /?
    REM SCHTASKS /Create /?
    REM SCHTASKS /Delete /?
    REM SCHTASKS /Query  /?
    REM SCHTASKS /Change /?
    REM SCHTASKS /ShowSid /?

::chcp 437
schtasks /F /create /tn "008git_periodically" /tr 008git_periodically.bat /sc  HOURLY /MO 3 /st 09:30 /et 21:31 
