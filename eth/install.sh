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
sudo service docker start
sudo docker-compose -f docker-compose-ntity.yml start
