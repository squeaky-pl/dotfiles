scoop bucket add extras
scoop install hwinfo
scoop install hwmonitor
scoop install cpu-z
scoop install crystaldiskinfo
scoop install crystaldiskmark

Copy-Item $PSScriptRoot\HWMonitor\hwmonitorw.ini `
    -Destination $env:USERPROFILE\scoop\apps\hwmonitor\current\hwmonitorw.ini `
    -Force

Copy-Item $PSScriptRoot\DiskInfo\DiskInfo.ini `
    -Destination $env:USERPROFILE\scoop\apps\crystaldiskinfo\current\DiskInfo.ini `
    -Force

Copy-Item $PSScriptRoot\DiskMark\DiskMark64.ini `
    -Destination $env:USERPROFILE\scoop\apps\crystaldiskmark\current\DiskMark64.ini `
    -Force