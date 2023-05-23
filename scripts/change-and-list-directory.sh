dir="$(pwd)"

if [ -n "$1" ]; then 
    dir="$1"
else
    echo -e "Using "$dir""    
fi

cd "$dir"
ls "$dir"