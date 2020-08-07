#!/bin/bash

#update


sudo apt-get update -y

sudo apt-get upgrade -y

#install modules
sudo apt-get install nginx
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

#install node and pm
sudo apt-get install node js
sudo apt-get install npm -y

cd /home/ubuntu/app




#Install NPM
sudo npm install

sudo npm install pm2 -g

# Syncing the folders from the AWS folder to the virtual machine on the EC2 instance
pm2 start app.js


