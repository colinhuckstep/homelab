# Description
This is the Ansible Playbooks for building/rebuilding/adding a node to my homelab. The new-host.yml playbook will patch all nodes to latest then install Docker, Tailscale, PowerPanel (On the node controlling the UPS), and Staship Shell. Any necessary pre-reqs will be installed either by the pre-reqs role or the role for the specific service.

## Assumptions/Pre-reqs
- A workstation with Ansible Engine installed and a basic understanding of using Ansible
- S3 Compatible Storage for Terraform State
- Nodes are Running Proxmox VE
- There is an ansible vault file containing the secrets located at ~/repos/secrets/secrets.yml
    - All variables from the vault are prefixed with "secret_"
    - SSH Private Keys are stored with these secrets
- There is a folder with configs for Adguard Home, Adguard Home Sync, and KeepaliveD Configs for each node. These can be stored in the secrets repo and encrypted with ansible-vault. It is up to you how to store them securely as they do contain sensetive data.
- A router running pfsense/OPNsense with HAProxy and ACME plugins.
  - ACME generating a cert for dns subdomain
  - HAProxy Config and ACME Cert for pmx subdomain used for the proxmox API. I run my backend as a single active multiple backups with weighting as opposed to sticky. This worked better for console access to the VMs. I've never been able to get sticky working correctly for the console access.
- A Tailscale subscription
  - Tailscale is installed directly on the proxmox hosts to ensure access if there is an issue bringing up VMs/LXCs.
- A PowerPanel Cloud Subscription
  - This is for Cyberpower UPS. One of my nodes has a USB connection to the UPS. One of these days I'll get around to writing custom shutdown scripts to power off the other two node first.

## Inventory
An example inventory file is provided at inventories/example.yml It is non-functional and would need updated with the current node names, IPs, user.

## Adguard Home
Adguard Home is used for my local DNS and filtering. It is deployed in and Active/Passive/Passive setup using KeepaliveD. One LXC per proxmox node.

Adguard Home sync is installed as an LXC on node1 to sync the config to the other 3 LXCs.

## Omada Controller
Omada controller is used for my Switches and WAPs. This urns on node 3. There is a bind mount for the automatic omada backups. Backups are encrypted.

## Rclone
Rclone is configured to copy encrypted backups from various container volumes and pfsense to GoogleDrive. This uses a GoogleDrive API service account to copy to GoogleDrive and SFTP connection to pull the files from pfsense.

## Archived Playbooks/Roles

I've stopped using Portainer and ControlD. Playbooks and Roles are in the archived folders for historical reference

## Next Steps
Prometheus and Grafana probably cloud, maybe not.