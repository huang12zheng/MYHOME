set workspace=%cd%
set desc=C:\Windows
cd %desc%
if exist UnRAr.exe (
	echo "it is exist"
) else (
echo "no exist"
copy %workspace%\UnRAr.exe %desc%
)


pause