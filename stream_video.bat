@echo off
title youtube-dl Stream Video
:LOOP
set /p "MYURL=***URL: "
echo ***Opening youtube-dl and starting video stream in vlc . . .
echo:
echo [youtube-dl]
start /b youtube-dl --format "best[height<=480]" --output - %MYURL% | "C:\Program Files\VideoLAN\VLC\vlc.exe" -
echo:
if %ERRORLEVEL%==0 (echo ***Task successfully completed . . .) else (echo ***An error occured during execution . . .)
set /p "CONTINUE=***Would you like to continue? (y/n) "
if %CONTINUE%==y (
echo:
goto :LOOP)
if %CONTINUE%==Y (
echo:
goto :LOOP)
pause
exit