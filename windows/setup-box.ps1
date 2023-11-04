. $PSScriptRoot\utils.ps1

scoop install rclone
winget install --accept-source-agreements --accept-package-agreements --disable-interactivity -e --id WinFsp.WinFsp

New-Autostart-Item wscript `
    -Arguments "$PSScriptRoot\invisible.vbs $(Get-Scoop-App-Location rclone) mount box: X: --network-mode --vfs-cache-mode full" `
    -Name "Mount box"

New-Autostart-Item wscript `
    -Arguments "$PSScriptRoot\invisible.vbs $(Get-Scoop-App-Location rclone) mount dropbox: Y: --network-mode --vfs-cache-mode full" `
    -Name "Mount dropbox"