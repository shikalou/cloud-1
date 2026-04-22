Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"
  config.vm.provision "podman" do |d|
    d.build_image "/vagrant/app"
  end
end
