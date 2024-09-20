resource "proxmox_lxc" "adguard" {
  count = length(var.pve_nodes)
  target_node     = var.pve_nodes[count.index]
  hostname        = var.lxc_hostnames[count.index]
  vmid            = 101 + count.index
  ostemplate      = var.lxc_template
  password        = var.lxc_password
  unprivileged    = true
  cores           = 2
  memory          = 2048
  nameserver      = var.lxc_nameserver
  ssh_public_keys = <<-EOT
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID6HDc+/KqF0d2+34ndpGLVXF1iVrMN+H+OnWCPGlBSi
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINC8pAz7kyVMId2u/fruVZrmGWCQuod8JMrpYZS1zanH
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEf4L1u8R9VvM79YiYB4jI/UgNjHfoPNm2UGUo+oapnL
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILmaIUTiRQipJ2+qwjLtOZ8immyA/VjLEPe2Hp4DCNdU
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH06LjNsl5lYBSxZ7d/YO/zzmb7qUAgm9otrB3JyCl7i
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA7k21X+9AVAwvDjGkVlXTXAA/kQ0SBJBnumi5eQk336
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIID7LBsWMVSkp02r6w0mgHWZjv+yY4CgaYJ1KjEqhc0U
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHQuZ4Y/6OTdyisgxnY2Y7kW7SnuPPr2amsYUme6miE8
  EOT
  start           = true
  onboot          = true
  rootfs {
    storage       = "local-lvm"
    size          = "10G"
  }
  features {
    nesting = true
  }
  network {
    name          = "eth0"
    bridge        = "vmbr0"
    ip            = var.lxc_ips[count.index]
    gw            = var.lxc_gw

  }
}

resource "proxmox_lxc" "adguardSync" {
  target_node     = var.pve_nodes[0]
  hostname        = var.lxc_hostnames[3]
  vmid            = 100
  ostemplate      = var.lxc_template
  password        = var.lxc_password
  unprivileged    = true
  cores           = 1
  memory          = 512
  nameserver      = var.lxc_nameserver
  ssh_public_keys = <<-EOT
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID6HDc+/KqF0d2+34ndpGLVXF1iVrMN+H+OnWCPGlBSi
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINC8pAz7kyVMId2u/fruVZrmGWCQuod8JMrpYZS1zanH
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEf4L1u8R9VvM79YiYB4jI/UgNjHfoPNm2UGUo+oapnL
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILmaIUTiRQipJ2+qwjLtOZ8immyA/VjLEPe2Hp4DCNdU
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH06LjNsl5lYBSxZ7d/YO/zzmb7qUAgm9otrB3JyCl7i
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA7k21X+9AVAwvDjGkVlXTXAA/kQ0SBJBnumi5eQk336
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIID7LBsWMVSkp02r6w0mgHWZjv+yY4CgaYJ1KjEqhc0U
      ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHQuZ4Y/6OTdyisgxnY2Y7kW7SnuPPr2amsYUme6miE8
  EOT
  start           = true
  onboot          = true
  rootfs {
    storage       = "local-lvm"
    size          = "5G"
  }

  network {
    name          = "eth0"
    bridge        = "vmbr0"
    ip            = var.lxc_ips[3]
    gw            = var.lxc_gw

  }
}