@echo off
rem echo %CD% 
set dirc=%CD%;

echo %dirc%
rem set /p c=
set  NA=1
rem set /A NA=%NA%+1

set MainKopieWork=c:\KopieWork\




set W=
:Poczatek

rem echo %NA%
rem echo %dirc%

set Z=%dirc:~0,1%
if "%dirc%" == ";" goto koniecG
rem echo Zank"%Z%"
 if "%Z%"=="" goto koniecG
if "%Z%"=="\" goto slesh
set W=%W%%Z%
goto dalej
:slesh
 rem echo kasuje 
set W=
:dalej
rem echo "%W%"
set k=%dirc:~1,250%
set dirc=%k%

if %NA%==255  goto :koniecG
set /A NA=%NA%+1
goto :poczatek

:koniecG

echo Okreslilem katalog : %W%

if  "%w%"=="" goto koniec

rem set NazwaK=PasToDocDoxyConwerter
set NazwaK=%W%
echo %MainKopieWork%%NazwaK%\
md "%MainKopieWork%%NazwaK%\"


set KatSrc=.
Set KatDest=%MainKopieWork%%NazwaK%\%date:~0,10%
IF NOT EXIST "%KatDest%" GOTO istnieje
Set KatDest=%KatDest%-%time:~0,2%-%time:~3,2%-%time:~6,2%


:istnieje

echo koopiuje do :  %KatDest%

md "%KatDest%"

 xcopy /E "%KatSrc%" "%KatDest%"
 del /Q /S "%KatDest%"*.git
 del /Q /S "%KatDest%".gitmodules
 del /Q /S "%KatDest%".gitignore

:koniec
