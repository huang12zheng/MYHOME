REM date=2017-01-25 周三
REM time=21:58:44.94
set day=%date:~0,4%%date:~5,2%%date:~8,2%_
REM %time:~0,2%%time:~3,2%
REM set filename=%day%业务资源.txt
set filename=业务资源.txt
echo off>%filename%
echo Keep:今日完成了哪些工作:>>%filename%
echo [任务--子任务(完成)]>>%filename%
echo 	1.>>%filename%
echo 今日未完:>>%filename%
echo 	1.>>%filename%
echo Problem:遇到了哪些问题:>>%filename%
echo 	1.暂停区>>%filename%
echo 	2.完成区>>%filename%
echo 	3.解决中>>%filename%
echo Try:准备尝试哪些措施:>>%filename%
echo [(需求,设计,测试,完成)]>>%filename%
echo 	1.>>%filename%
echo Plan:明日任务:>>%filename%
echo 	1.>>%filename%
echo revise:今日反思:>>%filename%
echo 	1.灵感>>%filename%
echo 	2.>>%filename%
echo diary:日记:>>%filename%
echo 	1.>>%filename%