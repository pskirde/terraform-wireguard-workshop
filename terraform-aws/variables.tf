variable "access_key" {
  sensitive = true
  type = string
}


variable "secret_key" {
  sensitive = true
  type = string
}

variable "application_name" {
  type = string
}


variable "location" {
  type = string
}


variable "environment" {
  type = string
}
