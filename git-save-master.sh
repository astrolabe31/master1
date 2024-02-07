#!/bin/bash
echo "####################### backup master ###################################"
cd ./etcd/backup && ./backup.sh && tar czvf snapshot.db.tar.gz snapshot.db &&  rm snapshot.db
echo "####################### COMPRESS data ###################################"
echo "####################### PULL PUSH ###################################"

git gc --aggressive --prune=now
git config --global push.default simple

sleep 5
git add --all
git commit -m "update"  

git pull https://github.com/astrolabe31/master-node2.git main

git push https://astrolabe31:xxx@github.com/astrolabe31/master-node2.git main

echo "####################### END ###################################"
