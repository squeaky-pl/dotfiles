scoop bucket add main
scoop install main/git
scoop install sudo
scoop install main/delta

sudo powershell -Command "Get-Service -Name ssh-agent | Set-Service -StartupType Automatic; Start-Service ssh-agent"

if(!(Test-Path $env:USERPROFILE\.gitconfig))
{
    cmd /c mklink $env:USERPROFILE\.gitconfig $PSScriptRoot\..\.gitconfig
}