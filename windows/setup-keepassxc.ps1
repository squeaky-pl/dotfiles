. $PSScriptRoot\utils.ps1

Install-Winget-App KeePassXCTeam.KeePassXC

Copy-Item $PSScriptRoot/KeePassXC `
    -Destination $env:APPDATA `
    -Recurse `
    -Force

# The browser configuration files contain `~` which we need to replace with user profile
$browser_configs = Get-ChildItem -Path $env:APPDATA\KeePassXC -Filter "org.keepassxc.keepassxc_browser_*"
foreach ($browser_config in $browser_configs)
{
    ((Get-Content -path $browser_config.FullName -Raw) -replace '~', $env:USERPROFILE.replace('\', '\\')) | Set-Content -Path $browser_config.FullName
}

Start-Process -NoNewWindow -FilePath "C:\Program Files\KeePassXC\KeePassXC.exe"
