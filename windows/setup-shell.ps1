. $PSScriptRoot\utils.ps1

# update powershell
Install-Winget-App Microsoft.PowerShell
Install-Winget-App Starship.Starship
Install-Winget-App nushell

# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.3#profile-types-and-locations
$current_user_profile = "$env:USERPROFILE\Documents\PowerShell\Profile.ps1"
New-Item -ItemType Directory -Force (Split-Path -parent $current_user_profile)

sudo cmd /c mklink $current_user_profile $PSScriptRoot\Profile.ps1

New-Item -ItemType Directory -Force $env:USERPROFILE\.config

sudo cmd /c mklink $env:USERPROFILE\.config\starship.toml $PSScriptRoot\..\starship.toml

# https://starship.rs/guide/#%F0%9F%9A%80-installation
New-Item -ItemType Directory -Force $env:USERPROFILE\.cache\starship

Start-Process -Wait -NoNewWindow -FilePath $env:ProgramFiles\starship\bin\starship -ArgumentList "init nu" -RedirectStandardOutput $env:USERPROFILE\.cache\starship\init.nu

Copy-Item $PSScriptRoot\nushell -Destination $env:APPDATA -Recurse -Force