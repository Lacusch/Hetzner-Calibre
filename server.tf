resource "hcloud_server" "test" {
  count       = var.instances
  name        = "test-server-${count.index}"
  image       = var.os_type
  server_type = var.server_type
#  location    = var.location
  ssh_keys    = [data.hcloud_ssh_key.ssh_key_1.name]
  labels = {
    type = "test"
  }
  firewall_ids = var.firewall
  datacenter = var.datacenter
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
    ipv6 = data.hcloud_primary_ip.floating_ip.id
  }
#  user_data = file("user_data.yml")
}
