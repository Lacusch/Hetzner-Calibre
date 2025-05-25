output "server_connection" {
  description = "SSH connection details for the Calibre server"
  value       = "Server is ready 🎉 Connect to it using: ssh root@${hcloud_server.calibre_server.ipv4_address}"
}

output "server_ip" {
  description = "Server IP address"
  value       = hcloud_server.calibre_server.ipv4_address
}
