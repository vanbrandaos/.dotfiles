scripts/make-dirs.sh

echo "Stowing config files..."

cd stow
stow -vt ~ *

cd "${0%/*}"/..

scripts/fix-remote.sh