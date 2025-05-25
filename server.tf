resource "hcloud_server" "test" {
  name        = var.server_name
  image       = var.os_type
  server_type = var.server_type
  #  location    = var.location
  ssh_keys = [data.id_ed22519_pub]
  labels = {
    type = "calibre"
  }
  firewall_ids = var.firewall
  datacenter   = var.datacenter
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  #  user_data = file("user_data.yml")
}

