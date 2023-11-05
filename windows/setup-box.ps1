. $PSScriptRoot\utils.ps1

scoop install rclone
winget install --accept-source-agreements --accept-package-agreements --disable-interactivity -e --id WinFsp.WinFsp

$temp_rclone_config = New-TemporaryFile
Copy-Item $PSScriptRoot\rclone\rclone.boot.conf -Destination $temp_rclone_config -Force

Write-Output ""
Write-Output "Provide Dropbox credentials"
Write-Output ""

rclone --config $temp_rclone_config config reconnect dropbox:

$temp_database_name = "$(New-TemporaryFile).kdbx"
rclone --config $temp_rclone_config copyto dropbox:database.kdbx $temp_database_name

Write-Output ""
Write-Output "Provide database credentials"
Write-Output ""

keepassxc-cli.exe attachment-export $temp_database_name dotfiles/rclone.conf rclone.conf "$(Get-Scoop-App-Current-Folder rclone)\rclone.conf"

Remove-Item $temp_rclone_config -Force
Remove-Item $temp_database_name -Force

Start-Process -NoNewWindow `
    -FilePath wscript -ArgumentList `
    "$PSScriptRoot\invisible.vbs $(Get-Scoop-App-Location rclone) mount box: X: --network-mode --vfs-cache-mode full"

Start-Process -NoNewWindow `
    -FilePath wscript -ArgumentList `
    "$PSScriptRoot\invisible.vbs $(Get-Scoop-App-Location rclone) mount dropbox: Y: --network-mode --vfs-cache-mode full"

New-Autostart-Item wscript `
    -Arguments "$PSScriptRoot\invisible.vbs $(Get-Scoop-App-Location rclone) mount box: X: --network-mode --vfs-cache-mode full" `
    -Name "Mount box"

New-Autostart-Item wscript `
    -Arguments "$PSScriptRoot\invisible.vbs $(Get-Scoop-App-Location rclone) mount dropbox: Y: --network-mode --vfs-cache-mode full" `
    -Name "Mount dropbox"