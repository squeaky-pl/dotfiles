. $PSScriptRoot\utils.ps1

# install newer version of powershell
Install-Winget-App Microsoft.PowerShell
Install-Winget-App Starship.Starship
Install-Winget-App nushell

# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.3#profile-types-and-locations
$current_user_profile = "$env:USERPROFILE\Documents\PowerShell\Profile.ps1"
New-Item -ItemType Directory -Force (Split-Path -parent $current_user_profile)

sudo cmd /c mklink $current_user_profile $PSScriptRoot\Profile.ps1

New-Item -ItemType Directory -Force $env:USERPROFILE\.config

sudo cmd /c mklink $env:USERPROFILE\.config\starship.toml $PSScriptRoot\..\starship.toml

Copy-Item $PSScriptRoot\..\nushell -Destination $env:APPDATA -Recurse -Force