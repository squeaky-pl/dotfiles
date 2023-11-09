if(!(Get-Command scoop -errorAction SilentlyContinue)) {
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
}

if(!(Get-Command winget -errorAction SilentlyContinue)) {
    scoop install winget
}

scoop install git

if(!(Test-Path $env:USERPROFILE/dotfiles)) {
    git clone https://github.com/squeaky-pl/dotfiles.git $env:USERPROFILE/dotfiles
}

Set-Location $env:USERPROFILE/dotfiles
git pull

Write-Output "Go to $env:USERPROFILE\dotfiles\windows"