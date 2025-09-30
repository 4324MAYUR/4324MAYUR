@echo off

REM Get the current directory where the batch file is located
set "currentDir=%~dp0"

REM Change directory to the current directory
cd /d "%currentDir%"

REM Perform a pull operation
git pull origin main

REM Check if the pull was successful
if %errorlevel% == 0 (
    powershell -WindowStyle Hidden -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Pull successful.', 'Success', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)"
) else (
    powershell -WindowStyle Hidden -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Error during pull operation.', 'Error', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)"
)

exit
