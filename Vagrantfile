# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

	config.vm.box = "ubuntu/trusty64"
	config.vm.network "public_network", bridge: 'en0: Wi-Fi (AirPort)', ip: "192.168.1.21"
	config.vm.network "forwarded_port", guest: 3306, host: 3306 
	config.vm.hostname = "Jupiter"
	config.vm.synced_folder ".", "/vagrant", disabled: true
	config.vm.synced_folder "./media/", "/media/", :mount_options => ["dmode=777", "fmode=666"]
	
	config.vm.provider "virtualbox" do |vb|
		vb.customize ["modifyvm", :id, "--memory", "4096", "--cpus", "3"]
		vb.name = "jupiter.live"
	end

	config.vm.provision "file", source: "./docker-compose.yml", destination: "~/docker-compose.yml"
	
	config.vm.provision "shell" do |s|
        s.path = "./setup.sh"
    end

end
