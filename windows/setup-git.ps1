. $PSScriptRoot\utils.ps1

Install-Winget-App Git.Git
Install-Winget-App Helix.Helix
Install-Winget-App dandavison.delta
Install-Winget-App tummychow.git-absorb
Install-Winget-App GitHub.cli

sudo powershell -NoProfile -Command "Get-Service -Name ssh-agent | Set-Service -StartupType Automatic; Start-Service ssh-agent"

& 'C:\Program Files\Git\bin\git.exe' remote set-url origin git@github.com:squeaky-pl/dotfiles.git

New-Item -ItemType Directory -Path $env:USERPROFILE/.ssh -Force

if(!(Test-Path $env:USERPROFILE/.ssh/id_rsa) -and (Test-Path Y:\database.kdbx)) {
    & 'C:\Program Files\KeePassXC\keepassxc-cli.exe' attachment-export Y:\database.kdbx "SSH/public private key" id_rsa $env:USERPROFILE/.ssh/id_rsa
}

if(Test-Path $env:USERPROFILE/.ssh/id_rsa) {
    ssh-add $env:USERPROFILE/.ssh/id_rsa
    ssh -T git@github.com
}

if(!(Test-Path $env:USERPROFILE/.gitconfig))
{
    sudo cmd /c mklink $env:USERPROFILE\.gitconfig $PSScriptRoot\..\.gitconfig
}