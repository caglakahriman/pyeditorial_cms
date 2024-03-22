#!/bin/bash

# Update package lists
sudo apt update

# Install prerequisites

sudo apt install -y \
  git

# Install Docker
# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add user to Docker group for Docker without sudo
sudo usermod -aG docker $USER

# Inform user to log out and back in for group changes to take effect
echo "** Please log out and log back in for Docker group changes to take effect. **"

#clone from git here
git clone https://github.com/caglakahriman/pyeditorial_cms.git

# Let's assume your Dockerfile (containing Nginx configuration) is named Dockerfile_nginx
cd pyeditorial_cms

docker compose up -d