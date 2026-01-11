!/bin/bash
set -e

# Exit if run as root
if [ "$EUID" -eq 0 ]; then
  echo "Please do not run this script as root. Run it as a normal user with sudo privileges."
  exit 1
fi

echo "Starting Tailscale installation on Ubuntu-based system..."

echo "Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

echo "Installing Tailscale..."
curl -fsSL https://tailscale.com/install.sh | sh

echo "Starting Tailscale and authenticating..."
sudo tailscale up

echo "Retrieving Tailscale IP address..."
tailscale ip -4

echo "Checking Tailscale status..."
tailscale status

echo "Tailscale installation and setup completed successfully."
