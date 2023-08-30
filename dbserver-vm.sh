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

# Setup account (simulates hosting history)
echo "CREATE USER IF NOT EXISTS 'dbserver'@'localhost' IDENTIFIED BY 'supersecurepassword';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'dbserver'@'localhost' WITH GRANT OPTION" | mysql
export MYSQL_PWD='supersecurepassword'

# Use given file to set up example database
cat /vagrant/example-database.sql | mysql -u dbserver mydatabase
# Use given file to set up example users (simulate admin history)
cat /vagrant/example-database-access.sql | mysql -u dbserver mydatabase

# Allow alternative machines to connect to the database
sed -i'' -e '/bind-address/s/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql restart