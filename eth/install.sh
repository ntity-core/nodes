# Ntity Installation Script

echo "Download necessary packages"
sudo apt-get install docker docker-compose git	

echo "Create Data folder"
sudo mkdir -p /data/ethereum/ntity-01

cd
git clone https://github.com/ntity-core/nodes

cd /data/ethereum/ntity-01/
cp /home/docker/nodes/eth/genesis-poa.json .
cp /home/docker/nodes/eth/static-nodes.json .

sudo groupadd docker
sudo usermod -aG docker $(whoami)
sudo service docker start
sudo docker run -it -v "/data/ethereum/ntity-01:/ethereum" ntity/sidechain geth --datadir=/ethereum --nousb account new