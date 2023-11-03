if(Get-Command starship -errorAction SilentlyContinue)
{
    Invoke-Expression (&starship init powershell)
}

New-Alias -Name vim -Value helix