if(Get-Command starship -errorAction SilentlyContinue)
{
    Invoke-Expression (&starship init powershell)
}

New-Alias -Name vim -Value helix

function http {
    & "$env:USERPROFILE\.local\bin\uvx" --from httpie http $args
}

function pre-commit {
    & "$env:USERPROFILE\.local\bin\uvx" pre-commit $args
}
