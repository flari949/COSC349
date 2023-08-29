# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"

  # Build webserver vm
  config.vm.define "webserver" do |webserver|
    webserver.vm.hostname = "webserver"

    # Set to forwarded port network allowing access from host computer
    webserver.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    # Line required for functionality in CS labs
    webserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

    webserver.vm.provision "shell", path: "webserver-vm.sh"
  end

  # Database server vm
  config.vm.define "dbserver" do |dbserver|
    dbserver.vm.hostname = "dbserver"

    # Set to forwarded port network allowing access from host computer
    dbserver.vm.network "forwarded_port", guest: 80, host: 8081, host_ip: "127.0.0.1"
    # dbserver.vm.network "private_network", ip: "192.168.56.11"

    # Line required for functionality in CS labs
    dbserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

    dbserver.vm.provision "shell", path: "dbserver-vm.sh"
  end

  # //// CLI COMMANDS TO START MYSQL CONNECTION ////
  # vagrant up (assume provisions)   --> Start vm
  # vagrant ssh <vm>                 --> Connect to vm cl
  # mysql -u <user> -p (((<pwd>)))   --> Connect to MySql

end
