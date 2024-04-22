#!/bin/bash

# Update package index
sudo apt update

# Install Apache, MySQL, PHP
sudo apt install -y apache2 mysql-server php libapache2-mod-php php-mysql

# Clone PHP application from GitHub
git clone https://github.com/laravel/laravel.git /var/www/html/

# Configure Apache to serve the PHP application
sudo cp /var/www/html/config/apache.conf /etc/apache2/sites-available/lamp.conf
sudo a2ensite lamp.conf
sudo systemctl reload apache2

# Configure MySQL
mysql -u root -e "CREATE DATABASE lamp_database;"
mysql -u root -e "CREATE USER 'lamp_user'@'localhost' IDENTIFIED BY 'password12345';"
mysql -u root -e "GRANT ALL PRIVILEGES ON lamp_database.* TO 'lamp_user'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"

