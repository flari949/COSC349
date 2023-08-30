apt-get update
apt-get install -y apache2 libapache2-mod-php php-mysql

# Use local webserver config
cp /vagrant/mock-website.conf /etc/apache2/sites-available/

# Enable new site and disable default
a2ensite mock-website
a2dissite 000-default

service apache2 reload

echo "webserver provisioning complete!"