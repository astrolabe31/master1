#!/bin/bash
echo "####################### backup master ###################################"
cd ./etcd/backup && ./backup.sh && tar czvf snapshot.db.tar.gz snapshot.db &&  rm snapshot.db
echo "####################### COMPRESS data ###################################"
echo "####################### PULL PUSH ###################################"

git gc --aggressive --prune=now
git config --global push.default simple
git config --global user.email "renaud.gilbert@hotmail.fr"
git config --global user.name "astrolabe31"

sleep 5
git add --all
git commit -m "update"  

git pull https://astrolabe31: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@github.com/astrolabe31/master-node2.git main

git push https://astrolabe31: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@github.com/astrolabe31/master-node2.git main

echo "####################### END ###################################"
