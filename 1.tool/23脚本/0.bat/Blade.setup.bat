set str=%~dp0
cd /d %str%
echo %str%
set path=%str%lib;%PATH%
set classpath="%str%lib\*;%str%bin;.;%JAVA_HOME%\lib\dt.jar"
set temp=%1
if defined temp (
	echo "have arguments"
	java -jar runnable.jar "%1"
) else java -jar runnable.jar