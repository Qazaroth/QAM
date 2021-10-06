@echo off
setlocal EnableDelayedExpansion
set GAMESDIR=%~1

cls
set fileIndex=0
set file=""

echo -----------------------------------------------
echo                 Games List
echo -----------------------------------------------
for %%A in ("%GAMESDIR%*.*") do (
    set /a fileIndex+=1
    echo !fileIndex! - %%~nA
)
echo -----------------------------------------------
set /a fileIndex=0
set /P "G=Input a number:"
if "%G%" equ "" set "G=0"
for %%A in ("%GAMESDIR%*.*") do (
    set /a fileIndex += 1
    if "%G%"=="!fileIndex!" (
        set file=%%A
        goto GAMESBREAK
    )
)

:GAMESBREAK
CD %GAMESDIR%
if not %file%=="" (
    for %%i in ("%file%") do (
        set drive=%%~di
        set path=%%~pi
        set name=%%~ni
        set ext=%%~xi

        start "" "!name!!ext!"
    )
)
cd /D "%~dp0"
