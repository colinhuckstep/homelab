resource "proxmox_lxc" "adguard" {
  count = length(var.pve_nodes)
  target_node     = var.pve_nodes[count.index]
  hostname        = var.lxc_hostnames[count.index]
  vmid            = 101 + count.index
  ostemplate      = var.lxc_template
  password        = var.lxc_password
  unprivileged    = false
  cores           = 2
  memory          = 2048
  nameserver      = "172.16.0.1"
  ssh_public_keys = var.ssh_public_keys
  start           = true
  onboot          = true
  rootfs {
    storage       = "local-lvm"
    size          = "10G"
  }

  network {
    name          = "eth0"
    bridge        = "vmbr0"
    ip            = var.lxc_ips[count.index]
    gw            = var.lxc_gw

  }
}