#!/bin/bash
set -e

# Exit if run as root
if [ "$EUID" -eq 0 ]; then
  echo "Please do not run this script as root. Run it as a normal user with sudo privileges."
  exit 1
fi

echo "Starting Docker installation on Ubuntu-based system..."

echo "Updating the system..."
sudo apt update && sudo apt upgrade -y

echo "Installing required packages..."
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "Adding Docker’s official GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "Adding the Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Updating package lists..."
sudo apt update

echo "Installing Docker..."
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Verifying Docker installation..."
docker --version
sudo docker run hello-world

echo "Adding user to Docker group..."
sudo usermod -aG docker $USER
echo "Please log out and back in (or run 'newgrp docker') for the group changes to take effect."

echo "Docker installation completed successfully."
