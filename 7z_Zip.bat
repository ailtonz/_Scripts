rem ***
rem *** Compactacao de arquivos em pasta ***
rem ***

rem https://winscp.net/eng/docs/scripting#commands
rem https://www.dotnetperls.com/7-zip-examples
rem https://ss64.com/nt/
rem https://ss64.com/nt/for.html

for /d %%X in (*) do "C:\tmp\7-Zip\7z.exe" a "%%X.7z" "%%X\"

pause
