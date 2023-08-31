# Install webserver-host and supporting programs for php and mysql
apt-get update
apt-get install -y apache2 libapache2-mod-php php-mysql

# Use local webserver config
cp /vagrant/website.conf /etc/apache2/sites-available/

# Enable new site and disable default
a2ensite website
a2dissite 000-default

service apache2 reload