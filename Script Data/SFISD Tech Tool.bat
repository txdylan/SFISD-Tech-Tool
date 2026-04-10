@echo off
title SFISD Tech Tool
title SFISD Tech Tool
net session >nul 2>&1
if %ERRORLEVEL% neq 0 (
    color 04
    echo [ERROR] Please run this script as Administrator!
    pause > nul
    exit /b
)
rem Term Agreement -----------------------------------------------------------
 :agreement
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
 if not defined user_input goto agreement
 if /i %user_input%==Y goto selection
 if /i %user_input%==Ver goto version
 if /i %user_input%==Update goto ttupdate
 if /i %user_input%==Readme goto readme
 if /i %user_input%==Security goto ttsecurity
 if /i %user_input%==N (goto no) else (goto invalid)
 rem Term Agreement No --------------------------------------------------------
     :no
     echo user has selected No
     pause > nul
     exit
 rem Term Agreement Invalid ---------------------------------------------------
     :invalid
     color 04
     echo %user_input% is an invalid entry, try again.
     set user_input=""
     pause > nul
     cls
     goto agreement
 rem SFISD Tech Tool Update ---------------------------------------------------
     :ttupdate
     start https://github.com/txdylan/SFISD-Tech-Tool/releases
     goto end
 rem Version Info -------------------------------------------------------------
     :version
     cls
     color 0f
     echo OS Build: 
     powershell Write-Host ' - Minimum: Windows 10 22H2' -ForegroundColor red
     powershell Write-Host ' - Recommended: Windows 11 23H2 or later' -ForegroundColor DarkGreen
     echo.
     echo Build Version: v2.1.12
     echo Created By: TXDYLAN
     echo.
     echo Please reference README.txt for any issues you encounter.
     echo For further assistance or questions, please contact TXDYLAN at affiliates@txdylan.com
     set /p user_input=Would you like more information (y/n)?:~$
     if /i %user_input%==Y goto readme
     if /i %user_input%==N (goto verno) else (goto invalid)

     :verno
     cls
     goto agreement
 rem README -------------------------------------------------------------------
     :readme
     cls
     D:
     cd Script Data
     type README.txt
     echo.
     pause > nul
     cls
     goto agreement
 rem Main Selection -----------------------------------------------------------
     :selection
     cls
     color 0f
     powershell Write-Host 'select an option -' -ForegroundColor DarkGreen
     echo.
     echo   [0] Exit
     echo   [1] Command - Gives you a list of commands for Windows
     echo   [2] Connect - Fix or add Family Zone Connect+ Client
     echo   [3] Firmware - Updates firmware for Dell laptops
     echo   [4] Install - Direct installers from the internet
     echo   [5] Offline - Uses offline installers
     echo.
     choice /c 012345 /n /m ":~$"
     if %errorlevel%==1 goto end
     if %errorlevel%==2 goto wincommand
     if %errorlevel%==3 goto connect
     if %errorlevel%==4 goto firmware
     if %errorlevel%==5 goto msstore
     if %errorlevel%==6 goto offline
     rem Windows Command Tool -----------------------------------------------------
         :wincommand
         cls
         color 0f
         powershell Write-Host 'Windows Commands is selected.' -ForegroundColor DarkGreen
         echo.
         echo   [0] Back
         echo   [1] Auto Login - Enables student auto login on SCCM devices
         echo   [2] Bitlocker Info - Gives bitlocker code for your device
         echo   [3] Delete Profiles - Shortcut to remove user profiles
         echo   [4] Network Reset - Repairs network issues
         echo   [5] System Clean - Cleans out temporary files
         echo   [6] Time Sync - Fixs computer time issues
         echo   [7] Verbo - Adds Windows stats on bootup
         echo   [8] Windows OS Repair - Restore and fixes Windows system files
         echo   [9] Windows Update Repair - Fixes issues with updating Windows
         echo.
         choice /c 0123456789 /n /m "select an option:~$"
         if %errorlevel%==1 goto selection
         if %errorlevel%==2 goto commandautolog
         if %errorlevel%==3 goto commandbitlockercode
         if %errorlevel%==4 goto commandprofile
         if %errorlevel%==5 goto commandnet
         if %errorlevel%==6 goto commandclean
         if %errorlevel%==7 goto commandtime
         if %errorlevel%==8 goto commandverbo
         if %errorlevel%==9 goto commandwinrepair
         if %errorlevel%==10 goto commandwinupdate
         rem Auto Login ---------------------------------------------------------------
             :commandautolog
             Start "" "D:\Script Data\Installers\Autologon.exe" /accepteula student santafe sfstu
             echo Task Completed.
             pause > nul
             goto wincommand
         rem Bitlocker Info -----------------------------------------------------------
             :commandbitlockercode
             manage-bde -protectors C: -get
             pause > nul
             goto wincommand
         rem Delete Profiles ----------------------------------------------------------
             :commandprofile
             start SystemPropertiesAdvanced
             goto wincommand
         rem Network Reset ------------------------------------------------------------
             :commandnet
             netsh winsock reset
             netsh int ip reset
             ipconfig /release
             ipconfig /renew
             ipconfig /flushdns
             start www.msftconnecttest.com/redirect
             echo Task Completed.
             pause > nul
             goto wincommand
         rem System Clean -------------------------------------------------------------
             :commandclean
             del /q/f/s %TEMP%\* && del /s /q C:\Windows\temp*
             del /q/f/s %SystemRoot%\Prefetch\*
             powershell Remove-Item C:\Windows\System32\config\systemprofile\AppData\local\mdm\*.*
             echo ------------------------------------------------------------------------------
             echo After the Disk Cleanup completes, please press "OK" on the Disk Space Notification.
             cleanmgr /verylowdisk /d
             pause
             taskkill /F /IM explorer.exe & start explorer
             timeout /t 3
             echo Task Completed.
             pause > nul
             goto wincommand
         rem Time Sync ----------------------------------------------------------------
             :commandtime
             net start w32time
             timeout /t 10
             w32tm /resync
             echo Task Completed.
             pause > nul
             goto wincommand
         rem Verbo --------------------------------------------------------------------
             :commandverbo
             reg  add  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\ /v  verbosestatus /t  REG_DWORD /d  1
             echo Task Completed.
             pause > nul
             goto wincommand
         rem Windows OS Repair --------------------------------------------------------
             :commandwinrepair
             chkdsk /f
             DISM /Online /Cleanup-Image /CheckHealth
             sfc /scannow
             UsoClient ScanInstallWait
             echo Task Completed.
             pause > nul
             goto wincommand
         rem Windows Update Repair ----------------------------------------------------
             :commandwinupdate
             SC config trustedinstaller start=auto
             net stop bits
             net stop wuauserv
             net stop msiserver
             net stop cryptsvc
             net stop appidsvc
             Ren %Systemroot%\SoftwareDistribution SoftwareDistribution.old
             Ren %Systemroot%\System32\catroot2 catroot2.old
             regsvr32.exe /s atl.dll
             regsvr32.exe /s urlmon.dll
             regsvr32.exe /s mshtml.dll
             netsh winsock reset
             netsh winsock reset proxy
             rundll32.exe pnpclean.dll,RunDLL_PnpClean /DRIVERS /MAXCLEAN
             dism /Online /Cleanup-image /ScanHealth
             dism /Online /Cleanup-image /CheckHealth
             dism /Online /Cleanup-image /RestoreHealth
             dism /Online /Cleanup-image /StartComponentCleanup
             Sfc /ScanNow
             net start bits
             net start wuauserv
             net start msiserver
             net start cryptsvc
             net start appidsvc
             echo Task Completed.
             pause > nul
             goto wincommand
     rem Family Zone Connect ------------------------------------------------------
         :connect
         cls
         color 0f
         powershell Write-Host 'Family Zone Connect+ Client' -ForegroundColor DarkGreen
         echo.
         echo Do you need to repair Connect?
         echo   [0] Abort
         echo   [Y] Yes 
         echo   [N] No
         choice /c 0YN /n /m ":~$"
         if %errorlevel%==1 goto selection
         if %errorlevel%==2 goto connectyes
         if %errorlevel%==2 goto connectno
         rem Connect Yes --------------------------------------------------------------
             :connectyes
             echo Complete the uninstall before continuing.
             Start "" "D:\Script Data\Connect\uninstall.exe"
             pause > nul
             goto connectno
         rem Connect No ---------------------------------------------------------------
             :connectno
             Start "" "D:\Script Data\Connect\Connect Installer 5.1.1.msi"
             echo Task Completed.
             pause > nul
             goto selection
     rem Dell Firmware ------------------------------------------------------------
         :firmware
         cls
         color 03
         echo Welcome to the Firmware Center!
         echo    (Last Updated 03/23/2026 - End of Life)
         echo.
         powershell Write-Host '!!Disclaimer: Choosing the wrong firmware could cause permanent damage to your device!!' -ForegroundColor Yellow
         echo select an option -
         echo.
         echo   [0] Back
         echo   [1] Dell Latitude 3120 
         echo   [2] Dell Latitude 3140
         echo   [3] Dell Latitude 3190 2-in-1
         echo   [4] Dell Latitude 3310 2-in-1
         echo   [5] Dell Latitude 3390 2-in-1
         echo   [6] Dell Latitude 3410
         echo   [7] Dell Latitude 3410 Audio Driver
         echo   [8] Dell Latitude 3450 
         echo   [D] Dell Support Assist Installer
         echo   [H] HP Support Assist Installer
         echo. 
         powershell Write-Host 'Dell Support: https://www.dell.com/support/home/en-us'
         choice /c 012345678DH /n /m ":~$"
         if %errorlevel%==1 goto selection
         if %errorlevel%==2 goto firmware3120
         if %errorlevel%==3 goto firmware3140
         if %errorlevel%==4 goto firmware3190
         if %errorlevel%==5 goto firmware3310
         if %errorlevel%==6 goto firmware3390
         if %errorlevel%==7 goto firmware3410
         if %errorlevel%==8 goto 3410audio
         if %errorlevel%==9 goto firmware3450
         if %errorlevel%==10 goto supportassist
         if %errorlevel%==11 goto hpsupport
         rem Dell Latitude 3120 -------------------------------------------------------
             :firmware3120
             Start "" "D:\Script Data\Firmware\Latitude_3120_1.39.0.exe"
             goto end
         rem Dell Latitude 3140 -------------------------------------------------------
             :firmware3140
             Start "" "D:\Script Data\Firmware\Latitude_3140_1.28.1.exe"
             goto end
         rem Dell Latitude 3190 2-in-1 ------------------------------------------------
             :firmware3190
             Start "" "D:\Script Data\Firmware\Latitude_3190_1.43.0.exe"
             goto end
         rem Dell Latitude 3310 2-in-1 ------------------------------------------------
             :firmware3310
             Start "" "D:\Script Data\Firmware\Latitude_3310_2in1_1.30.0.exe"
             goto end
         rem Dell Latitude 3390 2-in-1 ------------------------------------------------
             :firmware3390
             Start "" "D:\Script Data\Firmware\Latitude_3390_1.35.1.exe"
             goto end
         rem Dell Latitude 3410 -------------------------------------------------------
             :firmware3410
             Start "" "D:\Script Data\Firmware\Latitude_3410_3510_1.37.0.exe"
             goto end
         rem Dell Latitude 3410 Audio Driver ------------------------------------------
             :3410audio
             Start "" "D:\Script Data\Installers\Realtek-High-Definition-Audio-Driver_PPWMJ_WIN_6.0.9517.1_A83.EXE"
             echo Task Completed.
             pause > nul
             goto firmware
         rem Dell Latitude 3450 -------------------------------------------------------
             :firmware3450
             Start "" "D:\Script Data\Firmware\Latitude_3450_3550_1.20.0.exe"
             echo Task Completed.
             pause > nul
             goto firmware
         rem Dell Support Assist Installer --------------------------------------------
             :supportassist
             Start "" "D:\Script Data\Installers\SupportAssistInstaller.exe"
             goto firmware
         rem HP Support Assist Installer ----------------------------------------------
             :hpsupport
             Start "" "D:\Script Data\Installers\HP Support Assistant 9.39.17.0.exe"
             goto firmware
     rem Online Installs ----------------------------------------------------------
         :msstore
         cls
         color 0f
         powershell Write-Host 'Software Installs:' -ForegroundColor DarkGreen
         echo.
         echo   [0] Back
         echo   [G] GitBash
         echo   [I] IPEVO Visualizer App
         echo   [1] Microsoft Company Portal App
         echo   [2] Microsoft Office 365 Suit
         echo   [3] Microsoft Outlook App
         echo   [4] Microsoft PC Manager
         echo   [5] Microsoft PowerToys
         echo   [6] Microsoft Quick Assist
         echo   [7] Microsoft Surface App
         echo   [T] Microsoft Teams
         echo   [D] Microsoft Wireless Display Adapter App
         echo   [8] Microsoft Whiteboard App
         echo   [9] Minecraft Education
         echo   [L] Logitech Unifying Software
         echo   [U] Update - Will Update all Applications
         echo   [V] VLC Player App
         echo   [P] Third Party Installs
         echo.
         choice /c 0GI1234567TD89LUVP /n /m ":~$"
         if %errorlevel%==1 goto selection
         if %errorlevel%==2 goto gitbash
         if %errorlevel%==3 goto ipevo
         if %errorlevel%==4 goto mscp
         if %errorlevel%==5 goto office365
         if %errorlevel%==6 goto outlook
         if %errorlevel%==7 goto pcmanager
         if %errorlevel%==8 goto powertoys
         if %errorlevel%==9 goto quickassist
         if %errorlevel%==10 goto surface
         if %errorlevel%==11 goto teams
         if %errorlevel%==12 goto wd
         if %errorlevel%==13 goto mswhiteboard
         if %errorlevel%==14 goto minecraftedu
         if %errorlevel%==15 goto unifying
         if %errorlevel%==16 goto msupdate
         if %errorlevel%==17 goto vlc
         if %errorlevel%==18 goto 3pi
         rem GitBash ------------------------------------------------------------------
             :gitbash
             winget install --id Git.Git -e --source winget
             echo Task Completed.
             pause > nul
             goto msstore 
         rem IPEVO Visualizer App -----------------------------------------------------
             :ipevo
             winget install 9PFXWFL0PB4S
             echo Task Completed.
             pause > nul
             goto msstore
         rem Microsoft Company Portal App ---------------------------------------------
             :mscp
             winget install 9WZDNCRFJ3PZ
             echo Task Completed.
             pause > nul
             goto msstore
         rem Microsoft Office 365 Suit ------------------------------------------------
             :office365
             winget install Microsoft.Office
             echo Task Completed.
             pause > nul
             goto msstore
         rem Microsoft Outlook App ----------------------------------------------------
             :outlook
             winget install 9NRX63209R7B
             echo Task Completed
             pause > nul
             goto msstore
         rem Microsoft PC Manager -----------------------------------------------------
             :pcmanager
             winget install 9PM860492SZD
             echo Task Completed.
             pause > nul
             goto msstore
         rem Microsoft PowerToys ------------------------------------------------------
             :powertoys
             winget install XP89DCGQ3K6VLD
             echo Task Completed.
             pause > nul
             goto msstore
         rem Microsoft Quick Assist ---------------------------------------------------
             :quickassist
             winget install 9P7BP5VNWKX5
             echo Task Completed.
             pause > nul
             goto msstore
         rem Microsoft Surface App ----------------------------------------------------
             :surface
             winget install 9WZDNCRFJB8P
             echo Task Completed.
             pause > nul
             goto msstore
         rem Microsoft Teams ----------------------------------------------------------
             :teams
             winget install Microsoft.Teams
             echo Task Completed.
             pause > nul
             goto msstore
         rem Microsoft Wireless Display Adapter App -----------------------------------
             :wd
             winget install 9WZDNCRFJBB1
             echo Task Completed.
             pause > nul
             goto msstore
         rem Microsoft Whiteboard App -------------------------------------------------
             :mswhiteboard
             winget install 9MSPC6MP8FM4
             echo Task Completed.
             pause > nul
             goto msstore
         rem Minecraft Education ------------------------------------------------------
             :minecraftedu
             winget install 9NBLGGH4R2R6
             echo Task Completed.
             pause > nul
             goto msstore
         rem Logitech Unifying Software -----------------------------------------------
             :unifying
             winget install Logitech.UnifyingSoftware
             echo Task Completed.
             pause > nul
             goto msstore
         rem Update -------------------------------------------------------------------
             :msupdate
             winget upgrade -h --all
             echo Task Completed.
             pause > nul
             goto msstore
         rem VLC Player App -----------------------------------------------------------
             :vlc
             winget install XPDM1ZW6815MQM
             echo Task Completed.
             pause > nul
             goto msstore
         rem Third Party Installs -----------------------------------------------------
             :3pi
             cls
             powershell Write-Host 'Third Party Installs:' -ForegroundColor DarkGreen
             powershell Write-Host '!!Install Chocolatey first if you have not already!!' -ForegroundColor Yellow
             echo.
             echo   [0] Back
             echo   [C] Chocolatey Package Manager
             echo   [1] Dell Support Assist
             echo   [2] HP Support Assist
             echo   [3] Mitel Connect
             echo   [4] Vexcode V5
             echo.
             choice /c 0C1234 /n /m ":~$"
             if %errorlevel%==1 goto msstore
             if %errorlevel%==2 goto 3piinstall
             if %errorlevel%==3 goto dellsupport
             if %errorlevel%==4 goto hpsupport
             if %errorlevel%==5 goto mitel
             if %errorlevel%==6 goto vex5
             rem Chocolatey Package Installer ---------------------------------------------
                 :3piinstall
                 cls
                 echo Are you sure you want to install Chocolatey?
                 echo   [Y]Yes/[N]No
                 echo.
                 choice /c YN /n /m ":~$"
                 if %errorlevel%==1 goto 3piinstallyes
                 if %errorlevel%==2 goto 3pi
                 rem Connect Yes --------------------------------------------------------------
                     :3piinstallyes
                     powershell Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
                     goto 3pi
             rem Dell Support Assist ------------------------------------------------------
                 :dellsupport
                 choco.exe install supportassist
                 echo Task Completed.
                 pause > nul
                 goto 3pi
             rem HP Support Assist --------------------------------------------------------
                 :hpsupport
                 choco.exe install hpsupportassistant
                 echo Task Completed.
                 pause > nul
                 goto 3pi
             rem Mitel Connect ------------------------------------------------------------
                 :mitel
                 choco.exe install MitelConnect
                 echo Task Completed.
                 pause > nul
                 goto 3pi
             rem Vexcode V5 ---------------------------------------------------------------
                 :vex5
                 choco.exe install vexcode
                 echo Task Completed.
                 pause > nul
                 goto 3pi
     rem Intune Commands ----------------------------------------------------------
         :intune
         cls
         color 0f                                                                                                                                               
         echo  vmi     mmm  Nd                                  RNI           
         echo  dINi    NNW                                     mN   dN        dN          vI 
         echo  dI N   N NW  Nr vII6N vNNWd0NR6NI  IW R  NI6INv1NNI66INI1      dN  NN0IIr 0NNNW N   IN  I IIR   0IIR           
         echo  dI 6I N6 IW  Nr Id    vN   Nr   NW IN1  NR   WI mN   dN        dN  NI  iN  mN   N   NR  Nv  I1 NW  iN           
         echo  dI  NNI  NW  Nr II    vN   IR   Nr   vN NI   IR mN   dN        dN  IR  rN  mN   N   NN  N   I1 Nd          
         echo  iW   W   W0  1v  rRI1  W    iNI1   RIR    RIW   r1    1N0      dN  NR  rN   NIR INNINN  N   I1 vNNNNi          
         echo -------------------------------------------------------------------------------------------------------
         powershell Write-Host 'Intune is Currently Selected.' -ForegroundColor DarkGreen 
         echo.
         powershell Write-Host 'Intune Menu is Discontinued.' -ForegroundColor Red
         echo.
         pause > nul
         goto selection
     rem Offline Installs ---------------------------------------------------------
         :offline
         cls
         color 0f
         powershell Write-Host 'Offline Installs:' -ForegroundColor DarkGreen
         powershell Write-Host 'This tool will be discontinued soon' -ForegroundColor Yellow
         echo.
         echo   [0] Back
         echo   [1] TXSecure - Installs Texas Secure Browser
         echo   [2] VEXCode - Installs Vex Robotics Software
         echo.
         choice /c 012 /n /m ":~$"
         if %errorlevel%==1 goto selection
         if %errorlevel%==2 goto offlinetxsecure
         if %errorlevel%==3 goto offlinevexcode
        rem TX Secure ----------------------------------------------------------------
             :offlinetxsecure
             Start "" "D:\Script Data\Installers\TXSecureBrowser18.0-64bit.msi"
             echo Task Completed.
             pause > nul
             goto offline
        rem VEX Code -----------------------------------------------------------------
             :offlinevexcode
             Start "" "D:\Script Data\Installers\VEXcode IQ-4.64.0-latest-win-x64.msi" /S /allusers
             pause
             Start "" "D:\Script Data\Installers\VEXcode V5-4.64.0-latest-win-x64.msi" /S /allusers
             echo Task Completed.
             pause > nul
             goto offline
 rem Security -----------------------------------------------------------------
     :ttsecurity
     cls
     echo If you discover a vulnerability, please follow these steps to report it:
     echo.
     echo 1. **Submit a Report**: Send an email to affiliates@txdylan.com with a detailed description of the vulnerability, including steps to reproduce it, the potential impact, and any possible fixes.
     echo.
     echo 2. **Acknowledgment**: You will receive an acknowledgment within 48 hours confirming that your report has been received.
     echo.
     echo 3. **Updates**: You can expect updates on the status of the vulnerability every 7 days.
     echo.
     echo 4. **Resolution Process**: If the vulnerability is accepted, we will work on a patch and communicate the timeline for the fix. If the vulnerability is declined, we will provide a reason for the decision.
     echo.
     echo 5. **Confidentiality**: We request that you keep the details of any reported vulnerabilities confidential until they are resolved.
     echo.
     echo Thank you for helping us keep our project secure.
     pause > nul
     goto end
rem End ----------------------------------------------------------------------
 :end           
 exit