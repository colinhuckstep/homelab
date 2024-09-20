terraform {
  required_providers {
    proxmox = {
      source = "Telmate/proxmox"
      version = "3.0.1-rc4"
    }
  }
  backend "s3" {
    bucket = "tfstate"
    key    = "adguard.tfstate"
    region = "us-east-1"
    skip_credentials_validation = true
    skip_region_validation = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_s3_checksum = true
  }
}

provider "proxmox" {
 pm_api_url   = var.pve_api_host
}

