scripts/make-dirs.sh

echo "Stowing config files..."

cd stow
stow -vt ~ *

scripts/fix-remote.sh