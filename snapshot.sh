#!/bin/sh

sudo apt-get update
sudo apt-get install cockpit -y
sudo apt-get install cockpit-docker -y
sudo apt-get install docker-compose -y
sudo systemctl start cockpit
sudo systemctl enable cockpit

PRODUCER_ENABLE=true
PRODUCER_NAME=你的账号
PUBLIC_KEY=你的公钥
PRIVATE_KEY=你的私钥

cd ~
git clone https://github.com/fibos123/fibos-node.git
cd fibos-node

echo PRODUCER_ENABLE=$PRODUCER_ENABLE >> .env
echo PRODUCER_NAME=$PRODUCER_NAME >> .env
echo PUBLIC_KEY=$PUBLIC_KEY >> .env
echo PRIVATE_KEY=$PRIVATE_KEY >> .env

sudo docker-compose up -d
