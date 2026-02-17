output "web_ips" {
  value = linode_instance.web[*].ip_address
}
