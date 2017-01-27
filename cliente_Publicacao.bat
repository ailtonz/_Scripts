rem
rem
rem CRIAR PASTA COM DATA E HORA PARA UPLOAD
rem
rem

@echo off

SET Today=%Date: =0%
SET Year=%Today:~-2%
SET Month=%Today:~-7,2%
SET Day=%Today:~-10,2%

set hr=%TIME: =0%
set hr=%hr:~0,2%
set min=%TIME:~3,2%


rem echo %Year%%Month%%Day%-%hr%%min%


md C:\Publicacao\cliente_%Year%%Month%%Day%-%hr%%min%

echo.
echo CONCLUIDO!!!
echo.

pause
rem exit