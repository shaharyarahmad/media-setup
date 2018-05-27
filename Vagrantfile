# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.box = "ubuntu/trusty64"
	config.vm.network "public_network", bridge: 'en0: Wi-Fi (AirPort)', ip: "192.168.1.20"
	config.vm.network "forwarded_port", guest: 3306, host: 3306 
	config.vm.hostname = "Venus"
	config.vm.synced_folder "./public/", "/var/www/", :mount_options => ["dmode=777", "fmode=666"]
	
	config.vm.provider "virtualbox" do |vb|
		vb.name = "venus.live"
	end

    config.vm.provision "shell" do |s|
        s.path = "./setup.sh"
    end

end
