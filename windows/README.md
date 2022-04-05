# New Windows machine

1. Install Chocolatey (run powershell as administrator) 
```bash
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
*See https://chocolatey.org/install

Before use Scripts PowerShell: PowerShell works with a scripts Execution Policy. By default this value is Restricted. You need set privileges "Bypass" (Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope currentUser) to exec PowerShell scripts or use a -executionpolicy command.

2. Install git and update $PATH (or 'choco install git' and update environment variables)
```bash
    if (!(Test-Path -Path "C:\Program Files\Git\bin")) {
    echo "Installing git"
    choco install git
    echo "git installed."
    echo "Updating PATH with C:\Program Files\Git\bin..."
    $PathTemp = [Environment]::GetEnvironmentVariable('Path', 'User') + ';'
    $PathTemp += 'C:\Program Files\Git\bin'
    [Environment]::SetEnvironmentVariable('Path', $PathTemp, 'User')
    echo "done!"
    } else {
    echo "git is already installed."
    }     
```

3. Ready to use git clone! 
```bash
    cd ~
    git clone https://github.com/vanbrandaos/.dotfiles.git
```

4. Install packages:
```bash
    powershell -executionpolicy bypass -File .\install-chocolatey-packages.ps1   
```

5. Use choco like pacman! (choco install program | choco remove program | choco search program)

# Setup Windows Terminal

1. Install Windows Terminal (option 6) with PowerShell as administrator:
```bash
    cd windows/chocolatey
    powershell -executionpolicy bypass -File .\install-chocolatey-packages.ps1   
```

2. Import your Windows Terminal Settings and install nerd-fonts
```bash
    cd windows/terminal
    powershell -executionpolicy bypass -File ./setup-windows-terminal.ps1
```


# Setup WSL2 (PowerShell ADM on Windows Terminal):

*You must be running Windows 10 version 2004 and higher (Build 19041 and higher) or Windows 11:
```bash
    wsl --install
```
OR

*If you just prefer not to use the install command and would like step-by-step

1. Install packages-dev (or only Windows Terminal)
2. Enable WSL
```bash
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```
3. Enable Virtual Machine
```
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```
4. Restart Windows (hehe)
5. Download and install the linux kernel: https://docs.microsoft.com/en-us/windows/wsl/wsl2-kernel
6. Set WSL2 as default version
```
    wsl --set-default-version 2
```


*Copy .wslconfig file
```bash
    Copy-Item "C:\Users\$env:UserName\.dotfiles\windows\wsl\.wslconfig" -Destination "C:\Users\$env:UserName\"
```

# Installing Arch:

1. Download and install
```bash
    cd windows/wsl
    powershell -executionpolicy bypass -File ./install-arch.ps1    
```
2. Setup ArchWSL for user and keyrings using https://wsldl-pg.github.io/ArchW-docs/How-to-Setup/ 

# Known issues in WSL:

- Init system: WSL does not have a init system. For Docker, you can use daemons like 'sudo dockerd' or install a alternative systemd (see https://github.com/arkane-systems/genie). If you're using W11, see propertie "boot" in wsl.conf file.

```bash
[boot]
command = sudo dockerd start

```
wsl.conf beloings under the path /etc/wsl.conf. If the file not there, you can create it yourself. WSL detect the existence of the file and will read its contents. All distributions use this file independently.

- IP address on WSL2 machine cannot be made static.
```bash
    [network]
    hostName = hostName < transform to localhost
    generateHosts = true
    generateResolvConf = true
```
Please note that it is observed that changes may not take effect unless you restart the lxssManager service on Windows, or terminate and relaunch the distro.

If localhost is not approved, try alternativas with DNS changes (https://github.com/shayne/go-wsl2-host). My alternative is 'update-hosts.sh'. This script replaces the old ip with the new address.

```bash
    cd windows/wsl
    ./update-hosts.sh
```
For convenience, while on W10, I created an alias in fish called 'wsl-update' that did this job (and started docker). If you are on W11, add this shell in the startup properties and avoid calling it every time when booting (directly or indirectly)

- Launch GUI applications: Only works on W11, if you're W10, try XServer solutions. GUI is not needed for me since i replaced Eclipse with VSCode (with Remote WSL).
  

# Setup SOMA:

Basically, few things will change. 

1. Install git
```
    sudo pacman -S git
```
2. Clone dotfiles

*Differences:

On step 2, replace all installations for:
```
    cd windows/wsl/packages
    ./install-apps.sh
    sudo usermod -aG docker $USER
```

On step 6, use install-wsl-extensions shell from /windows/wsl. If convenient, install java extensions.
```
    cd vscode
    ./install-java-extensions.sh
    cd windows/wsl/vscode
    ./install-wsl-extensions.sh
```

On step 7, is not necessary download eclipse if you`re not in W11 or dont want use WSLg. My suggestion is use vscode on WSL (with Remote WSL extension) for Java and JavaScript

* Needed install find-the-command package and set fish as default shell.
```bash
    cd windows/wsl
    ./setup-fish.sh
```

3. Setup SOMA as previous tutorial


