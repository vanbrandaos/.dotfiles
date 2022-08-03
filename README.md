# New garuda machine config

1. Full system update 
2. Install packages 
```bash
    sudo ./scripts/install-apps.sh && ./scripts/install-aur.sh
    #./scripts/install-utils.sh 
```
*	With WSL:

	```bash
    sudo pacman -S git
	./scripts/wsl/install-apps-wsl.sh && ./scripts/install-yay.sh
	```	
3. Create (or copy) a SSH key, upload it do github and test it.
```bash
    ./scripts/create-ssh-keys.sh #./scripts/wsl/copy-ssh-from-win.sh
    ssh -T git@github.com
```
4. Install vscode extensions
```bash
    ./scripts/install-extensions.sh (or vscode/wsl/instal-wsl-extensions.sh)
    ./scripts/install-java-extensions.sh
```
*	With WSL:

	```bash
	./scripts/wsl/install-extensions-wsl.sh
	```	
5. Stow files and create dev folders
```bash
./scripts/finish-setup.sh 
```
6. Setup SOMA environment
```bash
./scripts/create-soma-workspace.sh [cepel-user]
./scripts/create-soma-home.sh
```
6. Download eclipse and extract to ~/dev/applications/eclipse
*Use .scripts/fix-trackpad.sh (only needed with multi-touchs while libinput is sucking...)*        
