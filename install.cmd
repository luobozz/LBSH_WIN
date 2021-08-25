:: Created by luobo, please don't edit manually.
@ECHO OFF

SET LB_HOME=%appdata%\lbzz\

IF NOT EXIST %LB_HOME% (
    MD %LB_HOME%
)

ECHO "%TEST%"
ECHO "=========="
ECHO "%TEST%%LB_HOME%;"

ECHO "%TEST%"| FINDSTR "%LB_HOME%" >nul && (
    ECHO 1
) || (
    SET TEST="%TEST%%LB_HOME%;"
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v "TEST" /t REG_EXPAND_SZ /d "%TEST%" /f
    ECHO 2
)