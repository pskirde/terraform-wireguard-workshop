variable "hcloud_token" {
  sensitive = true # Requires terraform >= 0.14
}

variable "environment" {
  type    = string
  default = "dev"
}
