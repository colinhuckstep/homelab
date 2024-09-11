# Description
This is the Ansible Playbooks for building/rebuilding/adding a node to my homelab. The new-host.yml playbook will patch all nodes to latest then install Docker, Tailscale, PowerPanel (On the node controlling the UPS), and Staship Shell. Any necessary pre-reqs will be installed either by the pre-reqs role or the role for the specific service.

## Assumptions/Pre-sreqs
- A workstation with Ansible Engine installed and a basic understanding of using Ansible
- Nodes are Running Debian(or Ubuntu) Server
- There is an ansible vault file containing the secrets located at ~/repos/secrets/secrets.yml
    - All variables from the vault are prefixed with "secret_"
    - SSH Private Keys are stored with these secrets
- There is a folder with configs for Adguard Home, Adguard Home Sync, and KeepaliveD Configs for each node. These can be stored in the secrets repo and encrypted with ansible-vault. It is up to you how to store them securely as they do contain sensetive data.
- A Tailscale subscription
- A PowerPanel Cloud Subscription

## Inventory
An example inventory file is provided at inventories/example.yml It is non-functional and would need updated with the current node names, IPs, user.

## Docker
Each node is configured as an individual Docker host. I don't particularly like using Swarm because my nodes are not consistent hardware.

## Reverse Proxy
HAProxy is installed on my Firewall and provides the certificate management and reverse proxy for most services. This is primarily because of the individual nodes and because at my scale I've found other reverse proxy solutions(Traefik, Tailscale, etc.) to be more hassle than they are worth.

## Adguard Home
Adguard Home is used for my local DNS and filtering. It is deployed in and Active/Passive/Passive setup using KeepaliveD. In my scenario Node 2 is the Active and nodes 3 and 1 are the passive nodes with failover in that order.

## Omada Controller
Omada controller is used for my Switches and WAPs. This urns on node 3. There is a bind mount for the automatic omada backups. Backups are encrypted.

## Rclone
Rclone is configured to copy encrypted backups from various container volumes and pfsense to GoogleDrive. This uses a GoogleDrive API service account to copy to GoogleDrive and SFTP connection to pull the files from pfsense.

## Archived Playbooks/Roles

I've stopped using Portainer and ControlD. Playbooks and Roles are in the archived folders for historical reference

## Next Steps
Prometheus and Grafana probably cloud, maybe not.