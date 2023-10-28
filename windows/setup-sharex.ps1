. $PSScriptRoot\utils.ps1

scoop bucket add extras
scoop install extras/sharex

Copy-Item $PSScriptRoot\ShareX -Destination (Get-Scoop-App-Current-Folder sharex) -Recurse -Force

Start-Scoop-App sharex

New-Autostart-Item (Get-Scoop-App-Location sharex)
