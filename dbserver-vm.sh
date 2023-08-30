apt-get update
export MYSQL_PWD='mysqlroot_pwd'

# Set automatic installation prompt management for mysql-server
echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections

apt-get -y install mysql-server
service mysql start

echo "CREATE DATABASE IF NOT EXISTS mydatabase" | mysql

# Create administrative user for admin server VM
echo "CREATE USER IF NOT EXISTS 'admin'@'192.168.56.13' IDENTIFIED BY 'admin';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'192.168.56.13'" | mysql

# Test user for webserver
echo "CREATE USER IF NOT EXISTS 'webuser'@'%' IDENTIFIED BY 'webuser';" | mysql
echo "GRANT ALL PRIVILEGES ON mydatabase.* TO 'webuser'@'%'" | mysql
export MYSQL_PWD='user'

# Use given file to set up example database
cat /vagrant/example-database.sql | mysql -u webuser mydatabase

# Allow alternative machines to connect to the database
sed -i'' -e '/bind-address/s/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql restart