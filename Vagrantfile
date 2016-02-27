# file: Vagrantfile
# -*- mode: ruby -*-
# vi: set ft=ruby :

workingDir  = File.expand_path(File.dirname(__FILE__))

Vagrant.configure(2) do |config|
  # The name of the box to install
  config.vm.box = "bento/centos-7.1"

  # The definition of where to find that box and download it from the web
  config.vm.box_url = "./box.json"

  # Forward multiple ports from inside the VM (guest) to the your computer (host)
  config.vm.network "forwarded_port", guest: 8080, host: 8080
  config.vm.network "forwarded_port", guest: 9000, host: 9000
  config.vm.network "forwarded_port", guest: 3306, host: 3306

  # Port for live reload
  config.vm.network "forwarded_port", guest: 35729, host: 35729

  config.vm.provider "virtualbox" do |vb|
    # How much memory to provision the VM
    vb.customize ["modifyvm", :id, "--memory", "2048"]

    # How many CPUs this VM should have access to
    vb.customize ["modifyvm", :id, "--cpus", "2"]

    # Change the network card hardware for better performance
    vb.customize ["modifyvm", :id, "--nictype1", "virtio" ]
    vb.customize ["modifyvm", :id, "--nictype2", "virtio" ]

    # Suggested fix for slow network performance
    # see https://github.com/mitchellh/vagrant/issues/1807
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]

    # Enable symbolic links (needed for NPM)
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  # Run the provision script which will install the dev dependencies
  config.vm.provision :shell, :path => "#{workingDir}/provision.sh"
end
