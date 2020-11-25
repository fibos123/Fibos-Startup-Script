#!/bin/sh

sudo apt-get update
sudo apt-get install cockpit -y
sudo apt-get install cockpit-docker -y
sudo apt-get install cockpit-pcp -y
sudo apt-get install docker-compose -y
sudo systemctl start cockpit
sudo systemctl enable cockpit

cd ~
git clone https://github.com/fibos123/fibos-node.git
cd ./fibos-node

sed -i 's/your-account-name/这里替换成你的账号/' ./_config.js
sed -i 's/your-public-key/这里替换成你的公钥/' ./_config.js
sed -i 's/your-private-key/这里替换成你的私钥/' ./_config.js
sed -i 's/"producer-enable": false/"producer-enable": true/' ./_config.js

url=$(curl api.fibos123.com/last_snapshot)
mkdir /snapshots
cd /snapshots
wget $url
cd ~/fibos-node
sudo docker-compose up -d
