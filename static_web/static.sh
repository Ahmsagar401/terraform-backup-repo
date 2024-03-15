#!/bin/bash
sudo su -
apt update
apt install apache2 -y
apt install unzip
mkdir tmp
cd /tmp
wget https://www.free-css.com/assets/files/free-css-templates/download/page275/triple-p.zip
unzip triple-p.zip
cd html-freebie-triple-p-master
mv * /var/www/html/
systemctl start apache2
systemctl enable apache2
