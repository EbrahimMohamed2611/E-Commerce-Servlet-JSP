@echo off
for %%I in (*.jsp
) do (
    echo  ######################################################
    echo  == Original File == "%%I"
    echo  ......
    echo  == New File == "%%~nI.jsp" 
    echo  ######################################################
    echo.
    rename "%%I" "%%~nI.jsp"
)
pause
