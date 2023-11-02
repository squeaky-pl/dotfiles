. $PSScriptRoot\utils.ps1

scoop install starship

New-Item -ItemType Directory -Force (Split-Path -parent $PROFILE)

cmd /c mklink $PROFILE $PSScriptRoot\Microsoft.PowerShell_profile.ps1

New-Item -ItemType Directory -Force $env:USERPROFILE\.config

cmd /c mklink $env:USERPROFILE\.config\starship.toml $PSScriptRoot\..\starship.toml