# Terraform Requirements
terraform {
  required_version = ">= 0.12"
}

# Variables
variable "name" {
}

variable "zone_name" {
}

resource "google_dns_record_set" "mx" {
  name         = var.name
  managed_zone = var.zone_name

  type = "MX"
  ttl  = 300

  rrdatas = [
    "1 aspmx.l.google.com.",
    "5 alt1.aspmx.l.google.com.",
    "5 alt2.aspmx.l.google.com.",
    "10 alt3.aspmx.l.google.com.",
    "10 alt4.aspmx.l.google.com.",
  ]
}

