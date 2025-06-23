@echo off
setlocal enabledelayedexpansion

:: Caminho da pasta principal
set "baseFolder=D:\Transfer"

:: Nome do arquivo que NÃO pode ser apagado
set "protectedFile=Leia-me.txt"

:: Lista de pastas que devem ser preservadas
set "keepFolders=Almoxarifado Contabilidade Controle_Interno DPA DTI Patrimônio Presidência Procuradoria Protocolo RH Tesouraria Leia-me.txt"

:: Apaga todas as pastas dentro de D:\Transfer, exceto as especificadas
for /d %%F in ("%baseFolder%\*") do (
    set "delete=1"
    for %%K in (%keepFolders%) do (
        if /I "%%~nxF"=="%%K" set "delete=0"
    )
    if !delete! == 1 (
        rmdir /s /q "%%F"
    )
)

:: Apaga todos os arquivos dentro de D:\Transfer, EXCETO "Leia-me.txt"
for %%A in ("%baseFolder%\*.*") do (
    if /I not "%%~nxA"=="%protectedFile%" (
        del "%%A" >nul 2>&1
    )
)

:: Esvazia as pastas permitidas (arquivos e subpastas)
for %%K in (%keepFolders%) do (
    if exist "%baseFolder%\%%K" (
        for %%F in ("%baseFolder%\%%K\*.*") do del "%%F" >nul 2>&1
        for /d %%D in ("%baseFolder%\%%K\*") do rmdir /s /q "%%D"
    )
)

exit
