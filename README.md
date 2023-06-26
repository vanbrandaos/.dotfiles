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
        ./scripts/create-ssh-keys.sh
        ssh -T git@github.com
        ```
    4. Install vscode extensions
        ```bash
        ./scripts/install-code-extensions.sh
        ```

    5. Stow .config files
        ```bash
        ./scripts/link-dotfiles.sh 
        ```
    6. Fix remote
        ```bash
        ./scripts/fix-remote.sh 
        ```
    7. Setup DEV environment
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
        ./scripts/create-ssh-keys.sh 
        #./scripts/wsl/copy-ssh-from-win.sh
        ssh -T git@github.com
        ```

    5. Install vscode extensions
        ```bash
        ./scripts/wsl/install-code-extensions.sh
        ```	
    6. Setup Fish as shell (and find-the-command):
        ```bash
        ./scripts/wsl/setup-fish.sh
        ```
    7. Stow .config files
        ```bash
        ./scripts/link-dotfiles.sh 
        ```    
    8. Fix remote
        ```bash
        ./scripts/fix-remote.sh 
        ```
    9. Setup DEV environment
        ```bash
        ./scripts/create-dev-workspace.sh [cepel-user]
        ```        


 
 

