. $PSScriptRoot\utils.ps1

scoop bucket add extras
scoop install dbeaver
scoop install vscode
scoop install zettlr

Copy-Item $PSScriptRoot\Code\User -Destination "$(Get-Scoop-App-Current-Folder vscode)\data\user-data" -Recurse -Force

$extensions = @(
    "ms-vscode.powershell",
    "ms-vscode-remote.remote-wsl",
    "ms-vscode-remote.remote-ssh",
    "mark-wiemer.vscode-autohotkey-plus-plus",
    "vscode-icons-team.vscode-icons"
)
foreach ($extension in $extensions) {
    Start-Process -NoNewWindow -Wait `
    -FilePath "$(Get-Scoop-App-Current-Folder vscode)\bin\code.cmd" `
    -ArgumentList "--install-extension",$extension
}