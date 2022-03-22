#Requires -RunAsAdministrator

Set-ExecutionPolicy Bypass -Scope Process -Force
#to run in powershell: powershell -executionpolicy bypass -File .\install-chocolatey.ps1




# install chocolatey
if (!(Test-Path -Path "$env:ProgramData\Chocolatey")) {
  echo "Installing chocolatey"
  Invoke-Expression((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
  echo "Chocolatey installed."
} else {
echo "Chocolatey is already installed."
}
