# Terraform Requirements
terraform {
  required_version = ">= 0.12"
}

# Variables
variable "name" {}
variable "zone_name" {}


resource "google_dns_record_set" "a" {
  name         = "${var.name}"
  managed_zone = "${var.zone_name}"

  type = "A"
  ttl  = 300

  rrdatas = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
}
