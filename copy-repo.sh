#cleanup .git in bootstrap "repo" if it exists
if [ -d "bootstrap/.git" ]; then
    rm -rf bootstrap/.git;
fi

rootdir=$(pwd)
cd bootstrap
git init
git add .
git commit -m "initial commit"