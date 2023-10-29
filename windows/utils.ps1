function New-Shortcut
{
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $Source,
        [Parameter(Mandatory=$true)]
        [string] $Destination
        
    )

    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($Destination)
    $Shortcut.TargetPath = $Source
    $Shortcut.Save()
}

function New-Autostart-Item
{
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $Source
    )

    $baseName = (Get-Item $Source).BaseName

    New-Shortcut $Source -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\${baseName}.lnk"
}

function Get-Scoop-App-Location
{
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $Application
    )

    (scoop which $Application).Replace('~', $env:USERPROFILE)
}

function Start-Scoop-App
{
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $Application
    )

    Start-Process -NoNewWindow -FilePath (Get-Scoop-App-Location $Application)
}

function Get-Scoop-App-Current-Folder
{
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $Application
    )

    scoop prefix $Application
}

function New-Quick-Access
{
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $Source
    )

    $shellApplication = New-Object -com Shell.Application
    $shellApplication.Namespace($Source).Self.InvokeVerb("pintohome")
}