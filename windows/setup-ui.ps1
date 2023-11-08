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

## Set scaling
# https://winaero.com/how-to-change-dpi-display-scaling-in-windows-11/
# 96 = default 100%
# 120 = medium 125%
# 144 = larger 150%
# 192 = extra-large 200%
# 240 = custom 250%
# 288 = custom 300%
# 384 = custom 400%
# 480 = custom 500%
New-ItemProperty -Force -Path "HKCU:\Control Panel\Desktop" `
    -Name "LogPixels" `
    -PropertyType Dword `
    -Value 192 | Out-Null

New-ItemProperty -Force -Path "HKCU:\Control Panel\Desktop" `
    -Name "Win8DpiScaling" `
    -PropertyType Dword `
    -Value 1 | Out-Null

## Language Bar
# https://www.elevenforum.com/t/show-language-bar-on-desktop-or-taskbar-in-windows-11.4107/
Set-WinLanguageBarOption -UseLegacyLanguageBar
Set-WinLanguageBarOption

# https://stackoverflow.com/questions/66267355/add-international-english-keyboard-in-windows-10-through-the-powershell
Set-WinUserLanguageList en-US,pl-PL -Force
# Add US international layout
$languageList = Get-WinUserLanguageList
$languageList[0].InputMethodTips.Add('0409:00020409')
Set-WinUserLanguageList -LanguageList $languageList -Force

## Explorer
# https://superuser.com/questions/1151844/how-to-toggle-show-hide-hidden-files-in-windows-through-command-line
New-ItemProperty -Force "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
    -Name "Hidden" `
    -PropertyType Dword `
    -Value 1 | Out-Null

# https://winbuzzer.com/2021/08/27/how-to-show-file-extensions-in-windows-10-3-methods-xcxwbt/
New-ItemProperty -Force "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
    -Name "HideFileExt" `
    -PropertyType Dword `
    -Value 0 | Out-Null

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

# https://www.majorgeeks.com/content/page/how_to_disable_the_windows_10_welcome_experience_page.html
New-ItemProperty -Force -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" `
    -Name "SubscribedContent-310093Enabled" `
    -PropertyType Dword `
    -Value 0 | Out-Null

# https://www.minitool.com/news/show-hide-task-view-button-windows-11.html
New-Item -Force -Path  "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
New-ItemProperty -Force -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
    -Name "ShowTaskViewButton" `
    -PropertyType Dword `
    -Value 0 | Out-Null