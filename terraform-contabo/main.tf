resource "contabo_secret" "pskirde-ssh" {
  name        = "example-ssh-key-pskirde"
    type        = "ssh"
    value         = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1hqLBO9/XaymjShXE4Q5aUkhgBdKibRZCMN1TbUT5IacKAl9wsmcEhnD0wzGo7TLiG28l/6WKQROv95lBqVG75SOqT5YPtP0tkdgfEaL2M68kjkKj8R3TTvq4mElx8K3RD6DibKOCw9Ih7NjTnTbl7agAMLxxXRkotgFOo0a8HaqCzgm3jdRnks207xgvnV1FeeCHNRuiENPD+KAjO9giRiOvmcxhOdGPJ5KIS/9kMZiW4ZBUoYzhE9YJUMVuJUeEhbUCkeueWEnmgH+Ue+mAuwgQQaEMLDMCq2cpJoxp4/BiZAzfKyS22zGhjjw7zoU/16++vKeJY/97A0g5oOjKlE+wd1nmWTpdbJgJolPen7MRh6Ql0SKLwgIzG2C1eoAzAXGmBhqx7jo82NaUU8a8qE8kIedPRu3Q5FrlcWVmud5TF10q2TDR1hsMLVpkbw+4E7CxsEb2RIBEhtPPw1w2Czo35a/MFzcEl2ITeohtXm2ySCEkdZkqLv9Zt8T9lBU= pascal@Pascals-Air"
}

resource "contabo_instance" "wireguard-instance" {
  display_name  = "wireguard-instance-${var.region}"
  product_id    = "V1"
  region        = "${var.region}"
  period        = 1
  ssh_keys      = [contabo_secret.pskirde-ssh.id]
}
