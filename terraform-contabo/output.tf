output "name" {
  value = contabo_instance.wireguard-instance.display_name 
}
output "ip-configuration" {
  value = contabo_instance.wireguard-instance.ip_config
}
output "status" {
  value = contabo_instance.wireguard-instance.status
}

