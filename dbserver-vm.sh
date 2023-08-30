apt-get update
export MYSQL_PWD='mysqlroot_pwd'

# Set automatic installation prompt management for mysql-server
echo "mysql-server mysql-server/root_password password $MYSQL_PWD" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_PWD" | debconf-set-selections

apt-get -y install mysql-server
service mysql start

# Create example database and user
echo "CREATE DATABASE IF NOT EXISTS mydatabase;" | mysql
# echo "USE mydatabase;" | mysql
echo "USE mydatabase; DROP TABLE IF EXISTS rocks;" | mysql
echo "USE mydatabase; CREATE TABLE rocks (rating int, name varchar(20), found varchar(20));" | mysql
echo "USE mydatabase; INSERT INTO rocks VALUES (1, 'dirt', 'everywhere');" | mysql
echo "USE mydatabase; INSERT INTO rocks VALUES (1.5, 'sand', 'beaches');" | mysql


# Create administrative user for admin server VM
echo "CREATE USER IF NOT EXISTS 'admin'@'192.168.56.13' IDENTIFIED BY 'admin';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'192.168.56.13'" | mysql

echo "CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED BY 'user';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'user'@'%'" | mysql

# Allow alternative machines to connect to the database
sed -i'' -e '/bind-address/s/127.0.0.1/0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql restart