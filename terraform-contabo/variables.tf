variable "client_id" {
  sensitive = true # Requires terraform >= 0.14
}
variable "client_secret" {
  sensitive = true # Requires terraform >= 0.14
}
variable "user" {
  sensitive = true # Requires terraform >= 0.14
}
variable "pass" {
  sensitive = true # Requires terraform >= 0.14
}
variable "region" {
  type = string
}
