# New garuda machine config

1. Full system update 
2. Clone and setup-all.sh your privates dotfiles
3. Install packages from arch repos. 
```bash
    sudo pacman -S git (only needed with WSL)
    cd packages (or cd packages/wsl with WSL)
    sudo ./install-apps.sh 
    ./install-aur.sh (skip with WSL)
    ./fix-trackpad.sh (only needed with multi-touchs while libinput is sucking...)        
```
*Install utilities from /utils directory (skip if you're with WSL)

4. Create dev folders and download misc software
```bash
    cd scripts
    ./make-dirs.sh
    ./setup-dev.sh
    ./install-yay.sh
```
5. Create a new SSH key, upload it do github and test it.
```bash
    scripts/create-ssh-keys.sh (might have to fix ~/.ssh/config)
    ssh -T git@github.com
```
6. Link configuration files
```bash
    cd stow
    (probably needs a script to remove existing stuff)
    stow -vt ~ *
```
7. Install vscode extensions
```bash
    vscode/install-extensions.sh (or vscode/wsl/instal-wsl-extensions.sh)
    vscode/install-java-extensions.sh
```
8. Download eclipse and extract to ~/dev/applications/eclipse
9. Clone soma projects on ~/dev/soma and fish setup.
