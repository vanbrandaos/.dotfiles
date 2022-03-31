# New Windows machine

1. Install Chocolatey (run powershell as administrator) https://chocolatey.org/install
2. Install git from Chocolatey
```bash
    choco install git    
```
3. Install packages:
```bash
    powershell -executionpolicy bypass -File .\install-chocolatey-packages.ps1   
```
4. Import your Windows Terminal Settings and install nerd-fonts
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
4. Download and install the linux kernel: https://docs.microsoft.com/en-us/windows/wsl/wsl2-kernel
5. Set WSL2 as default version
```
    wsl --set-default-version 2
```

# Installing Arch:

1. Download from https://github.com/yuk7/ArchWSL and save 'C:\wsl\Arch'.
2. Navigate and run the installer
3. Run Arch executable (sucess!)
4. Setup ArchWSL using https://wsldl-pg.github.io/ArchW-docs/How-to-Setup/ 


# Setup SOMA:

Basically, few things will change. 

*Differences:

* Use install-apps shell from /windows/packages
```
    cd .dotfiles/windows/wsl/packages
    ./install-apps.sh
```

* The wsl does not have a boot system. For Docker, you can use daemons like 'sudo dockerd' or install a alternative systemd (see https://github.com/arkane-systems/genie).  

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

