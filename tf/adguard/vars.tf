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

variable "lxc_nameserver" {
    type    = string
}

variable "lxc_template" {
    type    = string
}

variable "lxc_password" {
    type    = string
    sensitive = true
}

variable "pve_api_host" {
  type = string
}