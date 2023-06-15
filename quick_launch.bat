@echo off
title yt-dlp Quick Launch
:LOOP
set /p "MYURL=***URL: "
echo ***Opening yt-dlp and executing task . . .
echo:
echo [yt-dlp]
start /wait /b yt-dlp.exe --format "bestaudio/best" --extract-audio --audio-quality 0 --audio-format aac --output "output\%%(title)s.%%(ext)s" --restrict-filenames %MYURL%
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