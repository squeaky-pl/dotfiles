. $PSScriptRoot\utils.ps1

scoop bucket add extras
scoop install dbeaver
scoop install vscode
scoop install zettlr

Copy-Item $PSScriptRoot\Code\User -Destination "$(Get-Scoop-App-Current-Folder vscode)\data\user-data" -Recurse -Force

$python_versions = @(
    "3.8",
    "3.10",
    "3.12"
)

foreach ($python_version in $python_versions) {
    winget install --accept-source-agreements --accept-package-agreements --disable-interactivity -e --id Python.Python.$python_version
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
    -FilePath "$(Get-Scoop-App-Current-Folder vscode)\bin\code.cmd" `
    -ArgumentList "--install-extension",$extension
}