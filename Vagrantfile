# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"

  # Database server vm
  config.vm.define "dbserver" do |dbserver|
    dbserver.vm.hostname = "dbserver"

    # Private network setup to communicate with other VMs
    dbserver.vm.network "private_network", ip: "192.168.56.12"

    # Line required for functionality in CS labs
    dbserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

    # Redirect to external shell provisioning script
    dbserver.vm.provision "shell", path: "dbserver-vm.sh"
  end  

  # Build web server vm
  config.vm.define "webserver" do |webserver|
    webserver.vm.hostname = "webserver"

    # Private network setup to communicate with other VMs
    webserver.vm.network "private_network", ip: "192.168.56.11"

    # Setup port forwarding network allowing access from host computer
    webserver.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    # Line required for functionality in CS labs
    webserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]
  
    # Redirect to external shell provisioning script
    webserver.vm.provision "shell", path: "webserver-vm.sh"
  end

  # Database admin vm
  config.vm.define "dbadmin" do |dbadmin|
    dbadmin.vm.hostname = "dbadmin"

    # Private network setup to communicate with other VMs
    dbadmin.vm.network "private_network", ip: "192.168.56.13"

    # Line required for functionality in CS labs
    dbadmin.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

    # Redirect to external shell provisioning script
    dbadmin.vm.provision "shell", path: "dbadmin-vm.sh"

    admin_password = "admin"
    # Induce mysql connect on vm ssh connection - connect admin vm to database vm
    dbadmin.ssh.extra_args = ["-t", "mysql -h 192.168.56.12 -u admin -p#{admin_password} 2>/dev/null"]

  end

end
