#!/usr/bin/env bash


echo "Bulk REPO"
for d in */; do
    # Will print */ if no directories are available
    echo "$d"
    REPONAME="${d%?}"

    cd $d
    git init
    git add .
    git commit -m :zap:
    gh repo create "bisofts/$REPONAME" -y --public --homepage "https://ui.bisofts.com/$REPONAME"
    LINKREPO="https://github.com/bisofts/$REPONAME"
    git remote add origin $LINKREPO
    git push origin master
    cd ..
    #rm -rf $d
done

echo "Clear done";