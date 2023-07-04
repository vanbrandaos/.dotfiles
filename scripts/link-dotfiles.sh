CRT_DIR=$(pwd)
scripts/make-dirs.sh

echo "Stowing config files..."

cd stow
#stow -vt ~ *
stow --target="$HOME" --dir="$HOME/.dotfiles/stow/" --stow apps/
stow --target="$HOME" --dir="$HOME/.dotfiles/stow/" --stow fish/
stow --target="$HOME" --dir="$HOME/.dotfiles/stow/" --stow git/
stow --target="$HOME" --dir="$HOME/.dotfiles/stow/" --stow kitty/
stow --target="$HOME" --dir="$HOME/.dotfiles/stow/" --stow starship/
stow --target="$HOME" --dir="$HOME/.dotfiles/stow/" --stow vscode/

#cd "$CRT_DIR"
#cd "${0%/*}"/..