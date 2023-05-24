output "wireguard-ngb-01-output" {

  description = "Public IP of wireguard-ngb-01"

  value       = hcloud_server.wireguard-ngb-01.ipv4_address

}
