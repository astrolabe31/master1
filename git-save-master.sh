#!/bin/bash
echo "####################### backup master ###################################"
cd ./etcd/backup && ./backup.sh && tar czvf snapshot.db.tar.gz snapshot.db &&  rm snapshot.db
# ./etcd/backup/backup.sh
echo "####################### COMPRESS data ###################################"
# tar czvf ./etcd/backup/snapshot.db.tar.gz ./etcd/backup/snapshot.db
# rm ./etcd/backup/snapshot.db
echo "####################### PULL PUSH ###################################"
# git init
echo "pwd : " $(pwd)
git gc --aggressive --prune=now
sleep 5
git add --all
git commit -m "update"  


# git config --global http.sslVerify "false"

# git clone https://renaud:glpat-918Lzrfc_phAFaBdewt7@gitlab.astrolabe31.fr/k8s/dashboard.git

git pull https://github.com/astrolabe31/master-node2.git main

git push https://github.com/astrolabe31/master-node2.git main

echo "####################### END ###################################"
