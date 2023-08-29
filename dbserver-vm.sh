apt-get update
export MYSQL_PWD='mysqlroot_pwd'

# Set automatic installation prompt management for MySql database server
echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections

apt-get -y install mysql-server
service mysql start

# Create example database and user
# echo "CREATE DATABASE IF NOT EXISTS test;" | mysql
echo "CREATE USER IF NOT EXISTS 'admin'@'192.168.56.13' IDENTIFIED BY 'admin';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'192.168.56.13'" | mysql

# Allow alternative machines to connect to the database
sed -i'' -e '/bind-address/s/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql restart

# Confirmation message
echo "looking good!"