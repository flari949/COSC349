# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/focal64"

  config.vm.define "dbserver" do |dbserver|
    dbserver.vm.hostname = "dbserver"

    # Set to forwarded port network allowing access from host computer
    dbserver.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"
    
    # Line required for functionality in CS labs
    dbserver.vm.synced_folder ".", "/vagrant", owner: "vagrant", group: "vagrant", mount_options: ["dmode=775,fmode=777"]

    # dbserver.vm.provision "shell", path: "build-dbserver-vm.sh"
    dbserver.vm.provision "shell", inline: <<-SHELL
      apt-get update
      export MYSQL_PWD='mysqlroot_pwd'

      # Set automatic installation prompt management for MySql database server
      echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
      echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections

      apt-get -y install mysql-server
      service mysql start

      # Create example database and user
      echo "CREATE DATABASE IF NOT EXISTS test;" | mysql
      echo "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'user';" | mysql
      echo "GRANT ALL PRIVILEGES ON test.* TO 'user'@'%'" | mysql
      
      # Allow external machines to connect to the database
      sed -i'' -e '/bind-address/s/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
      service mysql restart

      # Confirmation message
      echo "looking good!"
    SHELL
  end

  # //// CLI COMMANDS TO START MYSQL CONNECTION ////
  # vagrant up (assume provisions)
  # vagrant ssh <vm>
  # mysql -u <user> -p (((<pwd>)))

end
