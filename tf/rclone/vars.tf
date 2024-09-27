variable "pve_node" {
    type    = string
}

variable "lxc_ip" {
    type    = string

}

variable "lxc_gw" {
    type    = string
}

variable "lxc_hostname" {
    type    = string
    default = "rclone"
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