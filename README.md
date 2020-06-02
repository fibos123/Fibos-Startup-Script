# FIBOS Startup Script

## Server requirements

OS: Ubuntu 16.04 / 18.04 / 19.10

Disk: 80G

## Script

```
#!/bin/sh

sudo apt-get update && sudo apt-get install cockpit cockpit-docker docker-compose -y 
sudo systemctl start cockpit 
sudo systemctl enable cockpit 

cd ~
git clone https://github.com/fibos123/fibos-node.git
cd ./fibos-node

sed -i 's/your-account-name/这里替换成你的账号/' ./_config.js
sed -i 's/your-public-key/这里替换成你的公钥/' ./_config.js
sed -i 's/your-private-key/这里替换成你的私钥/' ./_config.js
sed -i 's/"producer-enable": false/"producer-enable": true/' ./_config.js

url=$(curl api.fibos123.com/last_ghost)
wget -O data.tar.gz $url 
tar -zxvSf data.tar.gz
rm data.tar.gz
sudo docker-compose up -d
```
