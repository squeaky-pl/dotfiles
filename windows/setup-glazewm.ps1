. $PSScriptRoot\utils.ps1

scoop bucket add extras
scoop install extras/glazewm

New-Item -ItemType Directory -Force -Path $env:USERPROFILE\.glaze-wm | Out-Null

if(!(Test-Path $env:USERPROFILE\.glaze-wm\config.yaml))
{
    sudo cmd /c mklink $env:USERPROFILE\.glaze-wm\config.yaml $PSScriptRoot\.glaze-wm\config.yaml
}

New-Autostart-Item (Get-Scoop-App-Location glazewm)
