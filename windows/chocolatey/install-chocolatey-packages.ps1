#Requires -RunAsAdministrator

Set-ExecutionPolicy Bypass -Scope Process -Force
#powershell -executionpolicy bypass -File .\install-chocolatey-packages.ps1

# for each package in the list run install

echo "Choose number package:"
echo "1 - Package Utils"
echo "2 - Package WSL"
echo "3 - Package Dev"

$package = Read-Host ''Choose package number''
$packageName = ""

if (1 -eq $package){
  echo "Installing Utils"
  $packageName = "./packages-utils.txt"
} elseif (2 -eq $package){
  echo "Installing WSL"
  $packageName = "./packages-wsl.txt"
} elseif (3 -eq $package){
  echo "Installing Dev"
  $packageName = "./packages-dev.txt"
} else {
  echo "invalid option."
  powershell -executionpolicy bypass -File .\install-chocolatey-packages.ps1
}

Get-Content $packageName | ForEach-Object{($_ -split "\r\n")[0]} | ForEach-Object{choco install -y $_}