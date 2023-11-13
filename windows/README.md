# Squeaky's Windows setup

To skip Microsoft account linking on a new Windows installation follow [these instructions](https://www.tomshardware.com/how-to/install-windows-11-without-microsoft-account):

1. When presented with the Welcome screen hit Shift + F10. Cmd appears. Type `oobe\bypassnro` and Enter. This disables the internet connection requirement.
2. The computer will reboot and return you to Welcome screen.
3. Hit Shift + F10. Cmd appears. Type `ipconfig /release` and Enter. This disables internet.
4. Click **I don't have Internet** to continue.

After user is setup drop to Powershell and run:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

irm https://raw.githubusercontent.com/squeaky-pl/dotfiles/master/windows/setup-self.ps1 | iex
```

Start Windows Update in parallel by hitting Windows + R and typing `ms-settings:windowsupdate-action` and Enter.

Then most likely you want to

```powershell
windows\setup-keepassxc.ps1
windows\setup-box.ps1
windows\setup-git.ps1
```

## Reestablishing Start menu shortcuts

Windows tends to remove Start items on updates. If that happans Scoop shortcuts can be restablished by running
`scoop reset *`.

## Creating new Local administrator accounts

Run Powershell as Administrator and execute:

```powershell
import-module microsoft.powershell.localaccounts -UseWindowsPowerShell
New-LocalUser <username>
Add-LocalGroupMember -Group "Administrators" -Member <username>
```

The first line seems to be only needed in PowerShell 7 due to [this bug](https://github.com/PowerShell/PowerShell/issues/18624).