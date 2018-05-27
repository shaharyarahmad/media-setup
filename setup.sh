export DEBIAN_FRONTEND=noninteractive
export LC_ALL=C.UTF-8

#Update 
apt-get update && apt-get upgrade

#Apache
apt-get install -y apache2

echo "ServerName localhost" | tee -a /etc/apache2/apache2.conf

a2enmod rewrite
service apache2 restart

#PHP
apt-add-repository ppa:ondrej/php
apt-get update
apt-get install -y php7.1
apt-get install -y php-gd
apt-get install -y php-curl
apt-get install -y php-mcrypt
apt-get install -y php-mbstring
apt-get install -y php-xml
apt-get install -y php-zip

#MySQL
apt-get install -y debconf-utils
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get install mysql-server php7.1-mysql mysql-common
mysql -u root -proot -e "CREATE USER 'sandbox'@'%' IDENTIFIED BY 'sandbox';"
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'sandbox'@'%' WITH GRANT OPTION;"
mysql -u root -proot -e "FLUSH PRIVILEGES;"
service apache2 restart
service mysql restart

#Utilities
apt-get install -y git
apt-get install -y vim
apt-get install -y zip
apt-get install -y unzip
