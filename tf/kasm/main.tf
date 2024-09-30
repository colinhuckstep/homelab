resource "proxmox_lxc" "kasm" {
  target_node     = var.pve_node
  hostname        = var.lxc_hostname
  vmid            = 318
  ostemplate      = var.lxc_template
  password        = var.lxc_password
  unprivileged    = false
  cores           = 3
  memory          = 12288
  swap            = 1024
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
    size          = "150G"
  }
  features {
    nesting = true
    keyctl  = true
    fuse    = true
  }
  network {
    name          = "eth0"
    bridge        = "vmbr0"
    ip            = var.lxc_ip
    gw            = var.lxc_gw

  }
}