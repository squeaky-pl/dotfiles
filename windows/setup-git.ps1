scoop bucket add main
scoop install main/git
scoop install sudo
scoop install main/delta
scoop install helix

sudo powershell -NoProfile -Command "Get-Service -Name ssh-agent | Set-Service -StartupType Automatic; Start-Service ssh-agent"

if(!(Test-Path $env:USERPROFILE\.gitconfig))
{
    cmd /c mklink $env:USERPROFILE\.gitconfig $PSScriptRoot\..\.gitconfig
}