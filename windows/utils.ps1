function New-Shortcut
{
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $Source,
        [Parameter(Mandatory=$true)]
        [string] $Destination,
        [string] $Arguments
    )

    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($Destination)
    $Shortcut.TargetPath = $Source
    if($PSBoundParameters.ContainsKey('Arguments')) {
        $Shortcut.Arguments = $Arguments
    }

    $Shortcut.Save()
}

function New-Autostart-Item
{
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $Source,
        [string] $Arguments,
        [string] $Name
    )

    if(!$PSBoundParameters.ContainsKey('Name')) {
        $Name = (Get-Item $Source).BaseName
    }

    New-Shortcut $Source `
        -Arguments $Arguments `
        -Destination "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\${Name}.lnk"
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

function Remove-Taskbar-Pin
{
    param (
        [Parameter(Mandatory=$true, Position=0)]
        [string] $Application
    )
    ((New-Object -Com Shell.Application).NameSpace('shell:::{4234d49b-0245-4df3-b780-3893943456e1}').Items() | ?{$_.Name -eq $Application}).Verbs() | ?{$_.Name.replace('&','') -match 'Unpin from taskbar'} | %{$_.DoIt(); $exec = $true}
}