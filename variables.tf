variable "hcloud_token" {
#   default = <your-api-token>
    sensitive = false
    description = "Hetzner Cloud API token"
    type = string
}
# Nurnberg 1
variable "location" {
  default = "nbg1"
}

variable "http_protocol" {
  default = "http"
}

variable "http_port" {
  default = "80"
}

variable "instances" {
  default = "1"
}

variable "server_type" {
  default = "cax11"
}

variable "os_type" {
  default = "rocky-9"
}

variable "disk_size" {
  default = "40"
} 

variable "firewall" {
  type    = list(number)
  default = [1422971]
}

variable "datacenter" {
  type = string
  default = "nbg1-dc3"
}
