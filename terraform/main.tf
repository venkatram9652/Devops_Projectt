provider "linode" {
  token = var.linode_token
}

resource "linode_instance" "web" {
  count  = 2
  label  = "web-${count.index}"
  region = var.region
  type   = "g6-standard-2"
  image  = "linode/ubuntu22.04"

authorized_keys = [
  trimspace(replace(var.ssh_public_key, "\n", ""))
]
}