scoop bucket add extras
scoop install libreoffice

Copy-Item $PSScriptRoot\LibreOffice -Destination $env:APPDATA -Recurse -Force