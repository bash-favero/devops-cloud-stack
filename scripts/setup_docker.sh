#!/bin/bash

# =================================================================
# Script Name: setup_docker.sh
# Description: Automates Docker installation on Ubuntu
# Author: Your Name
# =================================================================

echo "Starting System Update..."
sudo apt-get update -y

echo "Installing Docker..."
sudo apt-get install docker.io -y

echo "Starting and Enabling Docker Service..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Adding user $USER to the docker group..."
sudo usermod -aG docker $USER

echo "--------------------------------------"
echo "Installation complete!"
echo "Current Docker Version:"
docker --version
echo "--------------------------------------"
echo "NOTE: You may need to log out and log back in for group changes to take effect."
