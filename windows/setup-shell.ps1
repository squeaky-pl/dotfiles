. $PSScriptRoot\utils.ps1

# update powershell
winget install --accept-source-agreements --accept-package-agreements --disable-interactivity -e --id Microsoft.PowerShell
scoop install starship

# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.3#profile-types-and-locations
$current_user_profile = "$env:USERPROFILE\Documents\PowerShell\Profile.ps1"
New-Item -ItemType Directory -Force (Split-Path -parent $current_user_profile)

sudo cmd /c mklink $current_user_profile $PSScriptRoot\Profile.ps1

New-Item -ItemType Directory -Force $env:USERPROFILE\.config

sudo cmd /c mklink $env:USERPROFILE\.config\starship.toml $PSScriptRoot\..\starship.toml