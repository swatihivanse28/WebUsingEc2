#!/bin/bash

echo "Running install_dependencies.sh..." >> /tmp/deploy.log

# Change to app directory
cd /home/ec2-user/myapp

# System updates and Python setup
sudo yum update -y
sudo yum install -y python3 docker
sudo pip3 install flask
pip3 install -r requirements.txt >> /tmp/deploy.log 2>&1

# Start and enable Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add ec2-user to docker group
sudo usermod -aG docker ec2-user

echo "Install dependencies completed" >> /tmp/deploy.log
