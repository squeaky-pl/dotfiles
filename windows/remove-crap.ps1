. $PSScriptRoot\utils.ps1

Install-Winget-App Klocman.BulkCrapUninstaller

& 'C:\Program Files\BCUninstaller\win-x64\BCU-console.exe' uninstall $PSScriptRoot\crap.bcul /Q /U /V
