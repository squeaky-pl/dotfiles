. $PSScriptRoot\utils.ps1

Install-Winget-App ShareX.ShareX

Copy-Item $PSScriptRoot\ShareX -Destination $env:USERPROFILE\Documents -Recurse -Force

New-Quick-Access "$env:USERPROFILE\Documents\ShareX\Screenshots"

Start-Process -NoNewWindow -FilePath $env:ProgramFiles\ShareX\ShareX.exe
