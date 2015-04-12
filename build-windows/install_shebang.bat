@echo off
rem associate the empty extension with shebangfile file type
assoc .=shebangfile

rem define filte type "shebangfile" to run with shebang.bat
ftype shebangfile=shebang.bat "%1" %*

rem add the empty extension to path extension
set PATHEXT=%PATHEXT%;.
