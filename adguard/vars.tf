variable "pve_nodes" {
    type    = list(string)
}

variable "lxc_ips" {
    type    = list(string)
}

variable "lxc_gw" {
    type    = string
}

variable "lxc_hostnames" {
    type    = list(string)
}

variable "lxc_template" {
    type    = string
}

variable "lxc_password" {
    type    = string
    sensitive = true
}

variable "ssh_public_keys" {
  type = string
  default = <<-EOT
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID6HDc+/KqF0d2+34ndpGLVXF1iVrMN+H+OnWCPGlBSi
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINC8pAz7kyVMId2u/fruVZrmGWCQuod8JMrpYZS1zanH
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEf4L1u8R9VvM79YiYB4jI/UgNjHfoPNm2UGUo+oapnL
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILmaIUTiRQipJ2+qwjLtOZ8immyA/VjLEPe2Hp4DCNdU
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH06LjNsl5lYBSxZ7d/YO/zzmb7qUAgm9otrB3JyCl7i
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA7k21X+9AVAwvDjGkVlXTXAA/kQ0SBJBnumi5eQk336
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIID7LBsWMVSkp02r6w0mgHWZjv+yY4CgaYJ1KjEqhc0U
        ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHQuZ4Y/6OTdyisgxnY2Y7kW7SnuPPr2amsYUme6miE8
    EOT
}

variable "pve_api_host" {
  type = string
}