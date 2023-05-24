# Welcome to the Terraform & Wireguard Workshop!

In this small workshop we will look into wireguard as a VPN solution and then into Hashicorp Terraform as an Infrastructure as Code Tool. We will build a small VPN Network PoC, to show how easy it is to setup maintainable and secure infrastructure with Hashicorp Terraform.


# Setup the *.tfvars files

In each terraform directory please create a dev.tfvars file and populate it with the following values, depending on the platform.

## Contabo

> client_id="DE-XXXXX"
> client_secret="4XXXXXXXXXX"
> user="xxxx@xxx.com"
> pass="passwordthatissecure"
> region="EU"

## Hetzner

> hcloud_token="XXX"
> environment="dev"

## AWS

> access_key="Axxxxxxxx"
> secret_key="0xxxxxxxxxxxxxxxxxxxx"
> application_name="wireguard"
> location="frankfurt"
> environment="dev"

## Azure

> TBD


