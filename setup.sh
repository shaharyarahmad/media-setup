export DEBIAN_FRONTEND=noninteractive
export LC_ALL=C.UTF-8

#Update 
apt-get update -y && apt-get upgrade -y

#Docker
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install -y docker-ce
sudo usermod -a -G docker $USER

#Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#Docker Containers
sudo docker-compose up -d

#Clean
apt-get autoremove -y

#Move Config for Jackett
sudo rm -f /config/jackett/Jackett/ServerConfig.json 
sudo rm -f /config/jackett/Jackett/Indexers/
sudo mv /home/vagrant/config/jackett/Jackett/ServerConfig.json /config/jackett/Jackett/ServerConfig.json 
sudo mkdir /config/jackett/Jackett/Indexers/
sudo mv /home/vagrant/config/jackett/Jackett/Indexers/* /config/jackett/Jackett/Indexers/

#Move Config for Radarr
sudo rm -f /config/radarr/config.xml 
sudo rm -f /config/radarr/nzbdrone.db
sudo rm -f /config/radarr/nzbdrone.db-shm
sudo rm -f /config/radarr/nzbdrone.db-wal
sudo rm -f /config/radarr/nzbdrone.pid
sudo mv /home/vagrant/config/radarr/config.xml /config/radarr/config.xml 
sudo mv /home/vagrant/config/radarr/nzbdrone.db /config/radarr/nzbdrone.db
sudo mv /home/vagrant/config/radarr/nzbdrone.db-shm /config/radarr/nzbdrone.db-shm
sudo mv /home/vagrant/config/radarr/nzbdrone.db-wal /config/radarr/nzbdrone.db-wal
sudo mv /home/vagrant/config/radarr/nzbdrone.pid /config/radarr/nzbdrone.pid

#Move Config for Sonarr
sudo rm -f /config/sonarr/config.xml 
sudo rm -f /config/sonarr/nzbdrone.db
sudo rm -f /config/sonarr/nzbdrone.db-shm
sudo rm -f /config/sonarr/nzbdrone.db-wal
sudo rm -f /config/sonarr/nzbdrone.pid
sudo mv /home/vagrant/config/sonarr/config.xml /config/sonarr/config.xml 
sudo mv /home/vagrant/config/sonarr/nzbdrone.db /config/sonarr/nzbdrone.db
sudo mv /home/vagrant/config/sonarr/nzbdrone.db-shm /config/sonarr/nzbdrone.db-shm
sudo mv /home/vagrant/config/sonarr/nzbdrone.db-wal /config/sonarr/nzbdrone.db-wal
sudo mv /home/vagrant/config/sonarr/nzbdrone.pid /config/sonarr/nzbdrone.pid

#Move Config for Transmission
sudo rm -f /config/transmission/settings.json
sudo mv /home/vagrant/config/transmission/settings.json /config/transmission/settings.json
docker exec -it transmission pkill -HUP transmission-da

#Clean Config Files
rm -rf /home/vagrant/config
