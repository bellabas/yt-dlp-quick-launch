@echo off
setlocal enabledelayedexpansion
title yt-dlp download video section on the fly

:LOOP
set /p "MYURL=***URL: "
set /p "START=***START TIME: "
set /p "DURATION=***DURATION: "

echo ***Opening yt-dlp and executing task . . .
echo:
echo [yt-dlp]
for /f "delims=" %%a in ('yt-dlp.exe -f best --get-url "!MYURL!"') do set "videoURL=%%a"
echo The video URL is: !videoURL!
echo:

if not errorlevel 1 (
    echo ***Task successfully completed . . .
) else (
    echo ***An error occurred during execution . . .
    goto :CONTINUE
)

echo ***Opening ffmpeg and executing task . . .
echo:
echo [ffmpeg]
ffmpeg.exe -ss !START! -i !videoURL! -t !DURATION! -vcodec libx264 -acodec aac "output\output.mp4"

if not errorlevel 1 (
    echo ***Task successfully completed . . .
) else (
    echo ***An error occurred during execution . . .
)

:CONTINUE
set /p "CONTINUE=***Would you like to continue? (y/n) "
if /i "!CONTINUE!"=="y" (
    echo:
    goto :LOOP
)
endlocal
pause
exit
