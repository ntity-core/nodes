# Ntity Installation Script

echo "Download necessary packages"
sudo apt-get install docker docker-compose git	

echo "Create Data folder"
sudo mkdir -p /data/blockchain/ntity-01

cd
git clone https://github.com/ntity-core/nodes

sudo cp nodes/eth/ntity.genesis.json /data/blockchain/ntity-01/
sudo cp nodes/eth/static-nodes.json /data/blockchain/ntity-01/

sudo groupadd docker
sudo usermod -aG docker $(whoami)
sudo service docker start

# Create a new account on Ntity Blockchain
sudo docker run -it -v "/data/blockchain/ntity-01:/blockchain" ntity/sidechain geth --datadir=/blockchain --nousb account new
# FUTUR sudo docker run -it -v "/data/blockchain/ntity-01:/blockchain" ntity/blockchain geth --datadir=/blockchain --nousb account new

# Log into docker
sudo docker run -it -v "/data/blockchain/ntity-01:/blockchain" ntity/sidechain /bin/bash

# Init - first time only
sudo docker run -it -v '/data/blockchain/ntity-01:/blockchain' ntity/sidechain geth --datadir=/blockchain --nousb init /blockchain/ntity.genesis.json

# First Blockchain start
sudo docker run -it -v '/data/blockchain/ntity-01:/blockchain' ntity/sidechain geth --datadir=/blockchain console

