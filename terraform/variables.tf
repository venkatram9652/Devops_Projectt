variable "linode_token" {
  type      = string
  sensitive = true
}

variable "region" {
  default = "us-east"
}

variable "instance_type" {
  default = "g6-standard-2"
}

variable "image" {
  default = "linode/ubuntu22.04"
}

variable "ssh_public_key" {
  type = string
}
