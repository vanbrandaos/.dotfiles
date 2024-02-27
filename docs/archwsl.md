# ArchWSL config

1. Full system update     
2.  Install Git:
    ```bash
    sudo pacman -S git
    ```
3. Install packages 
    ```bash        
    sudo ./scripts/wsl/install-apps.sh
    ./scripts/install-yay.sh        
    ```	
4. Create (or copy) a SSH key, upload it do github and test it.
    ```bash
    ./scripts/create-ssh-keys.sh {email-github}
    #./scripts/wsl/copy-ssh-from-win.sh
    ssh -T git@github.com
    ```
5. Override .gitconfig (are u lazy?):
    ```bash
    ./scripts/setup-custom-git-config.sh [email-github] [full-name]
    ssh -T git@github.com
    ```
6. Install vscode extensions
    ```bash
	./scripts/install-js-code-extensions.sh
    ./scripts/install-java-code-extensions.sh
    ```	
7. Setup Fish as shell (and find-the-command):
    ```bash
    ./scripts/wsl/setup-fish.sh
    #restart WTerminal
    ```
8. Stow .config files
    ```bash
    ./scripts/link-dotfiles.sh 
    ```    
9. Fix remote
    ```bash
    ./scripts/fix-remote.sh [ssh-dotfiles-url]
    ```
10. Setup DEV environment
    ```bash
    ./scripts/wsl/create-dev-workspace.sh [cepel-user]
    ```        
