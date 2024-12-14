if(Get-Command starship -errorAction SilentlyContinue)
{
    Invoke-Expression (&starship init powershell)
}

New-Alias -Name vim -Value helix

function http {
    & "$env:USERPROFILE\.local\bin\uvx" --from httpie http $args
}
