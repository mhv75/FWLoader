@echo off
@color F0
mode con: cols=85 lines=35
set title=FWLoader by AndyER03 v1.0
title %title%
call :LangEN

:Initialization
call :Logo
echo  Starting Program Initialization...
ping -n 3 127.0.0.1 > NUL
@echo.

:CheckPing
echo  Network initialization
ping google.com > NUL
if %errorlevel% EQU 0 (
	color 2F
	ping -n 2 127.0.0.1 > NUL
	echo  %SuccessText%
	ping -n 3 127.0.0.1 > NUL
	@color F0
	goto CheckAntivirus
) else (
	ping -n 2 127.0.0.1 > NUL
	color 4F
	echo  %FailedText%
	ping -n 3 127.0.0.1 > NUL
	goto END
)
GoTo :EOF

:CheckAntivirus
@echo.
echo  Checking for download permission
curl -s https://cdn.cnbj2.fds.api.mi-img.com/huami/cinco_202001061540_1_font.bin -o %temp%\temp
if exist %temp%\temp (
	color 2F
	ping -n 2 127.0.0.1 > NUL
	del %temp%\temp
	echo  %SuccessText%
	ping -n 3 127.0.0.1 > NUL
	@color F0
	goto Start
)
if not exist %temp%\temp (
	ping -n 2 127.0.0.1 > NUL
	color 4F
	echo  %FailedText%
	@echo.
	echo  Please disable antivirus and try again!
	@echo.
	pause
	goto Initialization
)

:Start
cls
call :About
goto LangSelect

:LangSelect
cls
call :Logo
echo  Select language:
@echo.
echo  1) English
echo  2) ãááª¨©
@echo.
call :Separator
echo  (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
@echo.
set LangSelect=0
set /p LangSelect="Choose: "
if /i %LangSelect%==1 call :LangEN && goto DeviceSelect
if /i %LangSelect%==2 call :LangRU && goto DeviceSelect
if /i %LangSelect%==A call :About && goto LangSelect
if /i %LangSelect%==0 goto LangSelect

:DeviceSelect
cls
call :Logo
set deviceTitle=NONE
set deviceTitleBip=Huami Amazfit Bip
set deviceTitleBipS=Huami Amazfit Bip S
set deviceTitleGTR47=Huami Amazfit GTR 47
set deviceTitleTRex=Huami Amazfit T-Rex
set deviceTitleMB4=Xiaomi Mi Smart Band 4
set deviceTitleMB5=Xiaomi Mi Smart Band 5

set deviceFolder=NONE
set deviceFolderBip=Huami_Amazfit_Bip
set deviceFolderBipS=Huami_Amazfit_Bip_S
set deviceFolderGTR47=Huami_Amazfit_GTR_47
set deviceFolderTRex=Huami_Amazfit_T-Rex
set deviceFolderMB4=Xiaomi_Mi_Smart_Band_4
set deviceFolderMB5=Xiaomi_Mi_Smart_Band_5
echo  %SelectDeviceText%
@echo.
echo  1) %deviceTitleBip%
echo  2) %deviceTitleBipS%
echo  3) %deviceTitleGTR47%
echo  4) %deviceTitleTRex%
echo  5) %deviceTitleMB4%
echo  6) %deviceTitleMB5%
@echo.
call :Separator
echo  (B) - %BackText%   (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
@echo.
set DeviceSelect=0
set /p DeviceSelect=" %InputText% "
@echo.
if /i %DeviceSelect%==1 (
set deviceTitle=%deviceTitleBip%
set deviceFolder=%deviceFolderBip%
goto BipFileSelect
)
if /i %DeviceSelect%==2 (
set deviceTitle=%deviceTitleBipS%
set deviceFolder=%deviceFolderBipS%
goto BipSFileSelect
)
if /i %DeviceSelect%==3 (
set deviceTitle=%deviceTitleGTR47%
set deviceFolder=%deviceFolderGTR47%
goto GTR47FileSelect
)
if /i %DeviceSelect%==4 (
set deviceTitle=%deviceTitleTRex%
set deviceFolder=%deviceFolderTRex%
goto TRexFileSelect
)
if /i %DeviceSelect%==5 (
set deviceTitle=%deviceTitleMB4%
set deviceFolder=%deviceFolderMB4%
goto MB4FileSelect
)
if /i %DeviceSelect%==6 (
set deviceTitle=%deviceTitleMB5%
set deviceFolder=%deviceFolderMB5%
goto MB5FileSelect
)
if /i %DeviceSelect%==A call :About && goto DeviceSelect
if /i %DeviceSelect%==0 goto DeviceSelect
if /i %DeviceSelect%==B goto LangSelect
goto DeviceSelect

:BipFileSelect
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
@echo.
echo  %SelectFirmwareText%
@echo.
echo  1) 1.1.6.48
@echo.
call :Separator
echo  (B) - %BackText%   (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
@echo.
set BipFileSelect=0
set /p BipFileSelect=" %InputText% "
if /i %BipFileSelect%==1 goto Bip_FW_1.1.6.48
if /i %BipFileSelect%==A call :About && goto BipFileSelect
if /i %BipFileSelect%==0 goto BipFileSelect
if /i %BipFileSelect%==B goto DeviceSelect
goto BipFileSelect

:Bip_FW_1.1.6.48
set FolderName=chaohu_1.1.6.48
set fw=chaohu_201911222241_1.1.6.48_chaohu.fw
set res=chaohu_201911222241_v85_res.bin
set ft=chaohu_201911222241_9_font.bin
goto MirrorSelect

:BipSFileSelect
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
@echo.
echo  %SelectFirmwareText%
@echo.
echo  tonlesap
@echo.
echo  1) 2.1.1.26
@echo.
call :Separator
echo  (B) - %BackText%   (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
@echo.
set BipSFileSelect=0
set /p BipSFileSelect=" %InputText% "
if /i %BipSFileSelect%==1 goto Bip_S_FW_2.1.1.26
if /i %BipSFileSelect%==A call :About && goto BipSFileSelect
if /i %BipSFileSelect%==0 goto BipFileSelect
if /i %BipSFileSelect%==B goto DeviceSelect
goto BipSFileSelect

:Bip_S_FW_2.1.1.26
set FolderName=tonlesap_2.1.1.26
set fw=tonlesap_202007161110_2.1.1.26_tonlesap.fw
set res=tonlesap_202007161110_v100_res.pack.bin
set ft=tonlesap_202007161110_3_font.bin
goto MirrorSelect

:GTR47FileSelect
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
@echo.
echo  %SelectFirmwareText%
@echo.
echo  1) 1.3.4.19
echo  2) 1.3.5.08
echo  3) 1.3.5.37
echo  4) 1.3.5.66
@echo.
call :Separator
echo  (B) - %BackText%   (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
@echo.
set GTR47FileSelect=0
set /p GTR47FileSelect=" %InputText% "
if /i %GTR47FileSelect%==1 goto GTR47_FW_1.3.4.19
if /i %GTR47FileSelect%==2 goto GTR47_FW_1.3.5.08
if /i %GTR47FileSelect%==3 goto GTR47_FW_1.3.5.37
if /i %GTR47FileSelect%==4 goto GTR47_FW_1.3.5.66
if /i %GTR47FileSelect%==A call :About && goto GTR47FileSelect
if /i %GTR47FileSelect%==0 goto GTR47FileSelect
if /i %GTR47FileSelect%==B goto DeviceSelect
goto GTR47FileSelect

:GTR47_FW_1.3.4.19
set FolderName=falconw_1.3.4.19
set fw=falconw_201910171002_1.3.4.19_falconw.fw
set res=falconw_201910171002_v42_res.pack.bin
set ft=falconw_201910171002_11_font.bin
goto MirrorSelect

:GTR47_FW_1.3.5.08
set FolderName=falconw_1.3.5.08
set fw=falconw_201911082354_1.3.5.08_falconw.fw
set res=falconw_201911082354_v46_res.pack.bin
set ft=falconw_201911082354_11_font.bin
goto MirrorSelect

:GTR47_FW_1.3.5.37
set FolderName=falconw_1.3.5.37
set fw=falconw_202001141806_1.3.5.37_falconw.fw
set res=falconw_202001141806_v14_base.res.pack.bin
goto MirrorSelect

:GTR47_FW_1.3.5.66
set FolderName=falconw_1.3.5.66
set fw=falconw_202004232321_1.3.5.66_falconw.fw
set res=falconw_202004232321_v55_res.pack.bin
goto MirrorSelect

:TRexFileSelect
cls
call :Logo
@echo.
echo  %TitleDeviceText% %deviceTitle%
@echo.
echo  %SelectFirmwareText%
echo  1) 0.0.1.77
echo  2) 0.0.1.78
@echo.
call :Separator
echo  (B) - %BackText%   (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
@echo.
set TRexFileSelect=0
set /p TRexFileSelect=" %InputText% "
if /i %TRexFileSelect%==1 goto TRex_FW_0.0.1.77
if /i %TRexFileSelect%==2 goto TRex_FW_0.0.1.78
if /i %TRexFileSelect%==A call :About && goto TRexFileSelect
if /i %TRexFileSelect%==0 goto TRexFileSelect
if /i %TRexFileSelect%==B goto DeviceSelect
goto TRexFileSelect

:TRex_FW_0.0.1.77
set FolderName=vulture_0.0.1.77
set fw=vulture_202005201934_0.0.1.77_vulture.fw
set res=vulture_202005201934_v26_res.pack.bin
set ft=vulture_202005201934_4_font.bin
goto MirrorSelect

:TRex_FW_0.0.1.78
set FolderName=vulture_0.0.1.78
set fw=vulture_202005201949_0.0.1.78_vulture.fw
set res=vulture_202005201949_v26_res.pack.bin
set ft=vulture_202005201949_4_font.bin
goto MirrorSelect

:MB4FileSelect
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
@echo.
echo  %SelectFirmwareText%
@echo.
echo   1) 1.0.5.39     11) 1.0.7.04     21) 1.0.9.34
echo   2) 1.0.5.40     12) 1.0.7.06     22) 1.0.9.42
echo   3) 1.0.5.48     13) 1.0.7.10     23) 1.0.9.48
echo   4) 1.0.5.55     14) 1.0.7.14     24) 1.0.9.66
echo   5) 1.0.5.66     15) 1.0.7.26
echo   6) 1.0.6.12     16) 1.0.7.36
echo   7) 1.0.6.16     17) 1.0.7.60
echo   8) 1.0.6.24     18) 1.0.8.05
echo   9) 1.0.6.26     19) 1.0.9.22
echo  10) 1.0.7.02     20) 1.0.9.30
@echo.
call :Separator
echo  (B) - %BackText%   (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
@echo.
set MB4FileSelect=0
set /p FirmwareSelect=" %InputText% "
if /i %FirmwareSelect%==1 goto MB4_FW_1.0.5.39
if /i %FirmwareSelect%==2 goto MB4_FW_1.0.5.40
if /i %FirmwareSelect%==3 goto MB4_FW_1.0.5.48
if /i %FirmwareSelect%==4 goto MB4_FW_1.0.5.55
if /i %FirmwareSelect%==5 goto MB4_FW_1.0.5.66
if /i %FirmwareSelect%==6 goto MB4_FW_1.0.6.12
if /i %FirmwareSelect%==7 goto MB4_FW_1.0.6.16
if /i %FirmwareSelect%==8 goto MB4_FW_1.0.6.24
if /i %FirmwareSelect%==9 goto MB4_FW_1.0.6.26
if /i %FirmwareSelect%==10 goto MB4_FW_1.0.7.02
if /i %FirmwareSelect%==11 goto MB4_FW_1.0.7.04
if /i %FirmwareSelect%==12 goto MB4_FW_1.0.7.06
if /i %FirmwareSelect%==13 goto MB4_FW_1.0.7.10
if /i %FirmwareSelect%==14 goto MB4_FW_1.0.7.14
if /i %FirmwareSelect%==15 goto MB4_FW_1.0.7.26
if /i %FirmwareSelect%==16 goto MB4_FW_1.0.7.36
if /i %FirmwareSelect%==17 goto MB4_FW_1.0.7.60
if /i %FirmwareSelect%==18 goto MB4_FW_1.0.8.05
if /i %FirmwareSelect%==19 goto MB4_FW_1.0.9.22
if /i %FirmwareSelect%==20 goto MB4_FW_1.0.9.30
if /i %FirmwareSelect%==21 goto MB4_FW_1.0.9.34
if /i %FirmwareSelect%==22 goto MB4_FW_1.0.9.42
if /i %FirmwareSelect%==23 goto MB4_FW_1.0.9.48
if /i %FirmwareSelect%==24 goto MB4_FW_1.0.9.66
if /i %FirmwareSelect%==A call :About && goto MB4FileSelect
if /i %FirmwareSelect%==0 goto MB4FileSelect
if /i %FirmwareSelect%==B goto DeviceSelect
goto MB4FileSelect

:MB4_FW_1.0.5.39
set FolderName=cinco_1.0.5.39
set fw=cinco_201906281218_1.0.5.39_cinco.fw
set res=cinco_201906281218_v54_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.5.40
set FolderName=cinco_1.0.5.40
set fw=cinco_201906271710_1.0.5.40_cinco.fw
set res=cinco_201906271710_v54_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.5.48
set FolderName=cinco_1.0.5.48
set fw=cinco_201907151501_1.0.5.48_cinco.fw
set res=cinco_201907151501_v55_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.5.55
set FolderName=cinco_1.0.5.55
set fw=cinco_201907262116_1.0.5.55_cinco.fw
set res=cinco_201907262116_v56_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.5.66
set FolderName=cinco_1.0.5.66
set fw=cinco_201908131011_1.0.5.66_cinco.fw
set res=cinco_201908131011_v60_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.6.12
set FolderName=cinco_1.0.6.12
set fw=cinco_201908292107_1.0.6.12_cinco.fw
set res=cinco_201908292107_v62_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.6.16
set FolderName=cinco_1.0.6.16
set fw=cinco_201908302157_1.0.6.16_cinco.fw
set res=cinco_201908302157_v62_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.6.24
set FolderName=cinco_1.0.6.24
set fw=cinco_201909110932_1.0.6.24_cinco.fw
set res=cinco_201909110932_v65_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.6.26
set FolderName=cinco_1.0.6.26
set fw=cinco_201909122042_1.0.6.26_cinco.fw
set res=cinco_201909122042_v65_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.7.02
set FolderName=cinco_1.0.7.02
set fw=cinco_201909241700_1.0.7.02_cinco.fw
set res=cinco_201909241700_v66_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.7.04
set FolderName=cinco_1.0.7.04
set fw=cinco_201909262018_1.0.7.04_cinco.fw
set res=cinco_201909262018_v66_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.7.06
set FolderName=cinco_1.0.7.06
set fw=cinco_201910081417_1.0.7.06_cinco.fw
set res=cinco_201910081417_v68_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.7.10
set FolderName=cinco_1.0.7.10
set fw=cinco_201910091051_1.0.7.10_cinco.fw
set res=cinco_201910091051_v66_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.7.14
set FolderName=cinco_1.0.7.14
set fw=cinco_201910122233_1.0.7.14_cinco.fw
set res=cinco_201910122233_v68_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.7.26
set FolderName=cinco_1.0.7.26
set fw=cinco_201910281954_1.0.7.26_cinco.fw
set res=cinco_201910281954_v68_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.7.36
set FolderName=cinco_1.0.7.36
set fw=cinco_201911122048_1.0.7.36_cinco.fw
set res=cinco_201911122048_v76_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.7.60
set FolderName=cinco_1.0.7.60
set fw=cinco_201911261804_1.0.7.60_cinco.fw
set res=cinco_201911261804_v83_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.8.05
set FolderName=cinco_1.0.8.05
set fw=cinco_201910111103_1.0.8.05_cinco.fw
set res=cinco_201910111103_v55_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.9.22
set FolderName=cinco_1.0.9.22
set fw=cinco_202001061540_1.0.9.22_cinco.fw
set res=cinco_202001061540_v88_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.9.30
set FolderName=cinco_1.0.9.30
set fw=cinco_202002120946_1.0.9.30_cinco.fw
set res=cinco_202002120946_v88_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.9.34
set FolderName=cinco_1.0.9.34
set fw=cinco_202002201232_1.0.9.34_cinco.fw
set res=cinco_202002201232_v89_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.9.42
set FolderName=cinco_1.0.9.42
set fw=cinco_202003231437_1.0.9.42_cinco.fw
set res=cinco_202003231437_v92_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.9.48
set FolderName=cinco_1.0.9.48
set fw=cinco_202004271040_1.0.9.48_cinco.fw
set res=cinco_202004271040_v93_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB4_FW_1.0.9.66
set FolderName=cinco_1.0.9.66
set fw=cinco_202007031745_1.0.9.66_cinco.fw
set res=cinco_202007031745_v96_res.pack.bin
set ft=cinco_202001061540_1_font.bin
goto MirrorSelect

:MB5FileSelect
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
@echo.
echo  %SelectFirmwareText%
@echo.
echo  1) 1.0.1.16
echo  2) 1.0.1.32
@echo.
call :Separator
echo  (B) - %BackText%   (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
@echo.
set MB5FileSelect=0
set /p FirmwareSelect=" %InputText% "
if /i %FirmwareSelect%==1 goto MB5_FW_1.0.1.16
if /i %FirmwareSelect%==2 goto MB5_FW_1.0.1.32
if /i %FirmwareSelect%==A call :About && goto MB5FileSelect
if /i %FirmwareSelect%==0 goto MB5FileSelect
if /i %FirmwareSelect%==B goto DeviceSelect
goto MB5FileSelect

:MB5_FW_1.0.1.16
set FolderName=kongming_1.0.1.16
set fw=kongming_202007022342_1.0.1.16_kongming.fw
set res=kongming_202007022342_v57_res.pack.bin
set ft=kongming_202007082210_1_font.bin
goto MirrorSelect

:MB5_FW_1.0.1.32
set FolderName=kongming_1.0.1.32
set fw=kongming_202007082210_1.0.1.32_kongming.fw
set res=kongming_202007082210_v63_res.pack.bin
set ft=kongming_202007082210_1_font.bin
goto MirrorSelect

:MirrorSelect
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
echo  %TitleFirmwareText% %fw%
echo  %TitleResourcesText% %res%
call :FT_Info
@echo.
set mirror=NONE
set mirror1=https://cdn.cnbj2.fds.api.mi-img.com/huami/
set mirror2=https://cdn.awsbj0.fds.api.mi-img.com/huami/
set mirror3=https://cdn.awsusor0.fds.api.mi-img.com/huami/
set mirror4=https://cdn.awssgp0.fds.api.mi-img.com/huami/
set mirror5=https://cdn.awsde0.fds.api.mi-img.com/huami/
set mirror6=https://cdn.awsind0-eco.fds.api.mi-img.com/huami-in/
set mirror7=https://cdn.ksyru0-eco.fds.api.mi-img.com/huami/
set mirror8=https://huami-firmware-sg.s3.ap-southeast-1.amazonaws.com/
set mirror9=https://huami-firmware-us.s3.us-west-2.amazonaws.com/
set mirror10=https://huami-firmware-eu.s3.eu-central-1.amazonaws.com/
set mirror11=https://huami-firmware.s3.ap-south-1.amazonaws.com/
echo  %SelectMirrorText%
@echo.
echo   1) %mirror1%
echo   2) %mirror2%
echo   3) %mirror3%
echo   4) %mirror4%
echo   5) %mirror5%
echo   6) %mirror6%
echo   7) %mirror7%
echo   8) %mirror8%
echo   9) %mirror9%
echo  10) %mirror10%
echo  11) %mirror11%
@echo.
call :Separator
echo  (B) - %BackText%   (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
@echo.
set MirrorSelect=0
set /p MirrorSelect=" %InputText% "
if /i %MirrorSelect%==1 set mirror=%mirror1%&& goto choosePCfolder
if /i %MirrorSelect%==2 set mirror=%mirror2%&& goto choosePCfolder
if /i %MirrorSelect%==3 set mirror=%mirror3%&& goto choosePCfolder
if /i %MirrorSelect%==4 set mirror=%mirror4%&& goto choosePCfolder
if /i %MirrorSelect%==5 set mirror=%mirror5%&& goto choosePCfolder
if /i %MirrorSelect%==6 set mirror=%mirror6%&& goto choosePCfolder
if /i %MirrorSelect%==7 set mirror=%mirror7%&& goto choosePCfolder
if /i %MirrorSelect%==8 set mirror=%mirror8%&& goto choosePCfolder
if /i %MirrorSelect%==9 set mirror=%mirror9%&& goto choosePCfolder
if /i %MirrorSelect%==10 set mirror=%mirror10%&& goto choosePCfolder
if /i %MirrorSelect%==11 set mirror=%mirror11%&& goto choosePCfolder
if /i %MirrorSelect%==A call :About && goto MirrorSelect
if /i %MirrorSelect%==0 goto MirrorSelect
if /i %MirrorSelect%==B goto DeviceSelect
goto MirrorSelect

:choosePCfolder
color F0
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
echo  %TitleFirmwareText% %fw%
echo  %TitleResourcesText% %res%
call :FT_Info
echo  %TitleMirrorText% %mirror%
@echo.
echo  %SelectPullingPathText%
@echo.
echo  1) %DesktopText%
echo  2) %DocumentsText%
echo  3) %DownloadsText%
@echo.
call :Separator
echo  (B) - %BackText%   (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
set choosePCfolder=0
@echo.
set /p choosePCfolder="%InputText% "
if /i %choosePCfolder%==1 (
set PCpath=%userprofile%\Desktop\FWLoader
goto defaultPCpath
)
if /i %choosePCfolder%==2 (
set PCpath=%userprofile%\Documents\FWLoader
goto customPCpath
)
if /i %choosePCfolder%==3 (
set PCpath=%userprofile%\Downloads\FWLoader
goto customPCpath
)
if /i %choosePCfolder%==A (
call :About && goto choosePCfolder
)
if /i %choosePCfolder%==0 (
cls
goto choosePCfolder
)
if /i %choosePCfolder%==B (
goto DeviceSelect
)

:customPCpath
color F0
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
echo  %TitleFirmwareText% %fw%
echo  %TitleResourcesText% %res%
call :FT_Info
echo  %TitleMirrorText% %mirror%
@echo.
echo  %SureCustomPathText% "%pcpath%"?
@echo.
echo  1) %YesText%
echo  2) %NoText%
@echo.
call :Separator
echo  (B) - %BackText%   (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
set customPCpath=0
@echo.
set /p customPCpath="%InputText% "
if /i %customPCpath%==1 md %PCpath%& md %PCpath%\%deviceFolder%& md "%PCpath%\%deviceFolder%\%FolderName%"& goto Download_FW
if /i %customPCpath%==2 goto choosePCfolder
if /i %customPCpath%==A call :About && goto customPCpath
if /i %customPCpath%==B goto choosePCfolder
if /i %customPCpath%==0 goto customPCpath

:defaultPCpath
color F0
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
echo  %TitleFirmwareText% %fw%
echo  %TitleResourcesText% %res%
echo  %TitleFontText% %ft%
echo  %TitleMirrorText% %mirror%
@echo.
echo  %SureCustomPathText% "%PCpath%"?
@echo.
echo  1) %YesText%
echo  2) %NoText%
@echo.
call :Separator
echo  (B) - %BackText%   (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
set defaultPCpath=0
@echo.
set /p defaultPCpath="%InputText% "
if /i %defaultPCpath%==1 md %PCpath%& md %PCpath%\%deviceFolder%& md "%PCpath%\%deviceFolder%\%FolderName%"& goto Download_FW
if /i %defaultPCpath%==2 goto choosePCfolder
if /i %defaultPCpath%==A call :About && goto defaultPCpath
if /i %defaultPCpath%==B goto choosePCfolder
if /i %defaultPCpath%==0 goto defaultPCpath

:Download_FW
color F0
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
echo  %TitleFirmwareText% %fw%
echo  %TitleResourcesText% %res%
call :FT_Info
echo  %TitleMirrorText% %mirror%
echo  %TitlePathText% %PCpath%\%deviceFolder%\%FolderName%
ping -n 3 127.0.0.1 > NUL
@echo.
echo  %DownloadingFWText%
curl %mirror%%fw% -o %PCpath%\%deviceFolder%\%FolderName%\%fw%
if exist %PCpath%\%deviceFolder%\%FolderName%\%fw% (
	color 2F
	ping -n 3 127.0.0.1 > NUL
	goto Download_RES
)
if not exist %PCpath%\%deviceFolder%\%FolderName%\%fw% (
	color 4F
	echo  %FailedText%
	@echo.
	echo  %RetryText%
	@echo.
	echo  1) %YesText%
	echo  2) %NoText%
	@echo.
	set Download_FW=0
	@echo.
	set /p Download_FW="%InputText% "
	if /i %Download_FW%==1 goto Download_FW
	if /i %Download_FW%==2 goto Download_RES
	if /i %Download_FW%==0 goto Download_FW
)

:Download_RES
color F0
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
echo  %TitleFirmwareText% %fw%
echo  %TitleResourcesText% %res%
call :FT_Info
echo  %TitleMirrorText% %mirror%
echo  %TitlePathText% %PCpath%\%deviceFolder%\%FolderName%
ping -n 3 127.0.0.1 > NUL
@echo.
echo  %DownloadingRESText%
curl %mirror%%res% -o %PCpath%\%deviceFolder%\%FolderName%\%res%.res
if exist %PCpath%\%deviceFolder%\%FolderName%\%res%.res (
	color 2F
	ping -n 3 127.0.0.1 > NUL
	goto Check_Download_FT
)
if not exist %PCpath%\%deviceFolder%\%FolderName%\%res%.res (
	color 4F
	echo  %FailedText%
	@echo.
	echo  %RetryText%
	@echo.
	echo  1) %YesText%
	echo  2) %NoText%
	@echo.
	set Download_RES=0
	@echo.
	set /p Download_RES="%InputText% "
	if /i %Download_RES%==1 goto Download_RES
	if /i %Download_RES%==2 goto Check_Download_FT
	if /i %Download_RES%==0 goto Download_RES
)

:Check_Download_FT
if %ft%==0 (
	goto OpenFolder
) else (
	goto Download_FT
)

:Download_FT
color F0
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
echo  %TitleFirmwareText% %fw%
echo  %TitleResourcesText% %res%
call :FT_Info
echo  %TitleMirrorText% %mirror%
echo  %TitlePathText% %PCpath%\%deviceFolder%\%FolderName%
ping -n 3 127.0.0.1 > NUL
@echo.
echo  %DownloadingFTText%
curl %mirror%%ft% -o %PCpath%\%deviceFolder%\%FolderName%\%ft%.ft
if exist %PCpath%\%deviceFolder%\%FolderName%\%ft%.ft (
	color 2F
	ping -n 2 127.0.0.1 > NUL
	echo  %SuccessText%
	ping -n 3 127.0.0.1 > NUL
	goto OpenFolder
)
if not exist %PCpath%\%deviceFolder%\%FolderName%\%ft%.ft (
	color 4F
	echo  %FailedText%
	@echo.
	echo  %RetryText%
	@echo.
	echo  1) %YesText%
	echo  2) %NoText%
	@echo.
	set Download_FT=0
	@echo.
	set /p Download_FT="%InputText% "
	if /i %Download_FT%==1 goto Download_FT
	if /i %Download_FT%==2 goto OpenFolder
	if /i %Download_FT%==0 goto Download_FT
)

:OpenFolder
color F0
cls
call :Logo
echo  %TitleDeviceText% %deviceTitle%
echo  %TitleFirmwareText% %fw%
echo  %TitleResourcesText% %res%
if %ft% NEQ 0 (
	echo  %TitleFontText% %ft%
)
echo  %TitlePathText% %PCpath%\%deviceFolder%\%FolderName%
@echo.
echo  %OpenFolderText%
@echo.
echo  1) %YesText%
echo  2) %NoText%
@echo.
call :Separator
echo  (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
set OpenFolder=0
set /p OpenFolder=" %InputText% "
if /i %OpenFolder%==1 explorer.exe /select, %PCpath%\%deviceFolder%\%FolderName%\%fw%, && goto NewDownload
if /i %OpenFolder%==2 goto NewDownload
if /i %OpenFolder%==A call :About && goto OpenFolder
if /i %OpenFolder%==0 goto OpenFolder

:NewDownload
color F0
cls
call :Logo
echo  %NewDownloadText%
@echo.
echo  1) %YesText%
echo  2) %NoText%
@echo.
call :Separator
echo  (Enter) - %UpdateText%   (A) - %AboutButtonText%
call :Separator
set NewDownload=0
set /p NewDownload=" %InputText% "
if /i %NewDownload%==1 goto DeviceSelect
if /i %NewDownload%==2 goto END
if /i %NewDownload%==A call :About && goto NewDownload
if /i %NewDownload%==0 goto NewDownload

:END
color F0
cls
call :Logo
echo  %ClosingProgramText%
ping -n 3 127.0.0.1 > NUL
exit



:LangRU
set AboutButtonText=Ž ¯à®£à ¬¬¥
set AboutText=  FWLoader - ãâ¨«¨â  ¤«ï § £àã§ª¨ ®ä¨æ¨ «ì­ëå ¯à®è¨¢®ª ¤«ï ­®á¨¬ëå ãáâà®©áâ¢ Xiaomi

set BackText= § ¤
set UpdateText=Ž¡­®¢¨âì

set InputText=‚¢®¤:

set YesText=„ 
set NoText=¥â

set TitleDeviceText=“áâà®©áâ¢®:
set TitleFirmwareText=à®è¨¢ª :
set TitleResourcesText=¥áãàáë:
set TitleFontText=˜à¨äâ:
set TitleMirrorText=‡¥àª «®:
set TitlePathText=ãâì:

set SelectDeviceText=‚ë¡¥à¨â¥ ãáâà®©áâ¢®:
set SelectFirmwareText=‚ë¡¥à¨â¥ ¯à®è¨¢ªã:
set SelectMirrorText=‚ë¡¥à¨â¥ §¥àª «®:

set DesktopText= ¡®ç¨© áâ®«
set DocumentsText=„®ªã¬¥­âë
set DownloadsText=‡ £àã§ª¨
set SelectPullingPathText=‚ë¡¥à¨â¥ ª®­¥ç­ãî ¯ ¯ªã ¤«ï § £àã§ª¨:
set SureCustomPathText=‚ë ã¢¥à¥­ë çâ® å®â¨â¥ ¨á¯®«ì§®¢ âì ¯ãâì:

set DownloadingFWText=‡ £àã§ª  ¯à®è¨¢ª¨
set DownloadingRESText=‡ £àã§ª  à¥áãàá®¢
set DownloadingFTText=‡ £àã§ª  èà¨äâ 

set OpenFolderText=Žâªàëâì ª®­¥ç­ãî ¯ ¯ªã?

set SuccessText=ƒ®â®¢®
set FailedText=Žè¨¡ª 

set NewDownloadText=•®â¨â¥ ­ ç âì ­®¢ãî § £àã§ªã?

set ClosingProgramText=‡ ªàëâ¨¥ ¯à®£à ¬¬ë

GoTo :EOF



:LangEN
set AboutButtonText=About
set AboutText=   FWLoader is a mini tool for downloading Official firmwares for Mi wear devices

set BackText=Back
set UpdateText=Update

set InputText=Input:

set YesText=Yes
set NoText=No

set TitleDeviceText=Device:
set TitleFirmwareText=Firmware:
set TitleResourcesText=Resources:
set TitleFontText=Font:
set TitleMirrorText=Mirror:
set TitlePathText=Path:

set SelectDeviceText=Choose device:
set SelectFirmwareText=Choose firmware:
set SelectMirrorText=Choose mirror:

set DesktopText=Desktop
set DocumentsText=Documents
set DownloadsText=Downloads
set SelectPullingPathText=Select end download path:
set SureCustomPathText=Are you sure that your path is

set DownloadingFWText=Downloading firmware
set DownloadingRESText=Downloading resources
set DownloadingFTText=Downloading font

set OpenFolderText=Do you want to open end folder?

set SuccessText=Success
set FailedText=Failed

set NewDownloadText=Do you want to download another firmware?

set ClosingProgramText=Closing program

GoTo :EOF



:Separator
echo  -----------------------------------------------------------------------------------
GoTo :EOF

:Logo
call :Separator
echo          ÛÛÛÛÛÛÛ»ÛÛ»    ÛÛ»ÛÛ»      ÛÛÛÛÛÛ»  ÛÛÛÛÛ» ÛÛÛÛÛÛ» ÛÛÛÛÛÛÛ»ÛÛÛÛÛÛ» 
echo          ÛÛÉÍÍÍÍ¼ÛÛº    ÛÛºÛÛº     ÛÛÉÍÍÍÛÛ»ÛÛÉÍÍÛÛ»ÛÛÉÍÍÛÛ»ÛÛÉÍÍÍÍ¼ÛÛÉÍÍÛÛ»
echo          ÛÛÛÛÛ»  ÛÛº Û» ÛÛºÛÛº     ÛÛº   ÛÛºÛÛÛÛÛÛÛºÛÛº  ÛÛºÛÛÛÛÛ»  ÛÛÛÛÛÛÉ¼
echo          ÛÛÉÍÍ¼  ÛÛºÛÛÛ»ÛÛºÛÛº     ÛÛº   ÛÛºÛÛÉÍÍÛÛºÛÛº  ÛÛºÛÛÉÍÍ¼  ÛÛÉÍÍÛÛ»
echo          ÛÛº     ÈÛÛÛÉÛÛÛÉ¼ÛÛÛÛÛÛÛ»ÈÛÛÛÛÛÛÉ¼ÛÛº  ÛÛºÛÛÛÛÛÛÉ¼ÛÛÛÛÛÛÛ»ÛÛº  ÛÛº
echo          ÈÍ¼      ÈÍÍ¼ÈÍÍ¼ ÈÍÍÍÍÍÍ¼ ÈÍÍÍÍÍ¼ ÈÍ¼  ÈÍ¼ÈÍÍÍÍÍ¼ ÈÍÍÍÍÍÍ¼ÈÍ¼  ÈÍ¼
echo                              %title%
call :Separator
@echo.
GoTo :EOF

:LogoUP1
@echo.
@echo.
@echo.
call :Logo
GoTo :EOF

:LogoUP2
@echo.
@echo.
@echo.
@echo.
@echo.
call :Logo
GoTo :EOF

:LogoUP3
@echo.
@echo.
@echo.
@echo.
@echo.
@echo.
@echo.
@echo.
call :Logo
GoTo :EOF

:LogoCenter
@echo.
@echo.
@echo.
@echo.
@echo.
@echo.
@echo.
@echo.
@echo.
@echo.
@echo.
@echo.
call :Logo
GoTo :EOF



:About
cls
call :Logo
ping -n 1 127.0.0.1 > NUL
cls
call :LogoUP1
ping -n 1 127.0.0.1 > NUL
cls
call :LogoUP2
ping -n 1 127.0.0.1 > NUL
cls
call :LogoUP3
ping -n 1 127.0.0.1 > NUL
cls
call :LogoCenter
ping -n 2 127.0.0.1 > NUL
echo %AboutText%
call :Separator
ping -n 7 127.0.0.1 > NUL
cls
call :LogoCenter
ping -n 1 127.0.0.1 > NUL
cls
call :LogoUP3
ping -n 1 127.0.0.1 > NUL
cls
call :LogoUP2
ping -n 1 127.0.0.1 > NUL
cls
call :LogoUP1
ping -n 1 127.0.0.1 > NUL
cls
call :Logo
GoTo :EOF

:FT_Info
if %ft% NEQ 0 (
echo  %TitleFontText% %ft%
)
GoTo :EOF


:PreDownload_FW
cls
color 2F
if not exist "%fw%" goto Download_FW
color 4F
echo  File already exist!
ping -n 2 127.0.0.1 > NUL
goto PreDownload_RES

:PreDownload_RES
cls
color 2F
if not exist "%res%.res" goto Download_RES
color 4F
echo  File already exist!
ping -n 2 127.0.0.1 > NUL
goto END