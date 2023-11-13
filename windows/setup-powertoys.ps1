. $PSScriptRoot\utils.ps1

Copy-Item $PSScriptRoot/PowerToys -Destination $env:LOCALAPPDATA/Microsoft -Recurse -Force

Install-Winget-App Microsoft.PowerToys