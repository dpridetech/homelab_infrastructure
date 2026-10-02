# Tailscale Installation Guide

**System:** Ubuntu Server 22.04 LTS

This guide provides the installation steps for Tailscale.

---
## Steps

### 1. Update and Upgrade Server

```shell
sudo apt update && sudo apt upgrade -y
```

---
### 2. Install Tailscale

```shell
curl -fsSL https://tailscale.com/install.sh | sh
```

---
### 3. Start and Authenticate Tailscale

```shell
sudo tailscale up
```

---
### 4. Check the server's tailscale IP

```shell
tailscale ip -4
```

---
### 5. Verify Connectivity

```shell
tailscale status
ping <tailscale-ip>
```

---
### 6. Check Tailscale service and configure to start automatically on boot

```shell
sudo systemctl status tailscaled
```

---
### Automated Setup

For automated installation, see (tailscale_install.sh).
