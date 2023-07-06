# New garuda machine config

1. Full system update 

    ## Linux:

    2. Install packages 
        ```bash
        sudo ./scripts/install-apps.sh
        ./scripts/install-aur.sh
        #./scripts/install-utils.sh 
        ```

    3. Create (or copy) a SSH key, upload it do github and test it.
        ```bash
        ./scripts/create-ssh-keys.sh [email-github]
        ssh -T git@github.com
        ```
    4. Override .gitconfig (are u lazy?):
        ```bash
        ./scripts/setup-custom-git-config.sh [email-github] [full-name]
        ssh -T git@github.com
        ```
    5. Install vscode extensions
        ```bash
        ./scripts/install-code-extensions.sh
        ```

    6. Stow .config files
        ```bash
        ./scripts/link-dotfiles.sh 
        ```
    7. Fix remote
        ```bash
        ./scripts/fix-remote.sh [ssh-dotfiles-url]
        ```
    8. Setup DEV environment
        ```bash
        ./scripts/create-dev-workspace.sh [cepel-user]
        ```
        **Use .scripts/fix-trackpad.sh (only needed with multi-touchs while libinput is sucking...)*       


    ## WSL:
    
    2.  Install Git:
        ```bash
        sudo pacman -S git
        ```

    3. Install packages 
        ```bash        
        ./scripts/wsl/install-apps.sh 
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
        ./scripts/wsl/install-code-extensions.sh
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


 
 

