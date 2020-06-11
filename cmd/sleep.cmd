@ECHO OFF

rem --#------------------------------------------------------------------ 

rem --# Script  : sleep.BAT

rem --# Tested  : Microsoft Windos XP [Version 5.1.2600]

rem --# Purpose : Sleep for number of seconds

rem --#           Every 2 pings to localhost takes about 1 second

rem --#

rem --# Usage   : sleep.BAT {# of seconds to sleep}

rem --#------------------------------------------------------------------ 



ECHO %TIME%

FOR /l %%a IN (%1,-1,1) do (ECHO 1 >NULL %%as&ping -n 18 -w 1 127.0.0.1>NUL)

ECHO %TIME%