. $PSScriptRoot\utils.ps1

Install-Winget-App REALiX.HWiNFO
Install-Winget-App CPUID.HWMonitor
Install-Winget-App CPUID.CPU-Z
Install-Winget-App CrystalDewWorld.CrystalDiskInfo
Install-Winget-App CrystalDewWorld.CrystalDiskMark
Install-Winget-App Wagnardsoft.DisplayDriverUninstaller
Install-Winget-App GlennDelahoy.SnappyDriverInstallerOrigin

Copy-Item $PSScriptRoot\DiskInfo\DiskInfo.ini `
    -Destination $env:APPDATA\CrystalDiskInfo\DiskInfo.ini `
    -Force

Copy-Item $PSScriptRoot\DiskMark\DiskMark64.ini `
    -Destination $env:APPDATA\CrystalDiskMark\DiskMark64.ini `
    -Force
