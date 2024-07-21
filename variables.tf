variable "hcloud_token" {
#   default = <your-api-token>
    sensitive = false
    description = "Hetzner Cloud API token"
    type = string
}

variable "location" {
  default = "hel1"
}

#hel1-dc2

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

