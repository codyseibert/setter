if [ -z "$1" ]
    then
    echo "Please provide the name of the tar as argument #1"
    exit 1
fi

cd "/home/setter/app"
cp "/home/setter/builds/$1" "."
tar -xvf "$1" "."
rm "$1"
