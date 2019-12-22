# Terraform Requirements
terraform {
  required_version = ">= 0.12"
}

# Variables
variable "domain" {
}

# Zone
resource "google_dns_managed_zone" "zone" {
  name        = format("zone-%s", replace(var.domain, "/[^a-z0-9]/", ""))
  dns_name    = format("%s.", var.domain)
  description = format("%s", var.domain)

  labels = {
    createdate = formatdate("YYYY-MM-DD", timestamp())
    terraform  = true
  }
}

output "name_servers" {
  value = google_dns_managed_zone.zone.name_servers
}

output "managed_zone" {
  value = google_dns_managed_zone.zone.name
}

output "dns_name" {
  value = google_dns_managed_zone.zone.dns_name
}

output "domain" {
  value = var.domain
}

