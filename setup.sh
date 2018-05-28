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
rm -f /config/jackett/Jackett/ServerConfig.json 
rm -f /config/jackett/Jackett/Indexers/
mv ~/config/jackett/Jackett/ServerConfig.json /config/jackett/Jackett/ServerConfig.json 
mv ~/config/jackett/Jackett/Indexers/* /config/jackett/Jackett/Indexers/

#Move Config for Radarr
rm -f /config/radarr/config.xml 
rm -f /config/radarr/nzbdrone.db
rm -f /config/radarr/nzbdrone.db-shm
rm -f /config/radarr/nzbdrone.db-wal
rm -f /config/radarr/nzbdrone.pid
mv ~/config/radarr/config.xml /config/radarr/config.xml 
mv ~/config/radarr/nzbdrone.db /config/radarr/nzbdrone.db
mv ~/config/radarr/nzbdrone.db-shm /config/radarr/nzbdrone.db-shm
mv ~/config/radarr/nzbdrone.db-wal /config/radarr/nzbdrone.db-wal
mv ~/config/radarr/nzbdrone.pid /config/radarr/nzbdrone.pid

#Move Config for Sonarr
rm -f /config/sonarr/config.xml 
rm -f /config/sonarr/nzbdrone.db
rm -f /config/sonarr/nzbdrone.db-shm
rm -f /config/sonarr/nzbdrone.db-wal
rm -f /config/sonarr/nzbdrone.pid
mv ~/config/sonarr/config.xml /config/sonarr/config.xml 
mv ~/config/sonarr/nzbdrone.db /config/sonarr/nzbdrone.db
mv ~/config/sonarr/nzbdrone.db-shm /config/sonarr/nzbdrone.db-shm
mv ~/config/sonarr/nzbdrone.db-wal /config/sonarr/nzbdrone.db-wal
mv ~/config/sonarr/nzbdrone.pid /config/sonarr/nzbdrone.pid

#Move Config for Transmission
rm -f /config/transmission/settings.json
mv ~/config/transmission/settings.json /config/transmission/settings.json
docker restart transmission
