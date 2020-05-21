# Ntity Installation Script

echo "Download necessary packages"
sudo apt-get install docker docker-compose git	
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

echo "Create Data folder"
sudo mkdir -p /data/blockchain/ntity-01

cd
git clone https://github.com/ntity-core/nodes
sudo cp nodes/eth/ntity.genesis.json /data/blockchain/ntity-01/
sudo cp nodes/eth/static-nodes.json /data/blockchain/ntity-01/

sudo groupadd docker
sudo systemctl start docker
sudo systemctl enable docker

sudo service docker start
sudo docker run -it ntity/blockchain /bin/bash
sudo docker-compose -f ~/nodes/eth/docker-compose-ntity.yml up
