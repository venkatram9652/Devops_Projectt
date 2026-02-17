output "web_ips" {
  value = linode_instance.web[*].ipv4[0]
}
