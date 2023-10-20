scoop bucket add extras
scoop install extras/glazewm

New-Item -ItemType Directory -Force -Path $env:USERPROFILE\.glaze-wm | Out-Null

if(!(Test-Path $env:USERPROFILE\.glaze-wm\config.yaml))
{
    cmd /c mklink $env:USERPROFILE\.glaze-wm\config.yaml $PSScriptRoot\.glaze-wm\config.yaml
}

New-ItemProperty -Force -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
    -Name "GlazeWM" `
    -Value (scoop which glazewm).Replace('~', $env:USERPROFILE) | Out-Null