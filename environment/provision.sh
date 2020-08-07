#!/bin/bash

#update
sudo apt-get update -y

sudo apt-get upgrade -y

#install modules
sudo apt-get install nginx

# setting up nginx
sudo unlink /etc/nginx/sites-enabled/default
cd /etc/nginx/sites-available
sudo touch reverse-proxy.conf
sudo chmod 666 reverse-proxy.conf
echo "server{
  listen 80;
  location / {
      proxy_pass http://54.72.247.231:3000;
  }
}" >> reverse-proxy.conf
sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf
sudo service nginx restart




curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

#install node and pm
sudo apt-get install -y nodejs
sudo apt-get install npm -y

# cd into app to run next installs
cd /home/ubuntu/app


#Install NPM
sudo npm install
sudo npm install pm2 -g

# Syncing the folders from the AWS folder to the virtual machine on the EC2 instance
pm2 start app.js


