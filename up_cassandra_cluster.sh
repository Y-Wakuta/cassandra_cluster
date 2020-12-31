#!/bin/bash

set -e 
broadcast_addr=$(hostname  -I | awk -F" " '{print $1}')
seed_addr=$1

./install_docker.sh
cp base_docker-compose.yml docker-compose.yml

sed -i -e "s/BROADCAST_ADDRESS=badr/BROADCAST_ADDRESS=$broadcast_addr/g"  docker-compose.yml
sed -i -e "s/SEEDS=sadr/SEEDS=$seed_addr/g"  docker-compose.yml

docker-compose down
docker-compose build --no-cache
docker-compose up -d
