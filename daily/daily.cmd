:: Created by luobo, a tool for record daily tasks
@ECHO OFF

set DAILY_HOME=%USERPROFILE%\Documents\lb\daily
set MAX_INPUT_RETRY=3
set TODAY=%DATE:~0,4%-%DATE:~5,2%-%DATE:~8,2%

echo "1. add a daily <.md>"
echo "2. push daily to github"
echo "3. say hi!"
echo "please choose [1-2]:"

set /p input_source=
:input_loop
if "%input_source%"=="" (
    if %MAX_INPUT_RETRY% GTR 0 (
        echo %MAX_INPUT_RETRY% more retries left..
        set /a MAX_INPUT_RETRY-=1
        set /p input_source=
        goto input_loop
    ) else (
        echo retry run out,script quit..
    )
)

if "%input_source%"=="1" (
    IF NOT EXIST %DAILY_HOME% (
        MD %DAILY_HOME%
    )
    git -C %DAILY_HOME%\ pull
    echo # %TODAY%>%DAILY_HOME%\%TODAY%.md
    echo %DAILY_HOME%\%TODAY%.md create success..
    code -n %DAILY_HOME%
) else if "%input_source%"=="2" (
    git -C %DAILY_HOME%\ add .
    git -C %DAILY_HOME%\ commit -am "daily:)"
    git -C %DAILY_HOME%\ push
) else if "%input_source%"=="3" (
    echo hi,three!
) else if "%input_source%" NEQ "" (
    echo command [ %input_source% ] is not supported..
)