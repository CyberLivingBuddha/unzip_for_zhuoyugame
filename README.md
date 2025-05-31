# 琢玉游戏分卷压缩包自动解压工具 (Windows BAT脚本)

## 功能说明
自动解压从琢玉游戏下载的分卷压缩包，只需拖拽`.7z.001`文件到此`.bat`脚本即可完成解压。

## 使用前提
- 已安装WinRAR软件，没有请转到：[WinRAR](https://www.win-rar.com)
- 需修改`.bat`脚本中WinRAR路径确保与实际安装的WinRAR路径一致（默认`C:\Program Files\WinRAR\WinRAR.exe`），~~也可提前添加环境变量~~。
```bat
set "WINRAR=C:\Program Files\WinRAR\WinRAR.exe"
```

## 使用方法
1. 将下载的`.7z.001`，`.7z.002`文件与`.bat`脚本放在同一文件夹下。
2. 直接拖拽`.7z.001`文件到此`.bat`脚本即可完成解压。
注意：解压顺利完成后，`.bat`脚本会将原压缩包移到回收站。
