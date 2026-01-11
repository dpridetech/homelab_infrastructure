**System:** Ubuntu Server 22.04 LTS 

**Purpose:** This guide provides the steps for the installation of Docker

---
## Steps

### 1. Update the system
``` bash
sudo apt update && sudo apt upgrade -y
```
---
### 2. Install required packages
```bash
sudo apt install ca-certificates curl gnupg lsb-release -y
```
---
### 3. Add Docker's official GPG key
``` bash
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
---

### 4. Add the Docker repository
``` bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
---
### 5. Update the package lists
``` bash
sudo apt update
```
---
### 6. Install Docker
``` bash
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
```
---
### 7. Verify Installation
``` bash
sudo systemctl status docker
```
---
### 8. Run Docker without sudo
``` bash
sudo usermod -aG docker $USER
newgrp docker
```
---
### 9. Test Docker
``` bash
docker run hello-world
```
---
### Check Docker's status
``` bash
systemctl status docker
```

---
### Automated Setup

For automated installation, see (docker_install.sh).
