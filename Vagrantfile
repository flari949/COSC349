# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"

  # Create standalone web server test vm

  config.vm.define "webserver" do |webserver|
    webserver.vm.hostname = "webserver"

    # Set to forwarded port network allowing access from host computer
    webserver.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    # Line required for functionality in CS labs
    webserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

    webserver.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y apache2

      # Use local webserver config
      cp /vagrant/mock-website.conf /etc/apache2/sites-available/
      a2ensite mock-website
      a2dissite 000-default
      service apache2 reload
      echo "webserver provisioning complete!"
    SHELL
  end

  # Database server vm basic setup

  # config.vm.define "dbserver" do |dbserver|
  #   dbserver.vm.hostname = "dbserver"

  #   # Set to forwarded port network allowing access from host computer
  #   dbserver.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
  #   # dbserver.vm.network "private_network", ip: "192.168.56.11"

  #   # Line required for functionality in CS labs
  #   dbserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

  #   # dbserver.vm.provision "shell", path: "build-dbserver-vm.sh"
  #   dbserver.vm.provision "shell", inline: <<-SHELL
  #     apt-get update
  #     export MYSQL_PWD='mysqlroot_pwd'

  #     # Set automatic installation prompt management for MySql database server
  #     echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
  #     echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections

  #     apt-get -y install mysql-server
  #     service mysql start

  #     # Create example database and user
  #     echo "CREATE DATABASE IF NOT EXISTS test;" | mysql
  #     echo "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'user';" | mysql
  #     echo "GRANT ALL PRIVILEGES ON test.* TO 'user'@'%'" | mysql
      
  #     # Allow external machines to connect to the database
  #     sed -i'' -e '/bind-address/s/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
  #     service mysql restart

  #     # Confirmation message
  #     echo "looking good!"
  #   SHELL
  # end

  # //// CLI COMMANDS TO START MYSQL CONNECTION ////
  # vagrant up (assume provisions)
  # vagrant ssh <vm>
  # mysql -u <user> -p (((<pwd>)))

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
