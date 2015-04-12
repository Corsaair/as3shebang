@echo off
rem shebang.bat - Unix shell behaviour from windows.
rem Use
rem     assoc .=shebangfile
rem     ftype shebangfile=shebang.bat "%1" %*
rem     set pathext=%pathext%;.
rem and put this somewhere in your path.
rem Author: Dion Nicolaas <dion@nicolaas.net>
rem http://whitescreen.nicolaas.net/programming/windows-shebangs
rem 
rem Get the first line of the file
set /p line=<%1
rem Remove all quotes from the string, they shouldn't be there anyway
set line=%line:"=%
rem turn each part of the path into a quoted string, separated by spaces
set line="%line:/=" "%"
rem set first to the first part ("#!"), last to the last part (e.g. perl -w)
for %%i in (%line%) do call :firstlast %%i
rem if it was a shebang line, set command accordingly, else use "type"
set command=type
if "%first%"=="#!" set command=%last%
if "%first%"=="#! " set command=%last%
rem Run command on the command line
%command% %*
goto :EOF
:firstlast
rem Get first and last token, unquote in the process (which will also strip 
rem spaces). In Unix scripts 'perl -w' is much more likely than "the language
rem processor" (long file name with spaces)
if "%first%"=="" set first=%~1
set last=%~1
