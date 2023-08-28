# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"

  config.vm.define "dbserver" do |dbserver|
    dbserver.vm.hostname = "dbserver"
    dbserver.vm.network "private_network", ip: "192.168.56.11"
    dbserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

    # dbserver.vm.provision "shell", path: "build-dbserver-vm.sh"
    dbserver.vm.provision "shell", inline: <<-SHELL
      apt-get update
      export MYSQL_PWD='mysqlroot_pwd'
      # Set automatic installation prompt management for MySql database server
      echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
      echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections

      apt-get -y install mysql-server

      echo "looking good!"
    SHELL
  end

  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
        # config.vm.provision "shell", inline: <<-SHELL
        #   apt-get update
        #   apt-get install -y apache2

        #   # Use local webserver config
        #   cp /vagrant/test-website.conf /etc/apache2/sites-available/
        #   a2ensite test-website
        #   a2dissite 000-default
        #   service apache2 reload
        # SHELL
end
