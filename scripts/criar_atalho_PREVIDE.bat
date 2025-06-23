@echo off
setlocal

REM === Configurações ===
set "LINK_NAME=Portal PREVIDE"
set "LINK_URL=http://previde.intra"
set "ICON_PATH=C:\Windows\System32\shell32.dll,220"

REM === Caminhos ===
set "DESKTOP_PATH=%USERPROFILE%\Desktop"
set "STARTUP_PATH=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

REM === Criar atalho na Área de Trabalho ===
powershell -Command "$s = (New-Object -COM WScript.Shell).CreateShortcut('%DESKTOP_PATH%\%LINK_NAME%.lnk'); $s.TargetPath = '%LINK_URL%'; $s.IconLocation = '%ICON_PATH%'; $s.Save()"

REM === Criar atalho na Inicialização ===
powershell -Command "$s = (New-Object -COM WScript.Shell).CreateShortcut('%STARTUP_PATH%\%LINK_NAME%.lnk'); $s.TargetPath = '%LINK_URL%'; $s.IconLocation = '%ICON_PATH%'; $s.Save()"

echo Atalhos criados com sucesso!
timeout /t 3 >nul
