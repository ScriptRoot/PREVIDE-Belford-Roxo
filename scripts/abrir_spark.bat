@echo off

REM Verifica se está no Program Files (x86)
if exist "C:\Program Files (x86)\Spark\Spark.exe" (
    start "" "C:\Program Files (x86)\Spark\Spark.exe"
    exit
)

REM Verifica se está no Program Files padrão
if exist "C:\Program Files\Spark\Spark.exe" (
    start "" "C:\Program Files\Spark\Spark.exe"
    exit
)

exit