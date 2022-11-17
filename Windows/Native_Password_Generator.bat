:::::::::::::::::
:: Script: NativePasswordGenerator
:: Author : Thamir Alshammari
:: Note: any change to this script possiblty make it non-usable. You use it on your own risk.
:::::::::::::::::

@ECHO off
setlocal EnableDelayedExpansion

:: accept password combinatin from the user
:type
echo:
echo 1- Numeric
echo 2- Alphabet
echo 3- Alphanumeric
echo 4- Complex
echo:
set /p type=Choose Password Combination (1-4):
if not "%type:~1,1%"=="" goto type
if %type% lss 1 goto type
if %type% gtr 4 goto type
if %type%==1 (set "group=0123456789")
if %type%==2 (set "group=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
if %type%==3 (set "group=0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")
if %type%==4 (set "group=0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!&_%#$*@*+-^[]")


:: accept password lenght from the user
:len
set /p password_length=Choose Password Length:
if %password_length% lss 1 goto len
if %password_length% gtr 500 goto len
 

call :strLen_Loop group strlen
set /A strlen=%strlen%-1

set password=
 
FOR /L %%i IN (1, 1, %password_length%) DO (
	set /A r=!random!*!strlen!/32768+1
	call set l=%%group:~!r!,1%%
	set password=!password!!l!
)

echo:
echo Password:
echo !password!
echo:

exit /b 
 

:strLen_Loop
if not "!%1:~%len%!"=="" set /A len+=1 & goto :strLen_Loop
(endlocal & set %2=%len%)
