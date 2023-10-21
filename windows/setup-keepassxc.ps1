scoop bucket add extras
scoop install extras/keepassxc

Copy-Item $PSScriptRoot/KeePassXC/keepassxc.ini `
    -Destination (scoop which keepassxc).Replace('~', $env:USERPROFILE).Replace('KeePassXC.exe', 'config\keepassxc.ini') `
    -Force

Start-Process -NoNewWindow -FilePath (scoop which keepassxc).Replace('~', $env:USERPROFILE) | Out-Null

New-ItemProperty -Force -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" `
    -Name "KeePassXC" `
    -Value (scoop which keepassxc).Replace('~', $env:USERPROFILE) | Out-Null