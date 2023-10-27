scoop bucket add extras
scoop install autohotkey

## Dark theme
New-ItemProperty -Force -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" `
    -Name "SystemUsesLightTheme" `
    -PropertyType Dword `
    -Value 0 | Out-Null

New-ItemProperty -Force -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" `
    -Name "AppsUseLightTheme" `
    -PropertyType Dword `
    -Value 0 | Out-Null

## Enable clipboard history
New-ItemProperty -Force -Path "HKCU:\Software\Microsoft\Clipboard" `
    -Name "EnableClipboardHistory" `
    -PropertyType Dword `
    -Value 1 | Out-Null

## Mouse cursor
# Note that it was close to impossible to set those values nicely using registry
# Also Settings app will install a nicer cursor theme
$cursor_theme = (Get-ItemProperty -Path "HKCU:\Control Panel\Cursors" `
    -Name "(Default)")."(default)"
$cursor_size = (Get-ItemProperty -Path "HKCU:\Control Panel\Cursors" `
    -Name "CursorBaseSize").CursorBaseSize

if ( $cursor_theme -eq "Windows Aero" -and $cursor_size -eq 32 ) {
    Start-Process -Wait `
        -FilePath (scoop which autohotkey).Replace('~', $env:USERPROFILE) `
        -ArgumentList $PSScriptRoot\cursor-theme.ahk | Out-Null
}

## Disable animations
# https://superuser.com/questions/1052763/windows-10-disable-animations-via-regedit-script
New-ItemProperty -Force -Path "HKCU:\Control Panel\Desktop\WindowMetrics" `
    -Name "MinAnimate" `
    -Value "0" | Out-Null

## Taskbar
# https://winbuzzer.com/2021/03/19/how-to-hide-or-unhide-the-taskbar-in-windows-10-auto-hide-xcxwbt/
& { $p = 'HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3'; $v = (Get-ItemProperty -Path $p).Settings; $v[8] = 3; &Set-ItemProperty -Path $p -Name Settings -Value $v; &Stop-Process -f -ProcessName explorer }

# https://www.tomshardware.com/how-to/disable-windows-web-search
New-Item -Force -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer"
New-ItemProperty -Force -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" `
    -Name "DisableSearchBoxSuggestions" `
    -PropertyType DWord `
    -Value 1 | Out-Null

# https://www.makeuseof.com/taskbar-hide-search-bar-windows-11/
New-ItemProperty -Force -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" `
    -Name "SearchboxTaskbarMode" `
    -PropertyType Dword `
    -Value 0 | Out-Null

# https://www.minitool.com/news/show-hide-task-view-button-windows-11.html
New-Item -Force -Path  "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
New-ItemProperty -Force -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
    -Name "ShowTaskViewButton" `
    -PropertyType Dword `
    -Value 0 | Out-Null