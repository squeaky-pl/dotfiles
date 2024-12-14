. $PSScriptRoot\utils.ps1

Install-Winget-App TheDocumentFoundation.LibreOffice

Copy-Item $PSScriptRoot\LibreOffice -Destination $env:APPDATA -Recurse -Force
