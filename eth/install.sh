# Ntity Installation Script

echo "Download necessary packages"
sudo apt-get install docker docker-compose git	

echo "Create Data folder"
sudo mkdir -p /data/blockchain/ntity-01

cd
git clone https://github.com/ntity-core/nodes

cp nodes/eth/genesis-poa.json /data/ethereum/ntity-01/
cp nodes/eth/static-nodes.json /data/ethereum/ntity-01/

sudo groupadd docker
sudo usermod -aG docker $(whoami)
sudo service docker start

# Create a new account on Ntity Blockchain
sudo docker run -it -v "/data/blockchain/ntity-01:/blockchain" ntity/sidechain geth --datadir=/ethereum --nousb account new
# FUTUR sudo docker run -it -v "/data/blockchain/ntity-01:/blockchain" ntity/blockchain geth --datadir=/ethereum --nousb account new