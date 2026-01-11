**System:** Ubuntu Server 22.04 LTS 

This guide provides the installation steps for Tailscale.

---
## Steps

### 1. Update and Upgrade Server
```bash
sudo apt update && sudo apt upgrade -y
```
---
### 2. Install Tailscale
```bash
curl -fsSL https://tailscale.com/install.sh | sh
```
---
### 3. Start and Authenticate Tailscale
```bash
sudo tailscale up
```
---
### 4. Check the server's tailscale IP
```bash
tailscale ip -4
```
---
### 5. Verify Connectivity
```bash
tailscale status
ping <tailscale-ip>
```
---
### 6. Check Tailscale service and configure to start automatically on boot
```bash
sudo systemctl status tailscaled
```

---
### Automated Setup

For automated installation, see (tailscale_install.sh).
