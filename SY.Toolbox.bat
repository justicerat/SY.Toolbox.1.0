@echo off
::===========================================================================================
::This Script is created by Dr.SINAWAY, With parts taken from other scripts and mentioned them
::Please if you will use parts from it, mention Dr.SINAWAY
::and i hope what's written in this script is helpful to you and good luck.
::===========================================================================================

:: Setting Host OS version, This Part is Taken from KMS Suite========================================
if exist "%WinDir%\SysWOW64" (set "OSArchitecture=x64") else (set "OSArchitecture=x86")
for /f "skip=2 tokens=2*" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName %_Nul6%') do if not errorlevel 1 set "NameOS=%%b"
) else (
for /f "tokens=* delims=" %%a in ('start /Min "os" powershell -nop -c "(([WMISEARCHER]'Select Caption from Win32_OperatingSystem').Get()).Caption"') do set "NameOS=%%a"
)
::====================================================================================================

::BatchGotAdmin, Partially created by Dr.SINAWAY=======================================================
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (powershell start -verb runas '%0' am_admin & exit)
::====================================================================================================

CD /D "%~dp0"

:: Setting Toolbox environment path variables
set Files="SYToolbox\Files"
set "Temp=SYToolbox\Temp"
set "Tweaks=SYToolbox\Tweaks"
set "Desktop=%public%\Desktop"
set "Userdesk=%userprofile%\Desktop"
set "Mainfldr=SYToolbox"

:: Setting Toolbox dependent tools environment path variables
set "wget=%Files%\wget.exe"
set "zip=%Files%\7z.exe"

:: Extra Varibales
set "pwrdl=start /wait "dl" PowerShell.exe -Command Start-BitsTransfer -Source"
set "dload=%wget% --no-check-certificate -q -nc --show-progress -O"
set "Prgrms=%Temp%\Programs"
set "Frworks=%Temp%\Frameworks"
set "Repcks=%Temp%\Repacks"
set "pwrshl1=2"
set "pwrshl2=[160] PowerShell Downloader [ Off ]"
set "otoinst1=2"
set "otoinst2=[161] Auto Install [ On ]"
set "vr=1.0"

:MainMenu
set "op="

:: verifying if all files availabe========================================================================================
if not exist "%Files%\wget.exe" (set "dloader=Wget Removed")
if not exist "%Tweaks%\MAS_AIO.cmd" (set "actvtor1=MAS Removed")
if not exist "%Tweaks%\run.bat" (set  "actvtor2=KMS Removed")
if not exist "%Tweaks%\SYCheck.bat" (set "actvtor3=Checker Removed")
if not exist "%Tweaks%\IAS.cmd" (set "actvtor4=IAS Removed")
if not defined dloader (if not defined actvtor1 (if not defined actvtor2 (if not defined actvtor3 (if not defined actvtor4 (set "statues=Fine")))))

:: Detecting Available Programs=========================================================================================================
if exist "%Prgrms%\7zip64.exe" (set "a1=+[1]") else (set "a1=-[1]")
if exist "%Prgrms%\WinRAR64.exe" (set "a2=+[2]") else (set "a2=-[2]")
if exist "%Prgrms%\BandizipSetup.exe" (set "a3=+[3]") else (set "a3=-[3]")
if exist "%Prgrms%\Splash.exe.exe" (set "a4=+[4]") else (set "a4=-[4]")
if exist "%Prgrms%\K-Lite.exe" (set "a5=+[5]") else (set "a5=-[5]")
if exist "%Prgrms%\WiseDiskCleaner.exe" (set "a6=+[6]") else (set "a6=-[6]")
if exist "%Prgrms%\uiso97pes.exe" (set "a7=+[7]") else (set "a7=-[7]")
if exist "%Prgrms%\Telegram64.exe.exe" (set "a8=+[8]") else (set "a8=-[8]")
if exist "%Prgrms%\AIMP64.exe" (set "a9=+[9]") else (set "a9=-[9]")
if exist "%Prgrms%\Winamp.exe" (set "a10=+[10]") else (set "a10=-[10]")
if exist "%Prgrms%\Lantern.exe" (set "a11=+[11]") else (set "a11=-[11]")
if exist "%Prgrms%\Smadav.exe" (set "a12=+[12]") else (set "a12=-[12]")
if exist "%Prgrms%\UltraViewer.exe" (set "a13=+[13]") else (set "a13=-[13]")
if exist "%Prgrms%\Everythingx64.exe" (set "a14=+[14]") else (set "a14=-[14]")
if exist "%Prgrms%\NPPx64.exe" (set "a15=+[15]") else (set "a15=-[15]")
if exist "%Prgrms%\Adobe.exe" (set "a16=+[16]") else (set "a16=-[16]")
if exist "%Temp%\Cent.exe" (set "a17=+[17]") else (set "a17=-[17]")

if exist "%Frworks%\AdobeAIR.exe" (set "a21=+[21]") else (set "a21=-[21]")
if exist "%Frworks%\Microsoft_XNA.msi" (set "a22=+[22]") else (set "a22=-[22]")
if exist "%Frworks%\OpenAL.exe" (set "a23=+[23]") else (set "a23=-[23]")
if exist "%Frworks%\DirectX.exe.exe" (set "a24=+[24]") else (set "a24=-[24]")
if exist "%Frworks%\VC2022_x64.exe" (set "a25=+[25]") else (set "a25=-[25]")
if exist "%Frworks%\Nvidia.exe" (set "a26=+[26]") else (set "a26=-[26]")

set "a30=-[30]"
if exist "%Frworks%\AdobeAIR.exe" (if exist "%Frworks%\Microsoft_XNA.msi" (if exist "%Frworks%\OpenAL.exe" (if exist "%Frworks%\DirectX.exe.exe" (
if exist "%Frworks%\VC2022_x64.exe" (if exist "%Frworks%\Nvidia.exe" (set "a30=+[30]"))))))

if exist "%Frworks%\Java32.exe" (set "a39=+[39]") else (set "a39=-[39]")
if exist "%Frworks%\Java.exe" (set "a40=+[40]") else (set "a40=-[40]")

if exist "%Repcks%\DriverBooster.exe" (set "a41=+[41]") else (set "a41=-[41]")
if exist "%Repcks%\Minitool.exe" (set "a42=+[42]") else (set "a42=-[42]")
if exist "%Repcks%\WinTools.exe" (set "a43=+[43]") else (set "a43=-[43]")
if exist "%Repcks%\FreeMakeConverter.exe" (set "a44=+[44]") else (set "a44=-[44]")
if exist "%Repcks%\IcecreamRecorder64.exe" (set "a45=+[45]") else (set "a45=-[45]")
if exist "%Repcks%\CCleaner.exe" (set "a46=+[46]") else (set "a46=-[46]")
if exist "%Repcks%\RevoUinstaller.exe" (set "a47=+[47]") else (set "a47=-[47]")
if exist "%Repcks%\Lacey.exe" (set "a48=+[48]") else (set "a48=-[48]")
if exist "%Repcks%\IDM.exe" (set "a49=+[49]") else (set "a49=-[49]")
if exist "%Repcks%\WinToHDD.exe" (set "a50=+[50]") else (set "a50=-[50]")
if exist "%Repcks%\EaseUS.exe" (set "a51=+[51]") else (set "a51=-[51]")
if exist "%Repcks%\BurnAware.exe" (set "a52=+[52]") else (set "a52=-[52]")
if exist "%Repcks%\GlaryUtils.exe" (set "a53=+[53]") else (set "a53=-[53]")
if exist "%Repcks%\Privazer.exe" (set "a54=+[54]") else (set "a54=-[54]")
if exist "%Repcks%\uninstall.exe" (set "a55=+[55]") else (set "a55=-[55]")
if exist "%Repcks%\AIDA64.exe" (set "a56=+[56]") else (set "a56=-[56]")
if exist "%Repcks%\PowerISO.exe" (set "a57=+[57]") else (set "a57=-[57]")
if exist "%Repcks%\Format64.exe" (set "a58=+[58]") else (set "a58=-[58]")

if exist "%Tweaks%\MAS_AIO.cmd" (set "a131=+[131]" & set "a134=+[134]") else (set "a131=-[131]" & set "a134=-[134]")
if exist "%Tweaks%\run.bat" (set "a133=+[133]" & set "a142=+[142]") else (set "a133=-[133]" & set "a142=-[142]")
if exist "%Tweaks%\SYCheck.bat" (set "a150=+[150]") else (set "a150=-[150]")
::if exist "%Tweaks%\IAS.cmd" (set "a151=+[151]" & set "a152=+[152]" & set "a153=+[153]") else (set "a151=-[151]" & set "a152=-[152]" & set "a153=-[153]")
if exist "%Temp%\DazLoader.7z" (set "a145=+[145]") else (set "a145=-[145]")
if exist "%Temp%\RemoveWAT.7z" (set "a146=+[146]") else (set "a146=-[146]")


color 04
mode con: cols=133 lines=44
title SYToolbox %vr%
cls
@echo. ===================================================================================================================================
@echo.  Created By Dr.SINAWAY SYToolbox
@echo.  [181] Github       [182] Telegram       [183] Telegram Channel # OS Name: %NameOS% %OSArchitecture%
@echo.  [172] Support Us , [171] Our Website ,  [180] Help/Readme     #  Status: %statues% %dloader% %actvtor1% %actvtor2% %actvtor3% %actvtor4%
@echo. ===================================================================================================================================
@echo. Programs                    # Programs Repack (elchupacabra) #  Programs (Portable)        #  Tweaks (Offline)
@echo.%a1% 7-Zip                   #%a41% Driver Booster            # [71] WinSetupFromUSB        #+[111] Enable Windows Photo viewer
@echo.%a2% WinRAR                  #%a42% MiniTool Partition Wizard # [72] Rufus                  #+[112] Clean up WinSxS (ResetBase)
@echo.%a3% Bandizip                #%a43% WinTools.net Premium      # [73] Ventoy                 #+[113] Pause Windows Updates
@echo.%a4% Splash                  #%a44% FreeMake Video Converter  # [74] Hard Disk Sentinel     #+[114] Reserved Storage
@echo.%a5% K-Lite Codec            #%a45% Icecream Screen Recorder  # [75] Network Tools          #+[115] Hibernation
@echo.%a6% Wise Disk Cleaner       #%a46% CCleaner                  # [76] Anydesk                #+[116] Compact Windows
@echo.%a7% UltraISO                #%a47% Revo Uninstaller          # [77] Psiphon VPN            #
@echo.%a8% Telegram                #%a48% Lacey Video Downloader    # [78] HWiNFO                 #+[117] Add Take Ownership 
@echo.%a9% AIMP                    #%a49% Internet Download Manager # [79] CPU-Z                  #+[118] Add File Hash 
@echo.%a10% Winamp                 #%a50% WinToHDD                  # [80] Easy Context Menu      #+[119] Add Safe Mode 
@echo.%a11% Lantern VPN            #%a51% EaseUS Data Recovery 14.4 # [81] Windows Update Blocker #
@echo.%a12% SmadAV                 #%a52% BurnAware (Pro)           # [82] PatchMyPC              # ===================================
@echo.%a13% UltraViewer            #%a53% Glary Utilities           #                             #   Windows 8.1/10/11 Activation 
@echo.%a14% Everything             #%a54% PrivaZer                  #                             #%a131% KMS38 (Offline)
@echo.%a15% Notepad++              #%a55% Uninstall Tool            # =========================== # [132] HWID 
@echo.%a16% Adobe Acrobat (Lite)   #%a56% AID64 Engineer            # Programs (Online Setup)     #%a133% KMS Inject (Offline) 
@echo.%a17% Cent Browser           #%a57% PowerISO                  # [91] Edge Chromium          #%a134% KMS Renewal Task 
@echo.                             #%a58% Format Factory            # [92] Google Chrome          #
@echo.                             #                                # [93] Mozilla Firefox        #   Microsoft Office Activation 
@echo.                             #                                # [94] Brave Browser          # [141] Online Activation 
@echo. =========================== #                                # [95] Avast (Free Version)   #%a142% Offline KMS (Offline)
@echo.   Runtimes/Frameworks       #                                # [96] Discord                # 
@echo.%a21% AdobeAIR               #                                # [97] Steam                  #   Windows 7 Activation
@echo.%a22% Microsoft XNA          #                                #                             #%a145% Daz Loader
@echo.%a23% OpenAL                 #                                #                             #%a146% RemoveWAT 
@echo.%a24% DirectX (abbodi1406)   #                                #                             #
@echo.%a25% Visual C++ 2005-2022   #                                #                             #%a150% Check Activation Status
@echo.%a26% Nvidia PhysX 9.21.0713 #                                #                             # ====================================
@echo.%a30% Install All            #                                #                             #  - IDM Activation
@echo.                             #                                #                             # [151] Activate IDM
@echo. [35] Install .Net 3.5       #                                #                             # [152] Freeze Trial
@echo.%a39% Java JRE 8 (x32)       #                                #                             # [153] Reset Activation / Trial
@echo.%a40% Java JRE 8 (x64)       #======================================================================================================
@echo.                             # %pwrshl2%       %otoinst2%      [162] Clean Up Toolbox
@echo. ===================================================================================================================================
@echo off
set /p op=. Choose From the List, Write the Number and Press Enter :
:: Programs===============================
if "%op%"=="1" goto :op1
if "%op%"=="2" goto :op2
if "%op%"=="3" goto :op3
if "%op%"=="4" goto :op4
if "%op%"=="5" goto :op5
if "%op%"=="6" goto :op6
if "%op%"=="7" goto :op7
if "%op%"=="8" goto :op8
if "%op%"=="9" goto :op9
if "%op%"=="10" goto :op10
if "%op%"=="11" goto :op11
if "%op%"=="12" goto :op12
if "%op%"=="13" goto :op13
if "%op%"=="14" goto :op14
if "%op%"=="15" goto :op15
if "%op%"=="16" goto :op16
if "%op%"=="17" goto :op17

:: Runtimes\Frameworks===============================
if "%op%"=="21" goto :op21
if "%op%"=="22" goto :op22
if "%op%"=="23" goto :op23
if "%op%"=="24" goto :op24
if "%op%"=="25" goto :op25
if "%op%"=="26" goto :op26
if "%op%"=="30" goto :op30
if "%op%"=="35" goto :op35
if "%op%"=="39" goto :op39
if "%op%"=="40" goto :op40

:: Repacks===============================
if "%op%"=="41" goto :op41
if "%op%"=="42" goto :op42
if "%op%"=="43" goto :op43
if "%op%"=="44" goto :op44
if "%op%"=="45" goto :op45
if "%op%"=="46" goto :op46
if "%op%"=="47" goto :op47
if "%op%"=="48" goto :op48
if "%op%"=="49" goto :op49
if "%op%"=="50" goto :op50
if "%op%"=="51" goto :op51
if "%op%"=="52" goto :op52
if "%op%"=="53" goto :op53
if "%op%"=="54" goto :op54
if "%op%"=="55" goto :op55
if "%op%"=="56" goto :op56
if "%op%"=="57" goto :op57
if "%op%"=="58" goto :op58

:: Portable===============================
if "%op%"=="71" goto :op71
if "%op%"=="72" goto :op72
if "%op%"=="73" goto :op73
if "%op%"=="74" goto :op74
if "%op%"=="75" goto :op75
if "%op%"=="76" goto :op76
if "%op%"=="77" goto :op77
if "%op%"=="78" goto :op78
if "%op%"=="79" goto :op79
if "%op%"=="80" goto :op80
if "%op%"=="81" goto :op81
if "%op%"=="82" goto :op82

:: Tweaks===============================
if "%op%"=="81" goto :op81
if "%op%"=="82" goto :op82
if "%op%"=="83" goto :op83
if "%op%"=="84" goto :op84
if "%op%"=="85" goto :op85
if "%op%"=="86" goto :op86
if "%op%"=="87" goto :op87
if "%op%"=="88" goto :op88
if "%op%"=="89" goto :op89

:: Online===============================
if "%op%"=="91" goto :op91
if "%op%"=="92" goto :op92
if "%op%"=="93" goto :op93
if "%op%"=="94" goto :op94
if "%op%"=="95" goto :op95
if "%op%"=="96" goto :op96
if "%op%"=="97" goto :op97

:: tweaks===============================
if "%op%"=="111" goto :op111
if "%op%"=="112" goto :op112
if "%op%"=="113" goto :op113
if "%op%"=="114" goto :op114
if "%op%"=="115" goto :op115
if "%op%"=="116" goto :op116
if "%op%"=="117" goto :op117
if "%op%"=="119" goto :op119

:: Activators==========================
if "%op%"=="131" goto :op131
if "%op%"=="132" goto :op132
if "%op%"=="133" goto :op133
if "%op%"=="134" goto :op134

if "%op%"=="141" goto :op141
if "%op%"=="142" goto :op142

if "%op%"=="145" goto :op145
if "%op%"=="146" goto :op146

if "%op%"=="150" goto :op150

if "%op%"=="151" goto :op151
if "%op%"=="152" goto :op152
if "%op%"=="153" goto :op153

if "%op%"=="160" goto :powrshll
if "%op%"=="161" goto :otoinstall
if "%op%"=="162" goto :clnup

:: Ending================================
if "%op%"=="171" START https://drsinaway.com & goto :MainMenu
if "%op%"=="181" START https://github.com/cybersorcererss & goto :MainMenu
if "%op%"=="182" START https://t.me/drsinaway & goto :MainMenu
if "%op%"=="183" START https://t.me/CyberSorcerers & goto :MainMenu
if "%op%"=="180" goto :hlp
if "%op%"=="172" goto :Support
goto :MainMenu
:: ProgramsList=======================================================================================================
:op1
cls
@echo. ===================================================================================================================================
@echo. ==========================================               7zip installation               ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%OSArchitecture%" equ "x64" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/8VQ0Ph" -Destination "%Prgrms%\7zip64.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\7zip64.exe" "https://sharedby.blomp.com/8VQ0Ph"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\7zip64.exe" /S
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/kuvsT1" -Destination "%Prgrms%\7zip.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\7zip.exe" "https://sharedby.blomp.com/kuvsT1"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\7zip.exe" /S
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:op2
cls
@echo. ===================================================================================================================================
@echo. ==========================================              WinRAR installation              ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%OSArchitecture%" equ "x64" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/qYDhs5" -Destination "%Prgrms%\WinRAR64.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\WinRAR64.exe" "https://sharedby.blomp.com/qYDhs5"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\WinRAR64.exe" /S
	xcopy /s /y /q "%Tweaks%\rarreg.key" "%programfiles%\WinRAR" >nul 2>&1
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/hJ7aXy" -Destination "%Prgrms%\WinRAR.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\WinRAR.exe" "https://sharedby.blomp.com/hJ7aXy"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\WinRAR.exe" /S
	xcopy /s /y /q "%Tweaks%\rarreg.key" "%programfiles%\WinRAR" >nul 2>&1
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:op3
cls
@echo. ===================================================================================================================================
@echo. ==========================================             Bandizip installation             ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.
if "%OSArchitecture%" equ "x64" (
	echo.  Downloading Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/zelbJb" -Destination "%Prgrms%\BandizipSetup.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/rIhVRX" -Destination "%Prgrms%\Bandizip.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\BandizipSetup.exe" "https://sharedby.blomp.com/zelbJb"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Bandizip.exe" "https://sharedby.blomp.com/rIhVRX"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\BandizipSetup.exe" /S
	xcopy /s /y /q "%Prgrms%\Bandizip.exe" "%programfiles%\Bandizip" >nul 2>&1
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	echo.  32bit systems Is not Supported unfortunately, Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)


:op4
cls
@echo. ===================================================================================================================================
@echo. ==========================================               Splash installation             ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/GhAXvf" -Destination "%Prgrms%\Splash.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Splash.exe" "https://sharedby.blomp.com/GhAXvf"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Prgrms%\Splash.exe" /S /EN
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op5
cls
@echo. ===================================================================================================================================
@echo. ==========================================           K-Lite Codec installation           ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/AXbkyE" -Destination "%Prgrms%\K-Lite.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\K-Lite.exe" "https://sharedby.blomp.com/AXbkyE"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Prgrms%\K-Lite.exe" /verysilent
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op6
cls
@echo. ===================================================================================================================================
@echo. ==========================================         Wise Disk Cleaner installation        ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://www.wisecleaner.com/index.php?r=download-product/latest-version&product=wise-disk-cleaner" -Destination "%Prgrms%\WiseDiskCleaner.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\WiseDiskCleaner.exe" "https://www.wisecleaner.com/index.php?r=download-product/latest-version&product=wise-disk-cleaner"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Prgrms%\WiseDiskCleaner" /VERYSILENT /NORESTART
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op7
cls
@echo. ===================================================================================================================================
@echo. ==========================================             UltraISO installation             ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/ATY1lG" -Destination "%Prgrms%\uiso97pes.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\uiso97pes.exe" "https://sharedby.blomp.com/ATY1lG"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Prgrms%\uiso97pes.exe" /VERYSILENT /NORESTART
Reg.exe add "HKCU\Software\EasyBoot Systems\UltraISO\5.0" /v "UserName" /t REG_SZ /d "AnkhTech" /f
Reg.exe add "HKCU\Software\EasyBoot Systems\UltraISO\5.0" /v "Registration" /t REG_SZ /d "ebabe0b592f6c8a896acecb194f0ccda" /f
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu


:op8
cls
@echo. ===================================================================================================================================
@echo. ==========================================             Telegram installation             ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%OSArchitecture%" equ "x64" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://telegram.org/dl/desktop/win64" -Destination "%Prgrms%\Telegram64.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Telegram64.exe" "https://telegram.org/dl/desktop/win64"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\Telegram64.exe" /VERYSILENT /NORESTART
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://telegram.org/dl/desktop/win" -Destination "%Prgrms%\Telegram.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Telegram.exe" "https://telegram.org/dl/desktop/win"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\Telegram.exe" /VERYSILENT /NORESTART
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:op9
cls
@echo. ===================================================================================================================================
@echo. ==========================================               AIMP installation               ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%OSArchitecture%" equ "x64" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://www.aimp.ru/?do=download.file&id=3" -Destination "%Prgrms%\AIMP64.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\AIMP64.exe" "https://www.aimp.ru/?do=download.file&id=3"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\AIMP64.exe" /AUTO /SILENT
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://www.aimp.ru/?do=download.file&id=4" -Destination "%Prgrms%\AIMP.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\AIMP.exe" "https://www.aimp.ru/?do=download.file&id=4"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\AIMP.exe" /AUTO /SILENT
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:op10
cls
@echo. ===================================================================================================================================
@echo. ==========================================               Winamp installation             ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/WCdhOM" -Destination "%Prgrms%\Winamp.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Winamp.exe" "https://sharedby.blomp.com/WCdhOM"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Prgrms%\Winamp.exe" /S
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op11
cls
@echo. ===================================================================================================================================
@echo. ==========================================              Lantern installation             ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://s3.amazonaws.com/lantern/lantern-installer.exe" -Destination "%Prgrms%\Lantern.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Lantern.exe" "https://s3.amazonaws.com/lantern/lantern-installer.exe"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Starting Installer ...
"%Prgrms%\Lantern.exe"
@echo. 
@echo.  Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op12
cls
@echo. ===================================================================================================================================
@echo. ==========================================               Smadav installation             ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/jOlOrG" -Destination "%Prgrms%\Smadav.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Smadav.exe" "https://sharedby.blomp.com/jOlOrG"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
reg import "%Tweaks%\Smadavx64.reg" >nul 2>&1
"%Prgrms%\Smadav.exe" /Silent
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op13
cls
@echo. ===================================================================================================================================
@echo. ==========================================            UltraViewer installation           ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/H5bBZl" -Destination "%Prgrms%\UltraViewer.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\UltraViewer.exe" "https://sharedby.blomp.com/H5bBZl"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Prgrms%\UltraViewer.exe" /VERYSILENT /NORESTART
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op14
cls
@echo. ===================================================================================================================================
@echo. ==========================================             Everything installation           ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%OSArchitecture%" equ "x64" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/9XiOHz" -Destination "%Prgrms%\Everythingx64.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Everythingx64.exe" "https://sharedby.blomp.com/9XiOHz"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\Everythingx64.exe" /S
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/46c6zO" -Destination "%Prgrms%\Everything.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Everything.exe" "https://sharedby.blomp.com/46c6zO"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\Everything.exe" /S
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:op15
cls
@echo. ===================================================================================================================================
@echo. ==========================================             Notepad++ installation            ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%OSArchitecture%" equ "x64" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/H8DtDX" -Destination "%Prgrms%\NPPx64.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\NPPx64.exe" "https://sharedby.blomp.com/H8DtDX"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\NPPx64.exe" /S
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/r18SBa" -Destination "%Prgrms%\NPP.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\NPP.exe" "https://sharedby.blomp.com/r18SBa"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Prgrms%\NPP.exe" /S
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:op16
cls
@echo. ===================================================================================================================================
@echo. ==========================================        Adobe Acrobat Reader installation      ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/1nBcyu" -Destination "%Prgrms%\Adobe.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Adobe.exe" "https://sharedby.blomp.com/1nBcyu"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
Reg.exe add "HKLM\SOFTWARE\Adobe\Adobe ARM\1.0\ARM" /v "iCheckReader" /t REG_DWORD /d "0" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\WOW6432Node\Adobe\Adobe ARM\1.0\ARM" /v "iCheckReader" /t REG_DWORD /d "0" /f >nul 2>&1
"%Prgrms%\Adobe.exe" /sAll /rs /msi EULA_ACCEPT=YES
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op17
cls
@echo. ===================================================================================================================================
@echo. ==========================================           Cent Browser installation           ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo. 
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/wo80Ta" -Destination "%Temp%\Cent.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\Cent.exe" "https://sharedby.blomp.com/wo80Ta"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  installing Please Wait ...
@echo.
"%Temp%\Cent.exe" --cb-auto-update --do-not-launch-chrome --system-level
@echo. Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:: Frameworklist=====================================================================================================================================================================

:op21
cls
@echo. ===================================================================================================================================
@echo. ==========================================             Adobe AIR installation            ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://airsdk.harman.com/assets/downloads/AdobeAIR.exe" -Destination "%Frworks%\AdobeAIR.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\AdobeAIR.exe" "https://airsdk.harman.com/assets/downloads/AdobeAIR.exe"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Frworks%\AdobeAIR.exe" -silent -eulaAccepted
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op22
cls
@echo. ===================================================================================================================================
@echo. ==========================================           Microsoft XNA installation          ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/A/C/2/AC2C903B-E6E8-42C2-9FD7-BEBAC362A930/xnafx40_redist.msi" -Destination "%Frworks%\Microsoft_XNA.msi")
%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\Microsoft_XNA.msi" "https://download.microsoft.com/download/A/C/2/AC2C903B-E6E8-42C2-9FD7-BEBAC362A930/xnafx40_redist.msi"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Frworks%\Microsoft_XNA.msi" /quiet
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op23
cls
@echo. ===================================================================================================================================
@echo. ==========================================           OpenAL installation          ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/wqz1PE" -Destination "%Frworks%\OpenAL.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\OpenAL.exe" "https://sharedby.blomp.com/wqz1PE"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Frworks%\OpenAL.exe" /S
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op24
cls
@echo. ===================================================================================================================================
@echo. ==========================================           DirectX Redist installation         ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/WzgicQ" -Destination "%Frworks%\DirectX.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\DirectX.exe" "https://sharedby.blomp.com/WzgicQ"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Frworks%\DirectX.exe" /ai /gm2
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op25
cls
@echo. ===================================================================================================================================
@echo. ==========================================    Visual C++ Redist 2005-2022 Installation   ==========================================
@echo. ===================================================================================================================================
@echo.
if "%OSArchitecture%" equ "x64" (
	echo.  Downloading Visual C++ 2005 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE" -Destination "%Frworks%\VC2005_x64.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE" -Destination "%Frworks%\VC2005_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2005_x64.exe" "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2005_x86.exe" "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
	echo.   Installing Visual C++ 2005 Please Wait ...
	"%Frworks%\VC2005_x64.exe" /Q
	"%Frworks%\VC2005_x86.exe" /Q
	echo.   Installing Visual C++ 2005 Finished
	@echo.
	echo.  Downloading Visual C++ 2008 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe" -Destination "%Frworks%\VC2008_x64.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe" -Destination "%Frworks%\VC2008_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2008_x64.exe" "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2008_x86.exe" "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe"
	echo.   Installing Visual C++ 2008 Please Wait ...
	"%Frworks%\VC2008_x64.exe" /q
	"%Frworks%\VC2008_x86.exe" /q
	echo.   Installing Visual C++ 2008 Finished
	@echo.
	echo.  Downloading Visual C++ 2010 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe" -Destination "%Frworks%\VC2010_x64.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe" -Destination "%Frworks%\VC2010_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2010_x64.exe" "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2010_x86.exe" "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe"
	echo.   Installing Visual C++ 2010 Please Wait ...
	"%Frworks%\VC2010_x64.exe" /q /norestart
	"%Frworks%\VC2010_x86.exe" /q /norestart
	echo.   Installing Visual C++ 2010 Finished
	@echo.
	echo.  Downloading Visual C++ 2012 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe" -Destination "%Frworks%\VC2012_x64.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -Destination "%Frworks%\VC2012_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2012_x64.exe" "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2012_x86.exe" "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe"
	echo.   Installing Visual C++ 2012 Please Wait ...
	"%Frworks%\VC2012_x64.exe" /install /quiet /norestart
	"%Frworks%\VC2012_x86.exe" /install /quiet /norestart
	echo.   Installing Visual C++ 2012 Finished
	@echo.
	echo.  Downloading Visual C++ 2013 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://aka.ms/highdpimfc2013x64enu" -Destination "%Frworks%\VC2013_x64.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://aka.ms/highdpimfc2013x86enu" -Destination "%Frworks%\VC2013_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2013_x64.exe" "https://aka.ms/highdpimfc2013x64enu"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2013_x86.exe" "https://aka.ms/highdpimfc2013x86enu"
	echo.   Installing Visual C++ 2013 Please Wait ...
	"%Frworks%\VC2013_x64.exe" /install /quiet /norestart
	"%Frworks%\VC2013_x86.exe" /install /quiet /norestart
	echo.   Installing Visual C++ 2013 Finished
	@echo.
	echo.  Downloading Visual C++ 2015-2022 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://aka.ms/vs/17/release/vc_redist.x64.exe" -Destination "%Frworks%\VC2022_x64.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://aka.ms/vs/17/release/vc_redist.x86.exe" -Destination "%Frworks%\VC2022_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2022_x64.exe" "https://aka.ms/vs/17/release/vc_redist.x64.exe"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2022_x86.exe" "https://aka.ms/vs/17/release/vc_redist.x86.exe"
	echo.   Installing Visual C++ 2015-2022 Please Wait ...
	"%Frworks%\VC2022_x64.exe" /install /quiet /norestart
	"%Frworks%\VC2022_x86.exe" /install /quiet /norestart
	echo.   Installing Visual C++ 2015-2022 Finished
	@echo.
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	echo.  Downloading Visual C++ 2005 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE" -Destination "%Frworks%\VC2005_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2005_x86.exe" "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
	echo.   Installing Visual C++ 2005 Please Wait ...
	"%Frworks%\VC2005_x86.exe" /Q
	echo.   Installing Visual C++ 2005 Finished
	@echo.
	echo.  Downloading Visual C++ 2008 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe" -Destination "%Frworks%\VC2008_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2008_x86.exe" "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe"
	echo.   Installing Visual C++ 2008 Please Wait ...
	"%Frworks%\VC2008_x86.exe" /q
	echo.   Installing Visual C++ 2008 Finished
	@echo.
	echo.  Downloading Visual C++ 2010 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe" -Destination "%Frworks%\VC2010_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2010_x86.exe" "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe"
	echo.   Installing Visual C++ 2010 Please Wait ...
	"%Frworks%\VC2010_x86.exe" /q /norestart
	echo.   Installing Visual C++ 2010 Finished
	@echo.
	echo.  Downloading Visual C++ 2012 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -Destination "%Frworks%\VC2012_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2012_x86.exe" "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe"
	echo.   Installing Visual C++ 2012 Please Wait ...
	"%Frworks%\VC2012_x86.exe" /install /quiet /norestart
	echo.   Installing Visual C++ 2012 Finished
	@echo.
	echo.  Downloading Visual C++ 2013 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://aka.ms/highdpimfc2013x86enu" -Destination "%Frworks%\VC2013_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2013_x86.exe" "https://aka.ms/highdpimfc2013x86enu"
	echo.   Installing Visual C++ 2013 Please Wait ...
	"%Frworks%\VC2013_x86.exe" /install /quiet /norestart
	echo.   Installing Visual C++ 2013 Finished
	@echo.
	echo.  Downloading Visual C++ 2015-2022 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://aka.ms/vs/17/release/vc_redist.x86.exe" -Destination "%Frworks%\VC2022_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2022_x86.exe" "https://aka.ms/vs/17/release/vc_redist.x86.exe"
	echo.   Installing Visual C++ 2015-2022 Please Wait ...
	"%Frworks%\VC2022_x86.exe" /install /quiet /norestart
	echo.   Installing Visual C++ 2015-2022 Finished
	@echo.
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:op26
cls
@echo. ===================================================================================================================================
@echo. ==========================================       Nvidia PhysX 9.21.0713 installation     ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/dACsap" -Destination "%Frworks%\Nvidia.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\Nvidia.exe" "https://sharedby.blomp.com/dACsap"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Frworks%\Nvidia.exe" /s
@echo. 
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op30
cls
@echo. ===================================================================================================================================
@echo.====================  All Runtimes Installation Please Be Patient This Will Take a While.  =====================
@echo. ===================================================================================================================================
@echo.
@echo.                                          AdobeAIR Installation
@echo.  Downloading Please Wait ...
if "%pwrshl1%"=="1" (%pwrdl% "https://airsdk.harman.com/assets/downloads/AdobeAIR.exe" -Destination "%Frworks%\AdobeAIR.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\AdobeAIR.exe" "https://airsdk.harman.com/assets/downloads/AdobeAIR.exe"
@echo.  Installing Please Wait ...
"%Frworks%\AdobeAIR.exe" -silent -eulaAccepted
@echo.
@echo.                                        Microsoft XNA Installation
@echo.  Downloading Please Wait ...
if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/A/C/2/AC2C903B-E6E8-42C2-9FD7-BEBAC362A930/xnafx40_redist.msi" -Destination "%Frworks%\Microsoft_XNA.msi")
%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\Microsoft_XNA.msi" "https://download.microsoft.com/download/A/C/2/AC2C903B-E6E8-42C2-9FD7-BEBAC362A930/xnafx40_redist.msi"
@echo.  Installing Please Wait ...
"%Frworks%\Microsoft_XNA.msi" /quiet
@echo.
@echo.                                           Nvidia PhysX 9.21.0713
@echo.  Downloading Please Wait ...
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/dACsap" -Destination "%Frworks%\Nvidia.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\Nvidia.exe" "https://sharedby.blomp.com/dACsap"
@echo.  Installing Please Wait ...
"%Frworks%\Nvidia.exe" /s
@echo.
@echo.                                           OpenAL Installation
@echo.  Downloading Please Wait ...
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/wqz1PE" -Destination "%Frworks%\OpenAL.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\OpenAL.exe" "https://sharedby.blomp.com/wqz1PE"
@echo.  Installing Please Wait ...
"%Frworks%\OpenAL.exe" /S
@echo.
@echo.                                           DirectX Installation
@echo.  Downloading Please Wait ...
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/WzgicQ" -Destination "%Frworks%\DirectX.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\DirectX.exe" "https://sharedby.blomp.com/WzgicQ"
@echo.  Installing Please Wait ...
"%Frworks%\DirectX.exe" /ai /gm2
@echo.
@echo.                                     Visual C++ 2005-2022 Installation
@echo.
if "%OSArchitecture%" equ "x64" (
	echo.  Downloading Visual C++ 2005 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE" -Destination "%Frworks%\VC2005_x64.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE" -Destination "%Frworks%\VC2005_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2005_x64.exe" "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x64.EXE"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2005_x86.exe" "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
	echo.   Installing Visual C++ 2005 Please Wait ...
	"%Frworks%\VC2005_x64.exe" /Q
	"%Frworks%\VC2005_x86.exe" /Q
	echo.   Installing Visual C++ 2005 Finished
	@echo.
	echo.  Downloading Visual C++ 2008 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe" -Destination "%Frworks%\VC2008_x64.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe" -Destination "%Frworks%\VC2008_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2008_x64.exe" "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x64.exe"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2008_x86.exe" "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe"
	echo.   Installing Visual C++ 2008 Please Wait ...
	"%Frworks%\VC2008_x64.exe" /q
	"%Frworks%\VC2008_x86.exe" /q
	echo.   Installing Visual C++ 2008 Finished
	@echo.
	echo.  Downloading Visual C++ 2010 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe" -Destination "%Frworks%\VC2010_x64.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe" -Destination "%Frworks%\VC2010_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2010_x64.exe" "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x64.exe"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2010_x86.exe" "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe"
	echo.   Installing Visual C++ 2010 Please Wait ...
	"%Frworks%\VC2010_x64.exe" /q /norestart
	"%Frworks%\VC2010_x86.exe" /q /norestart
	echo.   Installing Visual C++ 2010 Finished
	@echo.
	echo.  Downloading Visual C++ 2012 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe" -Destination "%Frworks%\VC2012_x64.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -Destination "%Frworks%\VC2012_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2012_x64.exe" "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2012_x86.exe" "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe"
	echo.   Installing Visual C++ 2012 Please Wait ...
	"%Frworks%\VC2012_x64.exe" /install /quiet /norestart
	"%Frworks%\VC2012_x86.exe" /install /quiet /norestart
	echo.   Installing Visual C++ 2012 Finished
	@echo.
	echo.  Downloading Visual C++ 2013 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://aka.ms/highdpimfc2013x64enu" -Destination "%Frworks%\VC2013_x64.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://aka.ms/highdpimfc2013x86enu" -Destination "%Frworks%\VC2013_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2013_x64.exe" "https://aka.ms/highdpimfc2013x64enu"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2013_x86.exe" "https://aka.ms/highdpimfc2013x86enu"
	echo.   Installing Visual C++ 2013 Please Wait ...
	"%Frworks%\VC2013_x64.exe" /install /quiet /norestart
	"%Frworks%\VC2013_x86.exe" /install /quiet /norestart
	echo.   Installing Visual C++ 2013 Finished
	@echo.
	echo.  Downloading Visual C++ 2015-2022 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://aka.ms/vs/17/release/vc_redist.x64.exe" -Destination "%Frworks%\VC2022_x64.exe")
	if "%pwrshl1%"=="1" (%pwrdl% "https://aka.ms/vs/17/release/vc_redist.x86.exe" -Destination "%Frworks%\VC2022_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2022_x64.exe" "https://aka.ms/vs/17/release/vc_redist.x64.exe"
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2022_x86.exe" "https://aka.ms/vs/17/release/vc_redist.x86.exe"
	echo.   Installing Visual C++ 2015-2022 Please Wait ...
	"%Frworks%\VC2022_x64.exe" /install /quiet /norestart
	"%Frworks%\VC2022_x86.exe" /install /quiet /norestart
	echo.   Installing Visual C++ 2015-2022 Finished
	@echo.
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	echo.  Downloading Visual C++ 2005 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE" -Destination "%Frworks%\VC2005_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2005_x86.exe" "https://download.microsoft.com/download/8/B/4/8B42259F-5D70-43F4-AC2E-4B208FD8D66A/vcredist_x86.EXE"
	echo.   Installing Visual C++ 2005 Please Wait ...
	"%Frworks%\VC2005_x86.exe" /Q
	echo.   Installing Visual C++ 2005 Finished
	@echo.
	echo.  Downloading Visual C++ 2008 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe" -Destination "%Frworks%\VC2008_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2008_x86.exe" "https://download.microsoft.com/download/5/D/8/5D8C65CB-C849-4025-8E95-C3966CAFD8AE/vcredist_x86.exe"
	echo.   Installing Visual C++ 2008 Please Wait ...
	"%Frworks%\VC2008_x86.exe" /q
	echo.   Installing Visual C++ 2008 Finished
	@echo.
	echo.  Downloading Visual C++ 2010 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe" -Destination "%Frworks%\VC2010_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2010_x86.exe" "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe"
	echo.   Installing Visual C++ 2010 Please Wait ...
	"%Frworks%\VC2010_x86.exe" /q /norestart
	echo.   Installing Visual C++ 2010 Finished
	@echo.
	echo.  Downloading Visual C++ 2012 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe" -Destination "%Frworks%\VC2012_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2012_x86.exe" "https://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x86.exe"
	echo.   Installing Visual C++ 2012 Please Wait ...
	"%Frworks%\VC2012_x86.exe" /install /quiet /norestart
	echo.   Installing Visual C++ 2012 Finished
	@echo.
	echo.  Downloading Visual C++ 2013 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://aka.ms/highdpimfc2013x86enu" -Destination "%Frworks%\VC2013_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2013_x86.exe" "https://aka.ms/highdpimfc2013x86enu"
	echo.   Installing Visual C++ 2013 Please Wait ...
	"%Frworks%\VC2013_x86.exe" /install /quiet /norestart
	echo.   Installing Visual C++ 2013 Finished
	@echo.
	echo.  Downloading Visual C++ 2015-2022 Please Wait ...
	if "%pwrshl1%"=="1" (%pwrdl% "https://aka.ms/vs/17/release/vc_redist.x86.exe" -Destination "%Frworks%\VC2022_x86.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\VC2022_x86.exe" "https://aka.ms/vs/17/release/vc_redist.x86.exe"
	echo.   Installing Visual C++ 2015-2022 Please Wait ...
	"%Frworks%\VC2022_x86.exe" /install /quiet /norestart
	echo.   Installing Visual C++ 2015-2022 Finished
	@echo.
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:op35
cls
@echo. ===================================================================================================================================
@echo. ==========================================           Install .Net Framework 3.5          ==========================================
@echo. ===================================================================================================================================
@echo.                                             2 Methods Available
@echo.
@echo.[1] Offline mode , Using your Installation Media (DVD or Flash Drvie) if found
@echo.    Use This Method if you Installed your Oirignal Windows 10/11 from Flash Drive Or DVD 
@echo.    The Flash Drive or DVD Must be Connected for this Method to Work!
@echo.
@echo.[2] Online Mode , will Download the Package and Install it Officialy
@echo.    Use This Method if the previous methods not work
@echo.    This will Download the Package from Microsoft and Install 3.5 , Package will not be Saved in Toolbox Files
@echo.
@echo.[3] Go back to Main Menu
@echo.
choice /c 123 /n /m " Press 1 for Offline , Press 2 for Online , Press 3 to go back to Main Menu : "
if errorlevel 3 (goto :MainMenu)
if errorlevel 2 goto :nt35ofcl
if errorlevel 1 goto :nt35flsh

:nt35flsh
cls
@echo.
@echo.
@echo. Offline mode , Using your Installation Media if found
for %%I in (D E F G H I J K L M N O P Q R S T U V W X Y Z) do if exist "%%I:\\sources\install.wim" set setupdrv=%%I
if defined setupdrv (
@echo. Found drive %setupdrv%
@echo. Installing .NET Framework 3.5...
Dism /online /enable-feature /featurename:NetFX3 /All /Source:%setupdrv%:\sources\sxs /LimitAccess
@echo.
@echo. .NET Framework 3.5 should be installed , Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu
) else (
@echo.
@echo. No installation media found!, Please Choose another Method
@echo.
@echo. Press Any Key to go back
pause >nul
goto :op55
)
:nt35ofcl
cls
@echo.
Dism /online /Enable-Feature /FeatureName:"NetFx3"
@echo. .NET Framework 3.5 should be installed , Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu


:op39
cls
@echo. ===================================================================================================================================
@echo. ==========================================          Java JRE 8 (x32) installation        ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/XBvuou" -Destination "%Frworks%\Java32.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\Java32.exe" "https://sharedby.blomp.com/XBvuou"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Frworks%\Java32.exe.exe" /s
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op40
cls
@echo. ===================================================================================================================================
@echo. ==========================================          Java JRE 8 (x64) installation        ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/UuGnvu" -Destination "%Frworks%\Java.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Frworks%\Java.exe" "https://sharedby.blomp.com/UuGnvu"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
@echo.  Installing Please Wait ...
"%Frworks%\Java.exe" /s
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:: Repacks==============================================================================================================================================================================

:op41
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================           Driver Booster installation         ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/9Wc4Jo" -Destination "%Repcks%\DriverBooster.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\DriverBooster.exe" "https://sharedby.blomp.com/9Wc4Jo"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\DriverBooster.exe" /Silent
:: xcopy /s /y /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\MiniTool Partition Wizard\MiniTool Partition Wizard.lnk" "%userprofile%\Desktop" >nul 2>&1
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op42
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================     Minitool Partition Wizard installation    ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/BxVAyE" -Destination "%Repcks%\Minitool.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\Minitool.exe" "https://sharedby.blomp.com/BxVAyE"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\Minitool.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op43
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================        WinTools.net Premium installation      ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/plW6TJ" -Destination "%Repcks%\WinTools.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\WinTools.exe" "https://sharedby.blomp.com/plW6TJ"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\WinTools.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op44
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================      Freemake Video Converter installation    ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/MCbChV" -Destination "%Repcks%\FreeMakeConverter.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\FreeMakeConverter.exe" "https://sharedby.blomp.com/MCbChV"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\FreeMakeConverter.exe" /Silent
:: xcopy /s /y /q "%ProgramData%\Microsoft\Windows\Start Menu\Programs\MiniTool Partition Wizard\MiniTool Partition Wizard.lnk" "%userprofile%\Desktop" >nul 2>&1
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op45
cls
@echo. ===================================================================================================================================
@echo. ==========================================      Icecream Screen Recorder installation    ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%OSArchitecture%" equ "x64" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/ZaxLg8" -Destination "%Repcks%\IcecreamRecorder64.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\IcecreamRecorder64.exe" "https://sharedby.blomp.com/ZaxLg8"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Repcks%\IcecreamRecorder64.exe" /Silent
	@echo.
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/PaU7Ai" -Destination "%Repcks%\IcecreamRecorder.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\IcecreamRecorder.exe" "https://sharedby.blomp.com/PaU7Ai"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Repcks%\IcecreamRecorder.exe" /Silent
	@echo.
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:op46
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================              CCleaner installation            ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/lIjXaP" -Destination "%Repcks%\CCleaner.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\CCleaner.exe" "https://sharedby.blomp.com/lIjXaP"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\CCleaner.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op47
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================          Revo Uninstaller installation        ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/Ir3lAY" -Destination "%Repcks%\RevoUinstaller.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\RevoUinstaller.exe" "https://sharedby.blomp.com/Ir3lAY"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\RevoUinstaller.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op48
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================       Lacey Video Downloader installation     ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/8fCW9f" -Destination "%Repcks%\Lacey.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\Lacey.exe" "https://sharedby.blomp.com/8fCW9f"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\Lacey.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op49
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================     Internet Download Manager installation    ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/4gC633" -Destination "%Repcks%\IDM.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\IDM.exe" "https://sharedby.blomp.com/4gC633"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\IDM.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op50
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================              WinToHDD installation            ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/DyOjhW" -Destination "%Repcks%\WinToHDD.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\WinToHDD.exe" "https://sharedby.blomp.com/DyOjhW"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\WinToHDD.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op51
cls                                   
@echo. ===================================================================================================================================
@echo.===============================  EaseUS Data Recovery Wizard 14.4 installation  ================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/WrBreB" -Destination "%Repcks%\EaseUS.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\EaseUS.exe" "https://sharedby.blomp.com/WrBreB"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\EaseUS.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op52
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================             BurnAware installation            ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/RqXG0W" -Destination "%Repcks%\BurnAware.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\BurnAware.exe" "https://sharedby.blomp.com/RqXG0W"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\BurnAware.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op53
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================          Glary Utilities installation         ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/G9m0pD" -Destination "%Repcks%\GlaryUtils.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\GlaryUtils.exe" "https://sharedby.blomp.com/G9m0pD"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\GlaryUtils.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op54
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================              PrivaZer installation            ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/XBz3d1" -Destination "%Repcks%\Privazer.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\Privazer.exe" "https://sharedby.blomp.com/XBz3d1"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\Privazer.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op55
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================           Uninstall Tool installation         ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/LhQYab" -Destination "%Repcks%\uninstall.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\uninstall.exe" "https://sharedby.blomp.com/LhQYab"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\uninstall.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op56
cls                                   
@echo. ===================================================================================================================================
@echo. ==========================================          AIDA64 Engineer installation         ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/CF8CWQ" -Destination "%Repcks%\AIDA64.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\AIDA64.exe" "https://sharedby.blomp.com/CF8CWQ"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\AIDA64.exe" /SILENT /TASKS=enge,w7st
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op57
cls
@echo. ===================================================================================================================================
@echo. ==========================================             PowerISO installation             ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/DX1f2L" -Destination "%Repcks%\PowerISO.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\PowerISO.exe" "https://sharedby.blomp.com/DX1f2L"
if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
echo.  Installing Please Wait ...
"%Repcks%\PowerISO.exe" /Silent
@echo.
@echo.  Installation Finished Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op58
cls
@echo. ===================================================================================================================================
@echo. ==========================================           Format Factory installation         ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%OSArchitecture%" equ "x64" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/au9gmK" -Destination "%Repcks%\Format64.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\Format64.exe" "https://sharedby.blomp.com/au9gmK"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Repcks%\Format64.exe" /Silent
	@echo.
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/5n8KFt" -Destination "%Repcks%\Format.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Repcks%\Format.exe" "https://sharedby.blomp.com/5n8KFt"
	if "%otoinst1%"=="1" (@echo. Auto Install Turned Off & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu)
	echo.  Installing Please Wait ...
	"%Repcks%\Format.exe" /Silent
	@echo.
	echo.  Installation Finished Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:: Portable=====================================================================================================================================================================

:op71
cls
@echo. ===================================================================================================================================
@echo. ==========================================            WinSetupFromUSB Portable           ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/TXuk6D" -Destination "%Temp%\WinSetupFromUSB.7z")
%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\WinSetupFromUSB.7z" "https://sharedby.blomp.com/TXuk6D"
%zip% x -y "%Temp%\WinSetupFromUSB.7z" -o%Desktop%  >nul 2>&1
del /f /q "%Temp%\WinSetupFromUSB.7z"
@echo.
@echo.  WinSetupFromUSB Downloaded on Your Desktop , Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op72
cls
@echo. ===================================================================================================================================
@echo. ==========================================                 Rufus Portable                ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/8b1gvs" -Destination "%Desktop%\Rufus.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Desktop%\Rufus.exe" "https://sharedby.blomp.com/8b1gvs"
@echo.
@echo.  Rufus Downloaded on Your Desktop , Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op73
cls
@echo. ===================================================================================================================================
@echo. ==========================================                 Ventoy Portable               ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/uuFVEk" -Destination "%Temp%\Ventoy.zip")
%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\Ventoy.zip" "https://sharedby.blomp.com/uuFVEk"
%zip% x -y "%Temp%\Ventoy.zip" -o%Desktop%  >nul 2>&1
del /f /q "%Temp%\Ventoy.zip"
@echo.
@echo.  Ventoy Downloaded on Your Desktop , Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op74
cls
@echo. ===================================================================================================================================
@echo. ==========================================           Hard Disk Sentinel Portable         ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/PO8PLM" -Destination "%Temp%\DiskSentinel.7z")
%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\DiskSentinel.7z" "https://sharedby.blomp.com/PO8PLM"
%zip% x -y "%Temp%\DiskSentinel.7z" -o%Desktop%  >nul 2>&1
del /f /q "%Temp%\DiskSentinel.7z"
@echo.
@echo.  Hard Disk Sentinel Downloaded on Your Desktop , Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op75
cls
@echo. ===================================================================================================================================
@echo. ==========================================             Network Tools Portable            ==========================================
@echo. ===================================================================================================================================
@echo. 
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/ZDZ5Uk" -Destination "%Temp%\Network.7z")
%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\Network.7z" "https://sharedby.blomp.com/ZDZ5Uk"
%zip% x -y "%Temp%\Network.7z" -o%Desktop%  >nul 2>&1
del /f /q "%Temp%\Network.7z"
@echo.
@echo.  Network Tools Downloaded on Your Desktop , Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op76
cls
@echo. ===================================================================================================================================
@echo. ==========================================                AnyDesk Portable               ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/ysdPd9" -Destination "%Desktop%\AnyDesk.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Desktop%\AnyDesk.exe" "https://sharedby.blomp.com/ysdPd9"
@echo.
@echo.  AnyDesk Downloaded on Your Desktop , Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op77
cls
@echo. ===================================================================================================================================
@echo. ==========================================               Psiphon3 Portable               ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://psiphon.ca/psiphon3.exe" -Destination "%Desktop%\Psiphon.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Desktop%\Psiphon.exe" "https://psiphon.ca/psiphon3.exe"
@echo.
@echo.  Psiphon Downloaded on Your Desktop , Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op78
cls
@echo. ===================================================================================================================================
@echo. ==========================================                HWiNFO Portable               ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%OSArchitecture%" equ "x64" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/2W8f6c" -Destination "%Desktop%\HWiNFO.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Desktop%\HWiNFO.exe" "https://sharedby.blomp.com/2W8f6c"
	@echo.
	@echo.  HWiNFO Downloaded on Your Desktop , Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/eE3gNW" -Destination "%Desktop%\HWiNFO.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Desktop%\HWiNFO.exe" "https://sharedby.blomp.com/eE3gNW"
	@echo.
	@echo.  HWiNFO Downloaded on Your Desktop , Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:op79
cls
@echo. ===================================================================================================================================
@echo. ==========================================                CPU-Z Portable                ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%OSArchitecture%" equ "x64" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/7kWzWg" -Destination "%Desktop%\cpuz_x64.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Desktop%\cpuz_x64.exe" "https://sharedby.blomp.com/7kWzWg"
	@echo.
	@echo.  CPU-Z Downloaded on Your Desktop , Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/CnHFFB" -Destination "%Desktop%\cpuz_x32.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Desktop%\cpuz_x32.exe" "https://sharedby.blomp.com/CnHFFB"
	@echo.
	@echo.  CPU-Z Downloaded on Your Desktop , Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:op80
cls
@echo. ===================================================================================================================================
@echo. ==========================================           Easy Context Menu Portable          ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://www.sordum.org/files/easy-context-menu/ec_menu.zip" -Destination "%Temp%\EasyContext.zip")
%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\EasyContext.zip" "https://www.sordum.org/files/easy-context-menu/ec_menu.zip"
%zip% x -y "%Temp%\EasyContext.zip" -o%Desktop%  >nul 2>&1
del /f /q "%Temp%\EasyContext.zip"
@echo.
@echo.  Easy Context Menu Downloaded on Your Desktop , Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op81
cls
@echo. ===================================================================================================================================
@echo. ==========================================         Windows Update Blocker Portable       ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://www.sordum.org/files/download/windows-update-blocker/Wub_v1.8.zip" -Destination "%Temp%\Wub.zip")
%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\Wub.zip" "https://www.sordum.org/files/download/windows-update-blocker/Wub_v1.8.zip"
%zip% x -y "%Temp%\Wub.zip" -o%Desktop%  >nul 2>&1
del /f /q "%Temp%\Wub.zip"
@echo.
@echo.  Windows Update Blocker Downloaded on Your Desktop , Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op82
cls
@echo. ===================================================================================================================================
@echo. ==========================================               PatchMyPC Portable              ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/Z0Rtks" -Destination "%Desktop%\PatchMyPC.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Desktop%\PatchMyPC.exe" "https://sharedby.blomp.com/Z0Rtks"
@echo.
@echo.  PatchMyPC Downloaded on Your Desktop , Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:: Online Installer=====================================================================================================================================================================

:op91
cls
@echo. ===================================================================================================================================
@echo. ==========================================           Edge Chromium installation          ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://c2rsetup.officeapps.live.com/c2r/downloadEdge.aspx?platform=Default&source=EdgeStablePage&Channel=Stable&language=en&brand=M100" -Destination "%Temp%\Edge.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\Edge.exe" "https://c2rsetup.officeapps.live.com/c2r/downloadEdge.aspx?platform=Default&source=EdgeStablePage&Channel=Stable&language=en&brand=M100"
@echo.  Starting Installer ...
"%Temp%\Edge.exe"
@echo.  Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op92
cls
@echo. ===================================================================================================================================
@echo. ==========================================           Google Chrome installation          ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/0c2UEF" -Destination "%Temp%\GoogleChrome.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\GoogleChrome.exe" "https://sharedby.blomp.com/0c2UEF"
@echo.  Starting Installer ...
"%Temp%\GoogleChrome.exe"
@echo.  Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op93
cls
@echo. ===================================================================================================================================
@echo. ==========================================          Mozilla Firefox installation         ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/i5rIAT" -Destination "%Temp%\Mozilla.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\Mozilla.exe" "https://sharedby.blomp.com/i5rIAT"
@echo.  Starting Installer ...
"%Temp%\Mozilla.exe"
@echo.  Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op94
cls
@echo. ===================================================================================================================================
@echo. ==========================================           Brave Browser installation          ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%OSArchitecture%" equ "x64" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://laptop-updates.brave.com/latest/winx64" -Destination "%Temp%\Brave.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\Brave.exe" "https://laptop-updates.brave.com/latest/winx64"
	echo.  Starting Installer ...
	"%Temp%\Brave.exe"
	echo.  Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)
if "%OSArchitecture%" equ "x86" (
	if "%pwrshl1%"=="1" (%pwrdl% "https://laptop-updates.brave.com/latest/winia32" -Destination "%Temp%\Brave.exe")
	%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\Brave.exe" "https://laptop-updates.brave.com/latest/winia32"
	echo.  Starting Installer ...
	"%Temp%\Brave.exe"
	echo.  Press Any Key to go back To Main Menu
	pause >nul
	goto :MainMenu
)

:op95
cls
@echo. ===================================================================================================================================
@echo. ==========================================        Avast Free Antivirus installation      ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/Qrkv9d" -Destination "%Prgrms%\Avast_Free.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Avast_Free.exe" "https://sharedby.blomp.com/Qrkv9d"
@echo.  Starting Installer ...
"%Prgrms%\Avast_Free.exe"
@echo.  Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op96
cls
@echo. ===================================================================================================================================
@echo. ==========================================              Discord installation             ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86" -Destination "%Prgrms%\Discord.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Discord.exe" "https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86"
@echo.  Starting Installer ...
"%Prgrms%\Discord.exe"
@echo. 
@echo.  Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op97
cls
@echo. ===================================================================================================================================
@echo. ==========================================               Steam installation              ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Downloading Please Wait ...
@echo.
if "%pwrshl1%"=="1" (%pwrdl% "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe" -Destination "%Prgrms%\Steam.exe")
%wget% --no-check-certificate -q -nc --show-progress -O "%Prgrms%\Steam.exe" "https://cdn.cloudflare.steamstatic.com/client/installer/SteamSetup.exe"
@echo.  Starting Installer ...
"%Prgrms%\Steam.exe"
@echo. 
@echo.  Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:: TweaksList==============================================================================================================================================================================

:op111
cls
@echo. ===================================================================================================================================
@echo. ==========================================           Enable Windows Photo Viewer         ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.  Windows Photo Viewer Enabled
reg import "%Tweaks%\Activate_Windows_Photo_Viewer.reg" >nul 2>&1
@echo.
@echo.  Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op112
@echo.
@echo.  This Process Removes old Updates Files
@echo.
@echo.  Cleaning up WinSxS Please Wait...
@echo.
1>nul 2>&1 reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\SideBySide\Configuration" /f /v "DisableResetbase" /t "reg_DWORD" /d 0
DISM.exe /online /Cleanup-Image /SPSuperseded
DISM.exe /online /Cleanup-Image /StartComponentCleanup
DISM.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase
@echo.
@echo.  Cleaning Finished, Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op113
cls
@echo.
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesStartTime" /t REG_SZ /d "2022-09-27T22:13:15Z" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesStartTime" /t REG_SZ /d "2022-09-27T22:13:15Z" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesExpiryTime" /t REG_SZ /d "2050-11-01T22:13:15Z" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseFeatureUpdatesEndTime" /t REG_SZ /d "2050-11-01T22:13:15Z" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseQualityUpdatesEndTime" /t REG_SZ /d "2050-11-01T22:13:15Z" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "PauseUpdatesStartTime" /t REG_SZ /d "2022-09-27T22:13:15Z" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings" /v "PausedQualityStatus" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings" /v "PausedFeatureStatus" /t REG_DWORD /d "1" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings" /v "PausedQualityDate" /t REG_SZ /d "2022-09-27 22:13:15" /f >nul 2>&1
Reg.exe add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UpdatePolicy\Settings" /v "PausedFeatureDate" /t REG_SZ /d "2022-09-27 22:13:15" /f >nul 2>&1
@echo.  Updates Paused Until 2050
@echo.
@echo.  Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op114
cls
@echo. ===================================================================================================================================
@echo. ==========================================             Reserved Storage Setting          ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.   [1] Disable Reserved Storage
@echo.   [2] Enable Reserved Storage
@echo.   [3] Go Back to Main Menu                                   
@echo.
@echo off
choice /c 123 /n /m "Please Choose : "
if errorlevel 3 (goto :MainMenu)
if errorlevel 2 dism /Online /Set-ReservedStorageState /State:Enabled & @echo. & @echo. Reserved Storage Enabled , Press Any Key to go Back to Main Menu & pause >nul & goto :MainMenu
if errorlevel 1 dism /Online /Set-ReservedStorageState /State:Disabled & @echo. & @echo. Reserved Storage Disabled , Press Any Key to go Back to Main Menu & pause >nul & goto :MainMenu

:op115
cls
@echo. ===================================================================================================================================
@echo. ==========================================               Hibernation Setting             ==========================================
@echo. ===================================================================================================================================
@echo.  
@echo.   [1] Disable Hibernation
@echo.   [2] Enable Hibernation
@echo.   [3] Go Back to Main Menu     
@echo off
choice /c 123 /n /m "Please Choose : "
if errorlevel 3 (goto :MainMenu)
if errorlevel 2 powercfg -h on & @echo. & @echo. Hibernation Enabled , Press Any Key to go Back to Main Menu & pause >nul & goto :MainMenu
if errorlevel 1 powercfg -h off & @echo. & @echo. Hibernation Disabled , Press Any Key to go Back to Main Menu & pause >nul & goto :MainMenu

:op116
cls
@echo. ===================================================================================================================================
@echo. ==========================================                 Compact Windows               ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.              This will make your windows Compact, It will save disk space and decrease your Windows size
@echo.                              The process of compressing will take time so be patient                     
@echo.
@echo off
choice /c 12 /n /m "Press 1 to Start , Press 2 to go back to Main Menu : "

if errorlevel 2 (goto :MainMenu)
if errorlevel 1 goto :compressing
:compressing
compact /c /s /i /a /exe:XPRESS8K "C:\Program Files\*"
compact /c /s /i /a /exe:XPRESS8K "C:\Program Files (x86)\*"
compact /c /s /i /exe:XPRESS8K "C:\Windows\*"
compact /c /s /i /a /exe:XPRESS8K "C:\ProgramData\*"
@echo.
@echo.    Compressing Finished , Press Any Key to go Back to Main Menu
pause >nul
goto :MainMenu

:op117
cls
@echo. ===================================================================================================================================
@echo. ==========================================       Add Take Ownership to Context Menu      ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.   [1] Add Take Ownership To Context Menu
@echo.   [2] Remove Take Ownership from Context Menu
@echo.   [3] Go Back to Main Menu
@echo.
@echo off
choice /c 123 /n /m "Please Choose : "
if errorlevel 3 goto :MainMenu
if errorlevel 2 Reg.exe delete "HKCR\*\shell\TakeOwnership" /f & Reg.exe delete "HKCR\*\shell\runas" /f & Reg.exe delete "HKCR\Directory\shell\TakeOwnership" /f & Reg.exe delete "HKCR\Drive\shell\runas" /f
if errorlevel 1 reg import "%Tweaks%\Add_Take_Ownership.reg" >nul 2>&1
@echo.  Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op118
cls
@echo. ===================================================================================================================================
@echo. ==========================================          Add File Hash to Context Menu        ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.   [1] Add File Hash To Context Menu
@echo.   [2] Remove File Hash from Context Menu
@echo.   [3] Go Back to Main Menu
@echo.
@echo off
choice /c 123 /n /m "Please Choose : "
if errorlevel 3 goto :MainMenu
if errorlevel 2 Reg.exe delete "HKCR\*\shell\GetFileHash" /f
if errorlevel 1 reg import "%Tweaks%\Hash.reg" >nul 2>&1
@echo.  Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu

:op119
cls
@echo. ===================================================================================================================================
@echo. ==========================================      Add Safe Mode To Desktop Context Menu    ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.   [1] Add Safe Mode To Desktop Context Menu
@echo.   [2] Remove Safe Mode From Desktop Context Menu
@echo.   [3] Go Back to Main Menu
@echo.
@echo off
choice /c 123 /n /m "Please Choose : "
if errorlevel 3 goto :MainMenu
if errorlevel 2 Reg.exe delete "HKCR\DesktopBackground\Shell\SafeMode" /f
if errorlevel 1 reg import "%Tweaks%\SafeMode.reg" >nul 2>&1
@echo.  Press Any Key to go back To Main Menu
pause >nul
goto :MainMenu


:: Activations=====================================================================================================================================================================================

:op131
cls
@echo. ===================================================================================================================================
@echo.                        This script is a part of 'Microsoft Activation Scripts' (MAS) project.
@echo.                        Homepage: massgrave.dev           Email: windowsaddict@protonmail.com
@echo. ===================================================================================================================================    
@echo.                              This is KMS38 Activation, Activates Until Year 2038
@echo.           
@echo.                                Press Any Key to Start the Activation Process  
pause >nul
call "%Tweaks%\MAS_AIO.cmd" /KMS38
@echo.
@echo.  Press Any Key to go Back to Main Menu
pause >nul
goto :MainMenu

:op132
cls
@echo. ===================================================================================================================================
@echo.                        This script is a part of 'Microsoft Activation Scripts' (MAS) project.
@echo.                        Homepage: massgrave.dev           Email: windowsaddict@protonmail.com
@echo. ===================================================================================================================================    
@echo.                         This is Digital Activation (HWID), Activates Windows permanently
@echo.           
@echo.                               Internet Connection Required for this Activation
@echo.
@echo.                                 Press Any Key to Start the Activation Process  
pause >nul
call "%Tweaks%\MAS_AIO.cmd" /HWID
@echo.
@echo.  Press Any Key to go Back to Main Menu
pause >nul
goto :MainMenu

:op133
cls
@echo. ===================================================================================================================================
@echo.                                       This script is a part of 'KMS Suite'                        
@echo.                                  Homepage: www.tnctr.com        By mephistooo2
@echo. ===================================================================================================================================
@echo.                              This is (KMS Inject) Offline Activation For Windows
@echo.           
@echo.                                  Press Any Key to Start the Activation Process  
pause >nul
if not exist "%windir%\KMS\KMSInject.bat" (
xcopy /cryi %Tweaks%\bin\* %windir%\KMS\bin >nul 2>&1
copy /y %Tweaks%\run.bat %windir%\KMS\KMSInject.bat >nul 2>&1
schtasks /create /tn "KMS_Aktivasyon" /xml "%Tweaks%\bin\KMS.xml" /f >nul 2>&1
)
del /f /q %windir%\KMS\bin\*.xml >nul 2>&1
IF /I "%PROCESSOR_ARCHITECTURE%" EQU "AMD64" (del /f /q C:\Windows\KMS\bin\x86.dll) >nul 2>&1 & (del /f /q C:\Windows\KMS\bin\A64.dll) >nul 2>&1 else (del /f /q C:\Windows\KMS\bin\x64.dll) >nul 2>&1 & (del /f /q C:\Windows\KMS\bin\A64.dll) >nul 2>&1
IF /I "%PROCESSOR_ARCHITECTURE%" EQU "ARM64" (del /f /q C:\Windows\KMS\bin\x86.dll) >nul 2>&1
IF /I "%PROCESSOR_ARCHITECTURE%" EQU "ARM64" (del /f /q C:\Windows\KMS\bin\x64.dll) >nul 2>&1
start %windir%\KMS\KMSInject.bat -winds
goto :MainMenu

:op134
cls
@echo. ===================================================================================================================================
@echo.                        This script is a part of 'Microsoft Activation Scripts' (MAS) project.
@echo.                        Homepage: massgrave.dev           Email: windowsaddict@protonmail.com
@echo. ===================================================================================================================================      
@echo.                               Internet Connection Required for this Activation
@echo.
@echo.                                 Press Any Key to Start the Activation Process  
pause >nul
call "%Tweaks%\MAS_AIO.cmd" /KMS-ActAndRenewalTask
@echo.
@echo.
@echo.  Press Any Key to go Back to Main Menu
pause >nul
goto :MainMenu

:op141
cls
@echo. ===================================================================================================================================
@echo.                        This script is a part of 'Microsoft Activation Scripts' (MAS) project.
@echo.                        Homepage: massgrave.dev           Email: windowsaddict@protonmail.com
@echo. ===================================================================================================================================
@echo.                  This is Online Activation For Microsoft Office, Internet Connection is Required
@echo.
@echo.                                Press Any Key to Start the Activation Process  
pause >nul
call "%Tweaks%\MAS_AIO.cmd" /KMS-Office
@echo.
@echo.  Press Any Key to go Back to Main Menu
pause >nul
goto :MainMenu

:op142
cls
@echo. ===================================================================================================================================
@echo.                                       This script is a part of 'KMS Suite'                        
@echo.                                  Homepage: www.tnctr.com        By mephistooo2
@echo. ===================================================================================================================================
@echo.                                 This is Offline Activation For Microsoft Office
@echo.                                  Press Any Key to Start the Activation Process  
pause >nul
if not exist "%windir%\KMS\KMSInject.bat" (
xcopy /cryi %Tweaks%\bin\* %windir%\KMS\bin >nul 2>&1
copy /y %Tweaks%\run.bat %windir%\KMS\KMSInject.bat >nul 2>&1
schtasks /create /tn "KMS_Aktivasyon" /xml "%Tweaks%\bin\KMS.xml" /f >nul 2>&1
)
del /f /q %windir%\KMS\bin\*.xml >nul 2>&1
IF /I "%PROCESSOR_ARCHITECTURE%" EQU "AMD64" (del /f /q C:\Windows\KMS\bin\x86.dll) >nul 2>&1 & (del /f /q C:\Windows\KMS\bin\A64.dll) >nul 2>&1 else (del /f /q C:\Windows\KMS\bin\x64.dll) >nul 2>&1 & (del /f /q C:\Windows\KMS\bin\A64.dll) >nul 2>&1
IF /I "%PROCESSOR_ARCHITECTURE%" EQU "ARM64" (del /f /q C:\Windows\KMS\bin\x86.dll) >nul 2>&1
IF /I "%PROCESSOR_ARCHITECTURE%" EQU "ARM64" (del /f /q C:\Windows\KMS\bin\x64.dll) >nul 2>&1
start %windir%\KMS\KMSInject.bat -ofce
goto :MainMenu

:op145
cls
@echo. ===================================================================================================================================
@echo. ==========================================           This is Daz Loader Activation       ==========================================
@echo. ===================================================================================================================================
@echo.
@echo. Downloading the Activator
if not exist "%Temp%\Windows_7_Activation.exe" (
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/RkswBA" -Destination "%Temp%\DazLoader.7z")
%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\DazLoader.7z" "https://sharedby.blomp.com/RkswBA"
%zip% e "%Temp%\DazLoader.7z" -o%Temp%  >nul 2>&1
del /f /q "%Temp%\DazLoader.7z"
)
@echo.
@echo. Activator Started Press Install now
"%Temp%\Windows_7_Activation.exe"
@echo.
@echo.  Press Any Key to go Back to Main Menu
pause >nul
goto :MainMenu

:op146
cls
@echo. ===================================================================================================================================
@echo. ==========================================            This is RemoveWAT By Hazar         ==========================================
@echo. ===================================================================================================================================
@echo.
@echo. Downloading the Activator
@echo.
if not exist "%Temp%\Remove_v2.2.5.exe" (
if "%pwrshl1%"=="1" (%pwrdl% "https://sharedby.blomp.com/lkUYVT" -Destination "%Temp%\RemoveWAT.7z")
%wget% --no-check-certificate -q -nc --show-progress -O "%Temp%\RemoveWAT.7z" "https://sharedby.blomp.com/lkUYVT"
%zip% e "%Temp%\RemoveWAT.7z" -o%Temp% >nul 2>&1
del /f /q "%Temp%\RemoveWAT.7z"
)
@echo. Activator Started Press Remove WAT
"%Temp%\Remove_v2.2.5.exe"
@echo.
@echo.  Press Any Key to go Back to Main Menu
pause >nul
goto :MainMenu

:op150
cls
start "sychk" "%Tweaks%\SYCheck.bat"
@echo.
goto :MainMenu

:op151
cls
@echo. ===================================================================================================================================
@echo.                    IDM Activation Script (IAS)
@echo. Homepages: https://github.com/WindowsAddict/IDM-Activation-Script       Email: windowsaddict@protonmail.com
@echo. ===================================================================================================================================
@echo.                       This is Online Activation For Internet Download Manager (IDM)
@echo.
@echo.                                      Internet Connection is Required
@echo.
@echo.                                Press Any Key to Start the Activation Process  
pause >nul
call "%Tweaks%\IAS.cmd" /act
@echo.
@echo.  Press Any Key to go Back to Main Menu
pause >nul
goto :MainMenu

:op152
cls
@echo. ===================================================================================================================================
@echo.                    IDM Activation Script (IAS)
@echo. Homepages: https://github.com/WindowsAddict/IDM-Activation-Script       Email: windowsaddict@protonmail.com
@echo. ===================================================================================================================================
@echo.                 This Will Freeze the 30 Days Trial Period For Internet Download Manager (IDM)
@echo.
@echo.                                      Internet Connection is Required
@echo.
@echo.                                Press Any Key to Start the Freezing Process  
pause >nul
call "%Tweaks%\IAS.cmd" /frz
@echo.
@echo.  Press Any Key to go Back to Main Menu
pause >nul
goto :MainMenu

:op153
cls
@echo. ===================================================================================================================================
@echo.                    IDM Activation Script (IAS)
@echo. Homepages: https://github.com/WindowsAddict/IDM-Activation-Script       Email: windowsaddict@protonmail.com
@echo. ===================================================================================================================================
@echo.          This Will Reset the Activation and 30 Days Trial Peroid for Internet Download Manager (IDM)
@echo.
@echo.                                Press Any Key to Start the Activation Process  
pause >nul
call "%Tweaks%\IAS.cmd" /res
@echo.
@echo.  Press Any Key to go Back to Main Menu
pause >nul
goto :MainMenu


::====================================================================================================================
:powrshll
if not exist "%WinDir%\System32\WindowsPowerShell\v1.0\HelpV3.format.ps1xml" (
cls
echo.
echo. This option is not available
echo.
@echo.  Press Any Key to go back
pause >nul
goto :MainMenu
)
if "%pwrshl2%"=="[160] PowerShell Downloader [ On ]" (
set "pwrshl1=2"
set "pwrshl2=[160] PowerShell Downloader [ Off ]"
goto :MainMenu
)
set "pwrshl1=1"
set "pwrshl2=[160] PowerShell Downloader [ On ]"
goto :MainMenu
::====================================================================================================================
:otoinstall
if "%otoinst2%"=="[161] Auto Install [ Off ]" (
set "otoinst1=2"
set "otoinst2=[161] Auto Install [ On ]"
goto :MainMenu
)
set "otoinst1=1"
set "otoinst2=[161] Auto Install [ Off ]"
goto :MainMenu
::====================================================================================================================
:clnup
cls
@echo. ===================================================================================================================================
@echo. ==========================================              Clean up Toolbox Files           ==========================================
@echo. ===================================================================================================================================
@echo.
@echo.                 The Programs you Choose to Downlad and Install , gets Saved in the Toolbox Files
@echo.        So you can Install it later , on the Same PC or different PC Without Having to Download them again
@echo.
@echo.                              This Option will Delete all These Downloaded Programs
@echo.                        you will have to Download them again in order to Install them again
@echo.                             It will not affect the Installed Programs or the Portable
@echo.
@echo.
@echo.                        [1] Clean up Toolbox Files            [2] Go Back To Main Menu
@echo off
choice /c 12 /n /m "Choose : "
if errorlevel 2 goto :MainMenu
if errorlevel 1 del /S /F /Q "%Temp%\*" & @echo.  & @echo. Toolbox Files Cleaned Up & echo. Press Any Key to go back To Main Menu & pause >nul & goto :MainMenu



::====================================================================================================================
:hlp
cls
@echo. ===================================================================================================================================
@echo. =====================================                      Help / Readme                    ================================================
@echo. ===================================================================================================================================
@echo.   
@echo.                            All The Downloaded Programs from the Toolbox are Activated 
@echo.        
@echo.                  To Download the Programs and Install them on another PC , Turn Off Auto Install
@echo.
@echo.         Not All Programs Support Installing Without Internet , Some Programs Require Internet (ex. Steam , Discord)
@echo.
@echo.                      Do not Turn On PowerShell Downloader Unless you have Issues with Wget 
@echo.
@echo.        "-" Means the Program is not Downloaded , it can be downloaded and be installed later on or on Different PC
@echo.        "+" Means the Program is Downloaded and can be installed without Internet Connection
@echo.        " " Means the Program or the Tweak can not be Used Without Internet connection
@echo.
@echo.                    I know the Toolbox a little confusing , but you will get used to it
@echo.
@echo.
@echo.  Press Any Key to go Back to Main Menu
pause >nul
goto :MainMenu

::====================================================================================================================
:Support
cls
echo ===================================================================================================================================
echo ===================================== Support =====================================
echo ===================================================================================================================================
echo You can support me in developing content by engaging with me on Telegram.
echo.

:menu
echo [1] Telegram
echo [2] Exit

set /p choice=Enter your choice: 

if "%choice%"=="1" (
    start https://t.me/drsinaway
) else if "%choice%"=="2" (
    echo Thank you for considering support. Goodbye!
    exit
) else (
    echo Invalid choice. Please try again.
    goto menu
)

::====================================================================================================================
