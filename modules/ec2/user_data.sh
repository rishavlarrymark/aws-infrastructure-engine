#!/bin/bash

echo "Staring EC2 bootstrapping..." > /tmp/init.log

# Update packages
yun update -y

#install nginx (web server)
yum install -y nginx

#Start nginx
systemctl start nginx
systemctl enable nginx

#create simple webpage
echo "Cloud Infrastructure Engine Running" > /user/share/nginx/html/index.html

echo "Setup complete" >> /tmp/init/.log