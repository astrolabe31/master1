#!/bin/bash
echo "####################### backup master ###################################"
cd ./etcd/backup && ./backup.sh && tar czvf snapshot.db.tar.gz snapshot.db &&  rm snapshot.db
echo "####################### COMPRESS data ###################################"
echo "####################### PULL PUSH ###################################"

echo "pwd : " $(pwd)
git gc --aggressive --prune=now
sleep 5
git add --all
git commit -m "update"  

# git config --global http.sslVerify "false"

# git clone https://renaud:glpat-918Lzrfc_phAFaBdewt7@gitlab.astrolabe31.fr/k8s/dashboard.git

git pull https://github.com/astrolabe31/master-node2.git main

git push https://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@github.com/astrolabe31/master-node2.git

echo "####################### END ###################################"
