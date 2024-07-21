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

data "hcloud_ssh_key" "ssh_key_1" {
  id = "20954862"
}
