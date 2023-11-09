if(!(Get-Command scoop -errorAction SilentlyContinue)) {
    Invoke-RestMethod get.scoop.sh | Invoke-Expression
}
scoop install git
if(!(Test-Path $env:USERPROFILE/dotfiles)) {
    git clone https://github.com/squeaky-pl/dotfiles.git $env:USERPROFILE/dotfiles
}

Write-Output "Go to $env:USERPROFILE\dotfiles\windows"