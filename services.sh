#!/bin/bash
sudo apt install memcached redis
sudo systemctl enable redis memcached php5.6-fpm php7.0-fpm nginx

# Fix memcached config
wget ftp://172.16.200.13/public/scripts/ubuntu/templates/memcached
sudo cat memcached > /etc/memcached.conf
sudo rm -f memcached

# Fix ubuntu grub
wget ftp://172.16.200.13/public/scripts/ubuntu/templates/grub
sudo cat grub > /etc/default/grub
sudo rm -f grub
sudo update-grub

# Disable tmp in memory
sudo systemctl mask tmp.mount

#Delete Apache2 for good 
sudo apt remove apache2 apache2-bin apache2-data apache2-utils
sudo systemctl restart nginx.service
sudo systemctl restart php5.6-fpm php7.0-fpm
