@echo off
setlocal enabledelayedexpansion
:: 允许中文解码
chcp 65001 >nul

:: 检查是否有拖入的文件
if "%~1"=="" (
    echo Drag 7z files to this BAT script
    pause
    exit
)

:: 设置 WinRAR 路径
set "WINRAR=C:\Program Files\WinRAR\WinRAR.exe"

:: 获取文件路径和名称
set "FilePath=%~dp1"
set "FileName=%~n1"
set "FileExt=%~x1"

set "password1=公众号：琢玉游戏"
set "password2=zhuoyugame"

:: 第一次解压（解压 7z 分卷，密码：公众号：琢玉游戏）
%WINRAR% x -p"%password1%" "%FileName%%FileExt%"
set "errorlevel1=%ERRORLEVEL%"

:: 查找解压出的文件（假设解压后只有一个jpg文件）
for /f "delims=" %%F in ('dir /b /a-d /o-d "%FilePath%\*.jpg"') do (
    set "FileMiddleName=%%~nF.rar"
    ren "%FilePath%\%%F" "%%~nF.rar"
    goto :done
)
:done

:: 第二次解压（解压RAR，密码：zhuoyugame）
%WINRAR% x -p"%password2%" %FileMiddleName%
set "errorlevel2=%ERRORLEVEL%"

:: 删除压缩包
if NOT %errorlevel1%==0 (
    echo 7z extraction failed. Error code: %errorlevel1%
    pause
    exit
)
if NOT %errorlevel2%==0 (
    echo RAR extraction failed. Error code: %errorlevel2%
    pause
    exit
)
powershell -command "$shell = New-Object -ComObject Shell.Application; $folder = $shell.Namespace(10); Get-ChildItem '%FilePath%%FileName%.001' | ForEach-Object { $folder.MoveHere($_.FullName) }"
powershell -command "$shell = New-Object -ComObject Shell.Application; $folder = $shell.Namespace(10); Get-ChildItem '%FilePath%%FileName%.002' | ForEach-Object { $folder.MoveHere($_.FullName) }"
powershell -command "$shell = New-Object -ComObject Shell.Application; $folder = $shell.Namespace(10); Get-ChildItem '%FilePath%%FileMiddleName%' | ForEach-Object { $folder.MoveHere($_.FullName) }"


