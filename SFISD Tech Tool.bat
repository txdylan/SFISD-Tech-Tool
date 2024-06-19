@echo off
title SFISD Tech Tool
:start
color 02
echo Santa Fe Independent School District Technology
echo.   
echo               ........                            
echo     .:^~~!!!!!!77777777!!!~~^^!!~7~               
echo   !7!!~^^^:!7~~^^^^^^^^~!!!!~~^^:J?               
echo  5!::::::::?7^:.          .^!7!^:J?               
echo  J7^::::::::^~~!!!!!!~~~^^:.  ~~~!^               
echo   :~!!!~~^^^^::::::::^^^~~~~!!!~~^:......         
echo !~^~: .:^~~~!!!!!!7!~~~^^::::::^^~!YY7777!!!~!!!!5
echo G~^~77~.         :G~~!!7777^:::::::~P^^^^~~!!~::^G
echo G^:::^~!!~^::.    P^:::::^!J?:::^~77:  7~!! .~?!!Y
echo P!~~!!!~~!!!777!!7G^::::::::JYJ??7~:^!?!:!5    .  
echo ::::.  .::^^^~~~~!G^::::::::^?7777777~:::!Y       
echo                   P^::::::::7Y .....:~?!^75       
echo                   P^::::::::7Y         ~^~^       
echo             :::::!J:::::::::^Y^::::               
echo             Y?77?7~!!!!!!!!!!!77775:              
echo              ......................   
echo.
echo This script was intended for sysadmin use only.
set /p user_input=Would you like to continue (y/n)?:~$
if not defined user_input goto start
if /i %user_input%==y goto selection
if /i %user_input%==Ver goto version
if /i %user_input%==n (goto no) else (goto invalid)

:no
echo user has selected No
pause
exit

:invalid
color 04
echo %user_input% is an invalid entry, try again.
set user_input=""
pause
cls
goto start

------------------------------------------------------------------------------
Version

:version
cls
color 0f
echo Script Build: v1.1
echo OS Build: Windows 11
echo Created By: Dylan Piecznski
echo.
echo Please note any issues you encounter
pause
cls
goto start

------------------------------------------------------------------------------
Selection

:selection
cls
color 0f
echo Please Type One of The Following Selections - 
echo  Firmware, Intunes, SCCM, Store
set /p user_input=:~$
if not defined user_input goto start
if /i %user_input%==firmware goto firmware
if /i %user_input%==store goto msstore
if /i %user_input%==intunes goto intunes
if /i %user_input%==sccm goto sccm
if /i %user_input%==exit (goto end) else (goto invalid)

------------------------------------------------------------------------------
Dell Firmware

:firmware
cls
color 03
echo Welcome to the firmware update center!
echo (Last Updated 06/13/2024)
echo.
echo Installer is for Dell Latitudes only!!
set /p user_input=Input laptop model number:~$
if not defined user_input goto start
if /i %user_input%==Back goto selection
if /i %user_input%==3120 goto firmware3120
if /i %user_input%==3140 goto firmware3140
if /i %user_input%==3190 goto firmware3190
if /i %user_input%==3310 goto firmware3310
if /i %user_input%==3390 goto firmware3390
if /i %user_input%==3410 goto firmware3410
if /i %user_input%==Support goto dellsuport
if /i %user_input%==SupportAssist goto supportassist
if /i %user_input%==ls goto firmwarels
if /i %user_input%==exit (goto end) else (goto invalid)

:firmwarels
echo.
echo Dell Latitude 3120
echo Dell Latitude 3140
echo Dell Latitude 3190
echo Dell Latitude 3310
echo Dell Latitude 3390
echo Dell Latitude 3410
echo Support
echo.
pause
goto firmware

:firmware3120
Start "" "D:\Script Data\Firmware\Latitude_3120_1.26.0.exe"
goto end

:firmware3140
Start "" "D:\Script Data\Firmware\Latitude_3140_1.15.0.exe"
goto end

:firmware3190
Start "" "D:\Script Data\Firmware\Latitude_3190_1.34.0.exe"
goto end

:firmware3310
Start "" "D:\Script Data\Firmware\Latitude_3310_2in1_1.24.0.exe"
goto end

:firmware3390
Start "" "D:\Script Data\Firmware\Latitude_3390_1.31.0.exe"
goto end

:firmware3410
Start "" "D:\Script Data\Firmware\Latitude_3410_3510_1.29.0.exe"
goto end

:dellsuport
start https://www.dell.com/support/home/en-us
goto firmware

:supportassist
Start "" "D:\Script Data\Installers\SupportAssistInstaller.exe"
goto end

------------------------------------------------------------------------------
Online Installs

:msstore
cls
color 0f
echo Microsoft Store -
echo Ipevo, Minecraft, Office365, Outlook, PCManager, PowerToys,
echo  QuickAssist, Surface, Unifying, VLC, WhiteBoard, Exit
echo.
set /p user_input=Type an option from the list:~$
if not defined user_input goto msstore
if /i %user_input%==Back goto selection
if /i %user_input%==Update goto msupdate
if /i %user_input%==Minecraft goto minecraftedu
if /i %user_input%==WhiteBoard goto mswhiteboard
if /i %user_input%==Ipevo goto ipevo
if /i %user_input%==Surface goto surface
if /i %user_input%==QuickAssist goto quickassist
if /i %user_input%==Office365 goto office365
if /i %user_input%==VLC goto vlc
if /i %user_input%==Unifying goto unifying
if /i %user_input%==PowerToys goto powertoys
if /i %user_input%==PCManager goto pcmanager
if /i %user_input%==Outlook goto outlook
if /i %user_input%==exit (goto end) else (goto msstoreinvalid)

:msstoreinvalid
color 04
echo %user_input% is an invalid entry, try again.
set user_input=""
pause
goto msstore

:msupdate
winget upgrade -h --all
echo Task Completed.
pause
goto msstore

:minecraftedu
winget install 9NBLGGH4R2R6
echo Task Completed.
pause
goto msstore

:mswhiteboard
winget install 9MSPC6MP8FM4
echo Task Completed.
pause
goto msstore

:ipevo
winget install 9PFXWFL0PB4S
echo Task Completed.
pause
goto msstore

:surface
winget install 9WZDNCRFJB8P
echo Task Completed.
pause
goto msstore

:quickassist
winget install 9P7BP5VNWKX5
echo Task Completed.
pause
goto msstore

:office365
winget install Microsoft.Office
echo Task Completed.
pause
goto msstore

:vlc
winget install XPDM1ZW6815MQM
echo Task Completed.
pause
goto msstore

:unifying
winget install Logitech.UnifyingSoftware
echo Task Completed.
pause
goto msstore

:powertoys
winget install XP89DCGQ3K6VLD
echo Task Completed.
pause
goto msstore

:pcmanager
winget install 9PM860492SZD
echo Task Completed.
pause
goto msstore

:outlook
winget install 9NRX63209R7B
echo Task Completed
pause
goto msstore

------------------------------------------------------------------------------
Intunes Commands

:intunes
cls
color 0f
echo Intunes is Selected.
echo.
echo List: TimeSync, SystemClean, NetReset, WinRepair, DelProfiles, Connect,
echo TXSecure, VEXCode, 3410Audio, Exit
echo.
set /p user_input=Type an option from the list:~$
if not defined user_input goto intunes
if /i %user_input%==Back goto selection
if /i %user_input%==TimeSync goto intunestime
if /i %user_input%==SystemClean goto intunessysclean
if /i %user_input%==NetReset goto intunesnet
if /i %user_input%==WinRepair goto intuneswinrepair
if /i %user_input%==DelProfiles goto intunesprofile
if /i %user_input%==Connect goto intunesconnect
if /i %user_input%==TXSecure goto intunestxsecure
if /i %user_input%==VEXCode goto intunesvexcode
if /i %user_input%==3410Audio goto intunes3410audio
if /i %user_input%==Exit (goto end) else (goto intunesinvalid)

:intunesinvalid
color 04
echo %user_input% is an invalid entry, try again.
set user_input=""
pause
goto intunes

:intunestime
net start w32time
timeout /t 10
w32tm /resync
echo Task Completed.
pause
goto intunes

:intunessysclean
winget uninstall cortana
del /q/f/s %TEMP%\* && del /s /q C:\Windows\temp*
del /q/f/s %SystemRoot%\Prefetch\*
echo ------------------------------------------------------------------------------
echo After the Disk Cleanup completes, please press "OK" on the Disk Space Notification.
cleanmgr /verylowdisk /d
pause
taskkill /F /IM explorer.exe & start explorer
timeout /t 3
echo Task Completed.
pause
goto intunes

:intunesnet
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
start www.msftconnecttest.com/redirect
echo Task Completed.
pause
goto intunes

:intuneswinrepair
chkdsk /f
DISM /Online /Cleanup-Image /CheckHealth
sfc /scannow
UsoClient ScanInstallWait
echo Task Completed.
pause
goto intunes

:intunesprofile
start SystemPropertiesAdvanced
goto intunes

:intunesconnect
echo Complete the uninstall before continuing.
Start "" "D:\Script Data\FamilyZone\MobileZoneAgent\uninstall.exe"
pause
Start "" "D:\Script Data\Installers\Connect+Installer 4.0.1.msi"
echo Task Completed.
goto intunes

:intunestxsecure
Start "" "D:\Script Data\Installers\TXSecureBrowser16.0-64bit.msi"
echo Task Completed.
pause
goto intunes

:intunesvexcode
Start "" "D:\Script Data\Installers\VEXcodeIQ-20231108.msi"
pause
Start "" "D:\Script Data\Installers\VEXcodeV5-20240528.msi"
echo Task Completed.
pause
goto intunes

:intunes3410audio
Start "" "D:\Script Data\Installers\Realtek-High-Definition-Audio-Driver_PPWMJ_WIN_6.0.9517.1_A83.EXE"
echo Task Completed.
pause
goto intunes

------------------------------------------------------------------------------
SCCM Commands

:sccm
cls
color 0f
echo SCCM is Selected.
echo.
echo List: TimeSync, SystemClean, NetReset, WinRepair, DelProfiles, Connect,
echo TXSecure, UninCortana, MSTeams, Office365, AutoLogON, Verbo, Exit
echo.
set /p user_input=Type an option from the list:~$
if not defined user_input goto sccm
if /i %user_input%==Back goto selection
if /i %user_input%==TimeSync goto sccmtime
if /i %user_input%==SystemClean goto sccmsysclean
if /i %user_input%==NetReset goto sccmnet
if /i %user_input%==WinRepair goto sccmwinrepair
if /i %user_input%==DelProfiles goto sccmprofile
if /i %user_input%==Connect goto sccmconnect
if /i %user_input%==TXSecure goto sccmtxsecure
if /i %user_input%==UninCortana goto sccmcortana
if /i %user_input%==MSTeams goto sccmteams
if /i %user_input%==Office365 goto sccmoffice365
if /i %user_input%==AutoLogON goto sccmautolog
if /i %user_input%==Verbo goto sccmverbo
if /i %user_input%==Exit (goto end) else (goto sccminvalid)

:sccminvalid
color 04
echo %user_input% is an invalid entry, try again.
set user_input=""
pause
goto sccm

:sccmtime
net start w32time
timeout /t 10
w32tm /resync
echo Task Completed.
pause
goto sccm

:sccmsysclean
del /q/f/s %TEMP%\* && del /s /q C:\Windows\temp*
del /q/f/s %SystemRoot%\Prefetch\*
echo ------------------------------------------------------------------------------
echo After the Disk Cleanup completes, please press "OK" on the Disk Space Notification.
cleanmgr /verylowdisk /d
pause
taskkill /F /IM explorer.exe & start explorer
timeout /t 3
echo Task Completed.
pause
goto sccm

:sccmnet
netsh winsock reset
netsh int ip reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns
start www.msftconnecttest.com/redirect
echo Task Completed.
pause
goto sccm

:sccmwinrepair
chkdsk /f
DISM /Online /Cleanup-Image /CheckHealth
sfc /scannow
UsoClient ScanInstallWait
echo Task Completed.
pause
goto sccm

:sccmprofile
start SystemPropertiesAdvanced
goto sccm

:sccmconnect
echo Complete the uninstall before continuing.
Start "" "D:\Script Data\FamilyZone\MobileZoneAgent\uninstall.exe"
pause
Start "" "D:\Script Data\Installers\Connect+Installer 4.0.1.msi"
echo Task Completed.
pause
goto sccm

:sccmtxsecure
Start "" "D:\Script Data\Installers\TXSecureBrowser16.0-64bit.msi"
echo Task Completed.
pause
goto sccm

:sccmcortana
winget uninstall cortana
echo Task Completed.
pause
goto sccm

:sccmteams
Start "" "D:\Script Data\Installers\MSTeams-x86.msix"
echo Task Completed.
pause
goto sccm

:sccmoffice365
Start "" "D:\Script Data\Installers\OfficeSetup.exe"
echo Task Completed.
pause
goto sccm

:sccmautolog
Start D:\Script Data\Installers\Autologon.exe /accepteula student santafe sfstu
echo Task Completed.
pause
goto sccm

:sccmverbo
reg  add  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ /v  verbosestatus /t  REG_DWORD /d  1
echo Task Completed.
pause
goto sccm

------------------------------------------------------------------------------

:end           
exit