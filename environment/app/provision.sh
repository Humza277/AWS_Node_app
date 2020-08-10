#!/bin/bash
# Update the sources list
sudo apt-get update -y
# upgrade any packages available
sudo apt-get upgrade -y
# install git
sudo apt-get install git -y
# # disable virtual environment
# sudo apt-get update
# sudo apt-get install nginx
#sudo unlink ~/etc/nginx/sites-enabled/default
# install nodejs
sudo apt-get install python-software-properties
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install nodejs -y
# install pm2
sudo npm install pm2 -g
# install nginx
sudo apt-get install nginx -y
# remove the old file and add our one
sudo rm /etc/nginx/sites-available/default
sudo rm /etc/nginx/sites-enabled/default
sudo cp /home/ubuntu/environment/nginx.conf /etc/nginx/sites-available/default.conf
sudo ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf
sudo service nginx restart
# DB HOST for Development Environment (Virtual machines)
echo export DB_HOST='mongodb://34.240.23.93:27017/posts' >> ~/.bashrc
cd /home/ubuntu/app
sudo npm install
sudo pm2 start app.js
sudo systemctl restart nginx