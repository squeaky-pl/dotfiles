. $PSScriptRoot\utils.ps1

if(!(Get-Command scoop -errorAction SilentlyContinue)) {
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
}

if(!(Get-Command winget -errorAction SilentlyContinue)) {
    scoop install winget
}

Install-Winget-App Git.Git

if(!(Test-Path $env:USERPROFILE/dotfiles)) {
    & 'C:\Program Files\Git\bin\git.exe' clone https://github.com/squeaky-pl/dotfiles.git $env:USERPROFILE/dotfiles
}

Set-Location $env:USERPROFILE/dotfiles
& 'C:\Program Files\Git\bin\git.exe' pull

Write-Output "Go to $env:USERPROFILE\dotfiles\windows"
