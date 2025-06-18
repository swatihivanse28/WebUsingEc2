#!/bin/bash

echo "Running install_dependencies.sh..." >> /tmp/deploy.log

# Change to your app directory
APP_DIR="/home/ec2-user/myapp"
mkdir -p $APP_DIR
cd $APP_DIR

# System updates and install dependencies
sudo yum update -y >> /tmp/deploy.log 2>&1
sudo yum install -y python3 docker >> /tmp/deploy.log 2>&1

# Install Python packages
sudo pip3 install --upgrade pip >> /tmp/deploy.log 2>&1
sudo pip3 install flask >> /tmp/deploy.log 2>&1

# Install app-specific Python packages if requirements.txt is present
if [ -f requirements.txt ]; then
    pip3 install -r requirements.txt >> /tmp/deploy.log 2>&1
fi

# Start Docker
sudo systemctl start docker
sudo systemctl enable docker

# Add ec2-user to docker group
sudo usermod -aG docker ec2-user

echo "Install dependencies completed" >> /tmp/deploy.log
