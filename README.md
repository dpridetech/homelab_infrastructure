# homelab_infrastructure

## Overview

This repository documents my personal home-lab environment, built using a custom PC, a laptop, and other networking hardware. This lab exists to gain hands on experience deploying infrastructure that allows for isolated lab environments as well as the self-hosting of essential network services.

---
## Skills Demonstrated 

- Network segmentation and subnetting
- Router configuration (DHCP, firewall rules, static routing)
- Managed switch configuration and VLAN implementation
- Mesh VPN configuration and secure remote access
- Linux system administration (Fedora, Ubuntu)
- Containerization and service deployment (Docker)

---
## Network & Architecture

This diagram shows the physical topology of the network. The network is divided into 2 subnets defined below. Tailscale is installed and configured on all endpoints to ensure secure remote access to devices without exposing any ports over the internet.

**Subnet #1** is defined by a combo device provided by my ISP. This device handles all internet connections for my home. 

**Subnet #2** is defined by a router connected to the ISP device. The router runs DHCP for the subnet, and has a firewall configured to allow inbound and outbound connections. This configuration allows for a lab environment that is isolated from the home network.

---
## Hardware

**ISP Combo Device:** 
- All-in-one device that provides the internet connection to the home via Ethernet or WiFi.

**Router:** 
- Creates an isolated lab network (subnet 2).
- DHCP/Firewall

**Managed Switch:** 
- Handles layer 2 routing for the lab network.
- Allows for the creation of VLANs

**Custom-built PC**
- **CPU:** AMD Ryzen 7 7700X
- **RAM:** 32 GB DDR5
- **GPU:** PNY GeForce RTX 5060Ti 8GB
- **Storage:** 1 TB NVMe SSD
- **Operating System:** Fedora KDE

**MacBook Pro**
- **CPU:** Intel Core i5-4278
- **RAM:** 4GB DDR3
- **Storage:** 128GB SSD
- **Operating System:** Ubuntu Server
- Running headless (no display) as a dedicated server, accessed via SSH.

---
## Services 

**Tailscale:** 
- Mesh VPN that provides secure, encrypted remote access to homelab services without exposing ports or requiring traditional VPN configurations.

**Docker:** 
- Containerization platform enabling isolated deployment and management of services. Reduces overhead for applications compared to traditional virtualization.
 
---
## Key Projects/ Challenges

**Network Segmentation Design:** 
Needed to isolate lab environment from the home network for security while maintaining connectivity for management. 
- Implemented two-subnet design by enabling IP passthrough on the ISP device.
- Configured the router with static routes, and established a Tailscale network for secure cross-subnet access without exposing services publicly.
**Outcome:** Lab experiments can't impact home network devices. Remote access achieved without port forwarding.

**Firewall Lockout Recovery**:
Configured a firewall rule on the router that blocked my own management access.
- Confirmed physical connectivity to rule out a hardware issue, then determined the problem was isolated to management access rather than all traffic.
- Reviewed previously applied firewall rules and identified a missing explicit "accept" action, causing traffic to fall through to a default "deny" policy.
**Outcome:** Management access restored via factory reset; adopted a two-session verification process for all future firewall changes to prevent recurrence.

---
## Operations

**Backups:**
- All critical configs and data are backed up weekly to the MacBook Pro via rsync, with a secondary copy saved to an external hard drive
- Backups are currently kept for 1 month before being deleted.

**Monitoring:** 
- System health is monitored using command-line tools including “systemctl status” for service health and “htop” for real-time resource usage.

**Updates:**
- All systems are manually updated via the command-line on an as needed basis

**Documentation**
- All lab work is documented in Obsidian and version-controlled by syncing directly to this repository.

**Ticketing:**
- Spiceworks is used to simulate real-world IT ticketing workflows, tracking lab tasks, issues, and maintenance as if operating in a help desk environment

---
## Future Plans

- Build a mini rack housing mini PCs running ProxmoxVE for virtualization and 24/7 service availability.
- Migrate existing workloads from the custom-built PC to the new ProxmoxVE environment.
- Automate repetitive tasks (backups, updates, monitoring) through scripting.
- Deploy additional self-hosted services as lab needs grow.
