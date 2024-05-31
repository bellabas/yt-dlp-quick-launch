@echo off
title yt-dlp download video section full

:LOOP
set /p "MYURL=***URL: "
set /p "START=***START TIME: "
set /p "DURATION=***DURATION: "

echo ***Opening yt-dlp and executing task . . .
echo:
echo [yt-dlp]
yt-dlp.exe --merge-output-format mp4 --output "output\input.mp4" %MYURL%
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
ffmpeg.exe -ss %START% -i "output\input.mp4" -t %DURATION% -vcodec libx264 -acodec aac "output\output.mp4"

if not errorlevel 1 (
    echo ***Task successfully completed . . .
) else (
    echo ***An error occurred during execution . . .
)

del "output\input.mp4"

:CONTINUE
set /p "CONTINUE=***Would you like to continue? (y/n) "
if /i %CONTINUE%==y (
    echo:
    goto :LOOP
)
pause
exit
