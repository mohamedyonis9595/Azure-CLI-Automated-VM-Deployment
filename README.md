# Automated Azure VM Deployment with Nginx Bootstrapping
### Infrastructure as Code (IaC) Workflow via Azure CLI

## Project Overview
This repository contains a production-ready automation script to orchestrate, provision, and secure an Ubuntu Linux compute instance within Microsoft Azure. Designed for the **Nautilus DevOps Team** deployment pipeline, this configuration implements programmatic workarounds to safely navigate strict organizational Azure Governance Policies and regional resource constraints.

## Infrastructure Architecture
The script provisions a streamlined, public-facing web architecture layer:
- **Compute Instance (`xfusion-vm`)**: Standardized Ubuntu 22.04 LTS instance scaled down to the `Standard_B1s` tier to bypass strict regional compute capacity limits (`SkuNotAvailable`).
- **Storage Subsystem**: Enforced Local Redundant Storage (`Standard_LRS`) standard storage tiers capped at an explicit `30GB` volume to fulfill strict compliance filters (`RequestDisallowedByPolicy`).
- **Automated Bootstrapping (User-Data)**: Inline `cloud-init` shell execution engine injecting system updates, Nginx package arrays, and automated system daemon configurations during initial system boot phases.
- **Network Security Infrastructure**: Programmatic Network Security Group (NSG) rule modifications opening public ingress vectors on Port `80` (HTTP) with a routing priority of `1010`.

---

## Repository Directory Structure
```text
├── README.md                          # Project Documentation
└── scripts
    └── deploy-azure-nginx-vm.sh       # Automated Provisioning Shell Script
