. $PSScriptRoot\utils.ps1

scoop bucket add extras
scoop install extras/keepassxc

# This seems to be the first folder where configuration is looked at, at least for scoop
Copy-Item $PSScriptRoot\KeePassXC\keepassxc.ini `
    -Destination "$(Get-Scoop-App-Current-Folder keepassxc)\config\keepassxc.ini" `
    -Force

# This is the standard folder, it has browser configuration
Copy-Item $PSScriptRoot/KeePassXC `
    -Destination $env:LOCALAPPDATA `
    -Recurse `
    -Force

# The browser configuration files contain `~` which we need to replace with user profile
$browser_configs = Get-ChildItem -Path $env:LOCALAPPDATA\KeePassXC -Filter "org.keepassxc.keepassxc_browser_*"
foreach ($browser_config in $browser_configs)
{
    ((Get-Content -path $browser_config.FullName -Raw) -replace '~', $env:USERPROFILE.replace('\', '\\')) | Set-Content -Path $browser_config.FullName
}

Start-Scoop-App keepassxc

New-Autostart-Item (Get-Scoop-App-Location keepassxc)