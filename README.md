# homelab_infrastructure

## Overview

This repository documents my personal home-lab environment, built using a custom PC, a laptop, and other networking hardware. The lab exists to gain hands on IT experience, reduce reliance on paid services, and take full ownership of my data.

---
## Network & Architecture

(Network Diagram.draw.io)

This network was designed to facilitate self-hosting of services and isolated lab environments. Tailscale is being utilized to provide secure remote access across all devices. The network is separated into two subnets: 

**Subnet #1** is defined by a combo device provided by my ISP. The combo device handles all internet connections for my home. A low-power server, which provides 24/7 access to services, is connected to the ISP device via ethernet connection.

**Subnet #2** is defined by a router connected to the ISP device. The router runs DHCP for the subnet, and is configured to allow inbound and outbound connections. This configuration allows for a lab environment that is isolated from the home network. A managed switch is connected directly to this router and provides connection to the Proxmox server. 

---
## Hardware
### Custom-built PC  
**Purpose:** Run isolated environments for learning, hands-on labs, and service hosting.

- **CPU:** AMD Ryzen 7 7700X
- **RAM:** 32 GB DDR5
- **GPU:** NVIDIA GeForce GTX 1660 Super
- **Storage:** 1 TB NVMe SSD
- **Operating System:** Proxmox VE 9.1
### Macbook Pro
**Purpose:** Host services that require 24/7 availability and up-time.

- **CPU:** Intel Core i5-4278
- **RAM:** 4GB DDR3
- **Storage:** 128GB SSD
- **Operating System:** Ubuntu Server 22.04 LTS 

### Network Devices
**Purpose:** Provide network connectivity

**ISP Combo Device:** 
- All-in-one device that provides the internet connection to the home.

**Router:** 
- Creates an isolated lab network (subnet 2).
- DHCP server

**Managed Switch:** 
- Handles layer 2 routing for the lab network.
- Allows for the creation of VLANs.

---
## Services 

**Tailscale:** 
- Mesh VPN providing secure, encrypted remote access to homelab services without exposing ports or requiring traditional VPN configurations. See installation guide here (tailscale_install_guide).

**Samba:** 
- Network file sharing services providing centralized storage accessible across Windows, Linux, and macOS devices.

**Docker:** 
- Containerization platform enabling isolated service deployment and management. Reduces overhead for applications compared to traditional virtualization. See installation guide here (docker_install_guide).

**Home Assistant:** 
- Open source home automation platform managing smart devices, automations, and integrations. Runs locally to maintain privacy and control over data without relying on cloud services.

---
## Key Projects/ Challenges

**Network Segmentation Design Challenge:** Needed to isolate lab environment from the home network for security while maintaining connectivity for management. 
- Implemented two-subnet design using router passthrough.
- Configured the router with statc routes, established Tailscale network for secure cross-subnet access without exposing services publicly.
**Outcome:** Lab experiments can't impact home network devices. Remote access achieved without port forwarding.

---
## Operations

**Backups:**
- All resources and configurations are backed up weekly.
- Backups are currently kept for 1 month.

**Monitoring:** 
- All resources are currently being monitored via command line tools. Special attention is given to container status, network connectivity, and uptime/ availability. 

**Updates:**
- All systems are currently being updated monthly.
