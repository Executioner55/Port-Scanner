@echo off
Title Port Checker by Executioner
set /p Port=Port=
IF "%Port%"=="" set /A Port=57614
IF "%Port%"=="scan" set /A Port2=0 && cls && goto RapidScan:
cls
curl -s https://ipv4.am.i.mullvad.net/port/%Port% | findstr "false" >nul
IF "%errorlevel%"=="0" echo [40;37mPort : [40;33m%Port% [40;37mis [40;31mClosed
IF "%errorlevel%"=="1" echo [40;37mPort : [40;33m%Port% [40;37mis [40;32mOpen
pause>nul
exit
:RapidScan
cls
set /p MaxPort=Max Port[Program end on Port reached]=
IF "%MaxPort%"=="" goto RapidScan:
cls
:RapidScan2
curl -s https://ipv4.am.i.mullvad.net/port/%Port2% | findstr "false" >nul
IF "%errorlevel%"=="0" echo [40;37mPort : [40;33m%Port2% [40;37mis [40;31mClosed
IF "%errorlevel%"=="1" echo [40;37mPort : [40;33m%Port2% [40;37mis [40;32mOpen
set /A Port2=%Port2%+1
IF "%Port2%"=="%MaxPort%" goto break:
goto RapidScan2:
:break
pause>nul
exit
