# New Windows machine

1. Install Chocolatey (run powershell as administrator) https://chocolatey.org/install
2. Install git from Chocolatey 
```bash
    choco install git    
```
3. Install packages (after clone this project!):
```bash
    powershell -executionpolicy bypass -File .\install-chocolatey-packages.ps1   
```
4. Import your Windows Terminal Settings and install nerd-fonts (with GitBash)
```bash
    cd windows/terminal
    ./setup-windows-terminal.sh
```
5. Use choco like pacman! 


# Setup WSL2 (use Windows Terminal):

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

# Installing Arch:

1. Download from https://github.com/yuk7/ArchWSL and save 'C:\wsl\Arch'.
2. Navigate and run the installer
3. Run Arch executable (sucess!)
4. Setup ArchWSL for user and keyrings using https://wsldl-pg.github.io/ArchW-docs/How-to-Setup/ 

# Known issues in WSL:

- Init system:
* The wsl does not have a init system. For Docker, you can use daemons like 'sudo dockerd' or install a alternative systemd (see https://github.com/arkane-systems/genie). If you're using W11, see propertie "boot" in wsl.conf file.

```bash

```

- IP address of a WSL2 machine cannot be made static:
* WSL allows you to set launch configurations on all distribution packages independently using a file located at /etc/wsl.conf. You need set network properties:
```bash
    [network]
    hostName = hostName < localhost
    generateHosts = true
    generateResolvConf = true
```
Please note that it is observed that changes may not take effect unless you restart the lxssManager service on Windows, or terminate and relaunch the distro.


* My alternative is 'update-hosts.sh'. This script replaces the old ip with the new address. 
```bash
    cd windows/wsl
    ./update-hosts.sh
```
For convenience, while on W10, I created an alias in fish called 'wsl-update' that did this job. If you are on W11, add this shell in the startup properties and avoid calling it every time when booting (directly or indirectly)


# Setup SOMA:

Basically, few things will change. 

*Differences:

* Use install-apps shell from /windows/packages
```
    cd .dotfiles/windows/wsl/packages
    ./install-apps.sh
```

1. Install git
```
    sudo pacman -S git
```
2. Clone dotfiles
3. Setup SOMA as previous tutorial

* Needed install find-the-command package and set fish as default shell.
```bash
    cd .dotfiles/windows/wsl
    ./setup-fish.sh
```

