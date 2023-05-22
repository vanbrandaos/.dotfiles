CRT_DIR=$(pwd)
scripts/make-dirs.sh

echo "Stowing config files..."

cd stow
stow -vt ~ *

cd "$CRT_DIR"
#cd "${0%/*}"/..

scripts/fix-remote.sh