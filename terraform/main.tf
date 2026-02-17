provider "linode" {
  token = var.linode_token
}

# SSH key resource
resource "linode_sshkey" "default" {
  label   = "github-ansible-key"
  ssh_key = var.ssh_public_key
}

# Web servers
resource "linode_instance" "web" {
  count  = 2
  label  = "web-${count.index}"
  region = var.region
  type   = var.instance_type
  image  = var.image

  authorized_keys = [var.ssh_public_key]

  root_pass = "TempPassword123!" # optional if using SSH only
}

# NodeBalancer
resource "linode_nodebalancer" "lb" {
  label  = "web-lb"
  region = var.region
}
