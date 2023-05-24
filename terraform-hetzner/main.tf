resource "hcloud_ssh_key" "pascal_ssh" {
  name       = "pascal_ssh_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "hcloud_server" "wireguard-ngb-01" {
  name        = "wireguard-${var.environment}-ngb-01"
  image       = "debian-11"
  server_type = "cx21"
  location = "nbg1"
  ssh_keys = [hcloud_ssh_key.pascal_ssh.id]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }
}

