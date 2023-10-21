scoop bucket add extras
scoop install extras/sharex

Copy-Item $PSScriptRoot/ShareX -Destination $env:USERPROFILE\Documents -Recurse -Force

Start-Process -NoNewWindow -FilePath (scoop which sharex).Replace('~', $env:USERPROFILE) | Out-Null