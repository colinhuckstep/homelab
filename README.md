# Description
This is the Ansible Playbooks for building/rebuilding/adding a node to my homelab. The new-host.yml playbook will patch all nodes to latest then install Docker, Tailscale, ControlD, PowerPanel (On the node controlling the UPS), Staship Shell, and Portainer Admin and Edge Agents. Any necessary pre-reqs will be installed along the way.

## Assumptions/Pre-sreqs
- A workstation with Ansible Engine installed and a basic understanding of using Ansible
- Nodes are Running Debian(or Ubuntu) Server
- There is an ansible vault file containing the secrets located at ~/repos/secrets/secrets.yml
    - All variables from the vault are prefixed with "secret_"
- A Tailscale subscription
- A ControlD subscription
- A Portainer Business License (3 Nodes Free)
- A PowerPanel Cloud Subscription

## Inventory
An example inventory file is provided at inventories/example.yml It is non-functional and would need updated with the current node names, IPs, user, ControlD resolver IDs.

## Portainer
Portainer Admin Console is installed on the portainer_admin node listed in the inventory. It is not setup to expose the local docker instance.

Portainer Edge Agent is configured to run on all nodes listed in portainer_agents group in the inventory. Edge Agent was chosen because of the ability to schedule jobs when using the Edge Compute features in portainer.