. $PSScriptRoot\utils.ps1

Install-Winget-App Rclone.Rclone
Install-Winget-App WinFsp.WinFsp

if(!(Test-Path "$env:APPDATA\rclone\rclone.conf") -or !(Get-Content "$env:APPDATA\rclone\rclone.conf")) {
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

    keepassxc-cli.exe attachment-export $temp_database_name dotfiles/rclone.conf rclone.conf "$env:APPDATA\rclone\rclone.conf"

    Remove-Item $temp_rclone_config -Force
    Remove-Item $temp_database_name -Force
}

Start-Process -NoNewWindow `
    -FilePath wscript -ArgumentList `
    "$PSScriptRoot\invisible.vbs $(Get-Scoop-App-Location rclone) mount box: X: --network-mode --vfs-cache-mode full --volname \\cloud\$Env:UserName\box"

Start-Process -NoNewWindow `
    -FilePath wscript -ArgumentList `
    "$PSScriptRoot\invisible.vbs $(Get-Scoop-App-Location rclone) mount dropbox: Y: --network-mode --vfs-cache-mode full --volname \\cloud\$Env:UserName\dropbox"

    Start-Process -NoNewWindow `
    -FilePath wscript -ArgumentList `
    "$PSScriptRoot\invisible.vbs $(Get-Scoop-App-Location rclone) mount workbox: Z: --network-mode --vfs-cache-mode full --volname \\cloud\$Env:UserName\workbox"

New-Autostart-Item wscript `
    -Arguments "$PSScriptRoot\invisible.vbs $(Get-Scoop-App-Location rclone) mount box: X: --network-mode --vfs-cache-mode full --volname \\cloud\$Env:UserName\box" `
    -Name "Mount box"

New-Autostart-Item wscript `
    -Arguments "$PSScriptRoot\invisible.vbs $(Get-Scoop-App-Location rclone) mount dropbox: Y: --network-mode --vfs-cache-mode full --volname \\cloud\$Env:UserName\dropbox" `
    -Name "Mount dropbox"

New-Autostart-Item wscript `
    -Arguments "$PSScriptRoot\invisible.vbs $(Get-Scoop-App-Location rclone) mount workbox: Z: --network-mode --vfs-cache-mode full --volname \\cloud\$Env:UserName\workbox" `
    -Name "Mount workbox"