scoop bucket add extras
scoop install extras/powertoys

Copy-Item $PSScriptRoot/PowerToys -Destination $env:LOCALAPPDATA/Microsoft -Recurse -Force

Start-Process -NoNewWindow -FilePath $env:USERPROFILE\scoop\apps\powertoys\current\PowerToys.exe