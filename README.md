# Description
This is the Ansible Playbooks for building/rebuilding/adding a node to my homelab. The new-host.yml playbook will patch all nodes to latest then install Docker, Tailscale, PowerPanel (On the node controlling the UPS), and Staship Shell. Any necessary pre-reqs will be installed either by the pre-reqs role or the role for the specific service.

## Assumptions/Pre-reqs
- A workstation with Ansible Engine installed and a basic understanding of using Ansible
- Nodes are Running Ubuntu LTS Minimized Install
- Secrets Management is up to you. Look at the example.yml in the get-secrets role to see how secrets are used in the project.
- A Tailscale subscription - comment out in the new-host.yml if you don't need it.
- A PowerPanel Cloud Subscription - comment out in the new-host.yml if you don't need it
  - This is for Cyberpower UPS. One of my nodes has a USB connection to the UPS.
- Starship - I like starship for my shell. If you don't, comment it out.
## Inventory
An example inventory file is provided at inventories/example.yml It is non-functional and would need updated with the current node names, IPs, user.

## Docker
Docker CE is installed and joined to a portainer instance via the API.