. $PSScriptRoot\utils.ps1

scoop bucket add main
scoop install main/git
scoop install sudo
scoop install main/delta
scoop install helix

Install-Winget-App GitHub.cli

sudo powershell -NoProfile -Command "Get-Service -Name ssh-agent | Set-Service -StartupType Automatic; Start-Service ssh-agent"

git remote set-url origin git@github.com:squeaky-pl/dotfiles.git

New-Item -ItemType Directory -Path $env:USERPROFILE/.ssh -Force

if(!(Test-Path $env:USERPROFILE/.ssh/id_rsa) -and (Test-Path Y:\database.kdbx)) {
    keepassxc-cli.exe attachment-export Y:\database.kdbx "SSH/public private key" id_rsa $env:USERPROFILE/.ssh/id_rsa
}

if(Test-Path $env:USERPROFILE/.ssh/id_rsa) {
    ssh-add $env:USERPROFILE/.ssh/id_rsa
    ssh -T git@github.com
}

if(!(Test-Path $env:USERPROFILE/.gitconfig))
{
    sudo cmd /c mklink $env:USERPROFILE\.gitconfig $PSScriptRoot\..\.gitconfig
}