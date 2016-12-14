@echo off
if exist log.txt del log.txt
echo Easy Prompt Log >> log.txt
echo If Easy Prompt crashes, please make a new issue on GitHub with the log file output >> log.txt
echo The GitHub link is: https://github.com/CoolMan119/EasyPrompt >> log.txt
echo [%time%]: Program Launched >> log.txt
set version = 2.0
title Easy Prompt V2.0

if not exist Users goto setup
if exist Users goto user

:user
echo [%time%]: Prompting User to enter Username. >> log.txt
echo Easy Prompt V2.0 Login
echo.
set /p user= "Username: "
echo [%time%]: User typed in. Checking Username... >> log.txt
if exist Users\%user% goto pass
if not exist Users\%user% goto userwrong

:userwrong
cls
echo [%time%]: Username Wrong! >> log.txt
echo Easy Prompt V2.0 Login
echo Error: Username Wrong!
echo.
set /p user= "Username: "
if exist Users\%user% goto pass
if not exist Users\%user% goto userwrong

:pass
echo [%time%]: Username Correct! Prompting user to enter password. >> log.txt
set /p pass= "Password: "
set /p read=<"%cd%\Users\%user%\Password\password.txt"
if %read%==%pass% echo [%time%]: Password Correct! >> log.txt && goto continue else goto passwrong

:passwrong
echo [%time%]: Password Wrong! >> log.txt
cls
echo Error: Password Wrong!
set /p pass= "Password: "
set /p read=<"%cd%\Users\%user%\Password\password.txt"
if %read%==%pass% goto continue else goto passwrong

:setup
cls
echo [%time%]: First time use detected, launching Setup. >> log.txt
echo Welcome to Easy Prompt V2.0!
echo.
echo The new Easy Prompt is smaller, faster, and better overall.
echo.
echo You will need to create a user before you can continue.
echo You can store your own apps, customize, etc. with your own user account
echo. 
set /p user= "Username: "
if exist %user% goto userexist
set /p pass= "Password: "
echo.
echo Creating User...
set olddir=%cd%
mkdir Users
cd Users
mkdir %user%
cd %user%
mkdir Apps
mkdir Password
mkdir Files
cd Password
echo %pass% >> password.txt
cd ..
cd Files
echo Welcome to Easy Prompt V2.0! >> welcome.txt
echo. >> welcome.txt
echo The new Easy Prompt is smaller, faster, and better overall. >> welcome.txt
echo. >> welcome.txt
echo This is your files that you can store. It will use space on your HDD So dont treat this like a cloud >> welcome.txt
cd %olddir%
echo Done!
timeout /t 1 >nul
cls
goto user


:userexist
echo [%time%]: User already exists! (Setup) >> log.txt
echo Welcome to Easy Prompt V2.0!
echo.
echo The new Easy Prompt is smaller, faster, and better overall.
echo.
echo You will need to create a user before you can continue.
echo You can store your own apps, customize, etc. with your own user account
echo Error: Username Already Exists!
echo.
set /p user= "Username: "
if exist %user% goto userexist
set /p pass= "Password: "
echo.
echo Creating User...
set olddir=%cd%
cd Users
mkdir %user%
cd %user%
mkdir Apps
mkdir Password
mkdir Files
cd Password
echo %pass% >> password.txt
cd ..
cd Files
echo Welcome to Easy Prompt V2.0! >> welcome.txt
echo >> welcome.txt
echo The new Easy Prompt is smaller, faster, and better overall. >> welcome.txt
echo >> welcome.txt
echo This is your files that you can store. It will use space on your HDD So dont treat this like a cloud >> welcome.txt
cd %olddir%
echo Done!
timeout /t 1 >nul
goto continue



:continue
echo [%time%]: Went to Shell >> log.txt
cls
echo Easy Prompt V2.0

echo.
echo Type in help to list all commands
echo.
echo Have a nice day :)

:typecmd
set /p cmd="> " 
echo [%time%]: User typed %cmd% >> log.txt
if %cmd%==help goto help
if %cmd%==clear goto clear
if %cmd%==exit goto exit
if %cmd%==calc goto calc
if %cmd%==ls goto dir
if %cmd%==dir goto dir
if %cmd%==winver goto winver
if %cmd%==apps goto apps
if %cmd%==store goto store
if %cmd%==pastebin goto pastebin
if %cmd%==logout goto logout
echo Invaild Command!
goto typecmd

:exit
echo [%time%]: Program Ended >> log.txt
exit

:help
echo Help:
echo help - Load's the help screen
echo clear - Clear's the screen
echo exit - Exit's EasyPrompt
echo calc - Calculator
echo ls - List's all files in current directory
echo winver - Display's Windows Version
echo apps - List's all apps you have
echo store - App store (Experimental)
echo tweet - Tweet something!
echo pastebin - Get a file from pastebin!
echo logout - Logout Easy Prompt
goto typecmd

:clear
cls
goto typecmd

:home
echo [%time%]: The program is finished. >> log.txt 
cls
echo The program is finished.
goto typecmd

:calc
echo [%time%]: Calculator Launched >> log.txt
cls
echo Add = +
echo Subtract = -
echo Divide = /
echo Multiply = *
echo Type "exit" to exit
echo Type "clear" to clear
echo.
goto calc2
:calc2
set /p problem= "Calculator> "
if %problem%==exit goto home
if %problem%==clear cls
set /a sum = %problem%
echo Answer: %sum%
goto calc2

:dir
dir
goto typecmd

:winver
ver
goto typecmd

:apps
dir "%cd%\Users\%user%\Apps\"
goto typecmd

:store
cls
if not exist applist.txt goto download
if exist applist.txt goto main

:download
echo Downloading App List...
wget --no-check-certificate https://raw.githubusercontent.com/CoolMan119/EasyPrompt/master/apps/applist.txt
title Easy Prompt V2.0
cls
goto main

:main
cls
echo --- HouseStore ---
echo Apps:
type "%cd%\applist.txt"
echo.
echo If you want your app on the store, please contact House
echo Type exit to exit
echo ------------------
echo.
set /p app= "App: "
if %app%==exit goto b
goto installapp

:mainb
del author.txt
del version.txt
goto main

:b
cls
echo --- HouseStore ---
echo Cleaning up...
if exist version.txt del version.txt
if exist author.txt del author.txt
if exist applist.txt del applist.txt
goto home

:installapp
cls
REM Installing version file
wget --no-check-certificate https://raw.githubusercontent.com/CoolMan119/EasyPrompt/master/apps/%app%/version.txt
wget --no-check-certificate https://raw.githubusercontent.com/CoolMan119/EasyPrompt/master/apps/%app%/author.txt
title Easy Prompt V2.0
set /p ver=<"%cd%\version.txt"
set /p author=<"%cd%\author.txt"
cls
echo --- HouseStore ---
echo Program Name: %app%
echo By: %author%
echo Version: %ver%
set /p confirm= "Install (Y/N): "
if %confirm%==N goto mainb
if %confirm%==n goto mainb
cls
echo --- HouseStore ---
echo Downloading %app%...
wget --no-check-certificate https://raw.githubusercontent.com/CoolMan119/EasyPrompt/master/apps/%app%/program.bat
title Installing %app%
echo Installing %app%...
move "program.bat" "%cd%\Users\%user%\Apps\%app%.bat"
cls
title Easy Prompt V2.0
echo --- HouseStore ---
echo Cleaning up...
del version.txt
del author.txt
timeout /t 1 /nobreak >nul
cls
echo --- HouseStore ---
echo Installation Complete!
timeout /t 1 /nobreak >nul
cls
goto main

:pastebin
set /p code= "Code: "
set /p file= "File: "
cls
echo Connecting to http://www.pastebin.com...
echo.
echo.
wget --no-check-certificate "http://www.pastebin.com/raw.php?i=%code%"
rename "index.html" "%file%"
cls
echo Connecting to http://www.pastebin.com... Sucess
echo Downloaded as %file%
pause
goto home

:logout
REM Log's the user off Easy Prompt
cls
echo -- Logout Sucessful --
echo.
goto user
