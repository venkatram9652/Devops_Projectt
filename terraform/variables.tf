variable "linode_token" {
  type      = string
  sensitive = true
}

variable "ssh_public_key" {
  type = string
}

variable "region" {
  default = "us-east"
}
