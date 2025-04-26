terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.47.0"
    }
  }
}

provider "hcloud" {
  # Configuration options
  token = var.hcloud_token
}

data "hcloud_ssh_key" "fedora_laptop_ssh_key" {
  id = "28667665"
}

data "hcloud_primary_ip" "floating_ip" {
  name = "primary_ip-1"
}
