# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"

  # Build web server vm
  # config.vm.define "webserver" do |webserver|
  #   webserver.vm.hostname = "webserver"

  #   # Set to forwarded port network allowing access from host computer
  #   webserver.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  #   # Line required for functionality in CS labs
  #   webserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

  #   webserver.vm.provision "shell", path: "webserver-vm.sh"
  # end

  # Database server vm
  config.vm.define "dbserver" do |dbserver|
    dbserver.vm.hostname = "dbserver"

    # Private network setup to communicate with other vms
    dbserver.vm.network "private_network", ip: "192.168.56.12"

    # Line required for functionality in CS labs
    dbserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

    dbserver.vm.provision "shell", path: "dbserver-vm.sh"
  end

  # Database admin vm
  config.vm.define "dbadmin" do |dbadmin|
    dbadmin.vm.hostname = "dbadmin"

    # Private network setup to communicate with other vms
    dbadmin.vm.network "private_network", ip: "192.168.56.13"

    # Line required for functionality in CS labs
    dbadmin.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

    dbadmin.vm.provision "shell", inline: <<-SHELL

      sudo apt-get update
      sudo apt-get -y install mysql-client

    SHELL

  end

end
