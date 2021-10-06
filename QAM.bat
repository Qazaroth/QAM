Rem This is the main file
@echo off
setlocal EnableDelayedExpansion

for /f "delims=" %%x in (config.txt) do (
    set a=%%x
    set beg=!a:~0,2!

    if not "!beg!"=="//" (
        set "%%x"
    )
)

cd /D "%~dp0"
cls
title Quick Access Menu (Q.A.M)
goto MENU

:MENU
cls
echo -----------------------------------------------
echo       Quick Access Menu (Input number)
echo -----------------------------------------------
echo 1 - Play a game
echo 2 - Exit
echo -----------------------------------------------
SET /P "M=Input a number:"
if %M%==1 GOTO GAMES
if %M%==2 GOTO EXITS

:GAMES
call gameslib.bat %GAMESDIR%
pause
goto EXITS

:EXITS
cls
echo Ending task...
pause
