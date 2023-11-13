. $PSScriptRoot\utils.ps1

scoop bucket add extras
Install-Winget-App dbeaver.dbeaver
Install-Winget-App Zettlr.Zettlr
Install-Winget-App Microsoft.VisualStudioCode
scoop install helix


scoop bucket add nerd-fonts
scoop install cascadiacode-nf-mono

Copy-Item $PSScriptRoot\Zettlr -Destination $env:APPDATA -Recurse -Force

Copy-Item $PSScriptRoot\Code -Destination $env:APPDATA -Recurse -Force

$python_versions = @(
    "3.8",
    "3.10",
    "3.12"
)

foreach ($python_version in $python_versions) {
    Install-Winget-App Python.Python.$python_version
}

$extensions = @(
    "ms-vscode.powershell",
    "ms-vscode-remote.remote-wsl",
    "ms-vscode-remote.remote-ssh",
    "mark-wiemer.vscode-autohotkey-plus-plus",
    "vscode-icons-team.vscode-icons",
    "mkxml.vscode-filesize",
    "ms-python.python",
    "ms-python.black-formatter",
    "twixes.pypi-assistant"
)
foreach ($extension in $extensions) {
    Start-Process -NoNewWindow -Wait `
    -FilePath "$env:LOCALAPPDATA\Programs\Microsoft VS Code\bin\code.cmd" `
    -ArgumentList "--install-extension",$extension
}
