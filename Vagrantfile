Vagrant.configure("2") do |config|
	config.vm.box = "bento/ubuntu-24.04"
	config.vm.provision "shell", inline: "mkdir -p $HOME/cloud-1", privileged: false
	config.vm.provision "file", source: "./inception", destination: "$HOME/cloud-1/inception"
	config.vm.provision "file", source: "./playbook", destination: "$HOME/cloud-1/playbook"
	config.vm.provision "shell", path: "./google_sdk_install.sh"
	config.vm.provider "virtualbox" do |vb|
	  vb.memory = "2048"
	  vb.cpus = "2"
	end
	config.vm.define "ldinaut" do |server|
          server.vm.hostname = "ldinaut"
          server.vm.network :private_network, ip: "192.168.56.110"
	  server.vm.network "forwarded_port", guest: 80, host: 8080
	  server.vm.provider "virtualbox" do |vb|
		vb.name = "ldinaut"
	  end
	end
end

