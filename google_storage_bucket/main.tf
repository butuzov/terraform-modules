# Terraform Requirements
terraform {
  required_version = ">= 0.12"
}

# Variables
variable "name" {}
variable "location" {}
variable "storage_class" {
  type    = string
  default = "STANDARD"
}

# ---- Labels ----------------------------------------------------
variable "project" {
  type        = string
  description = "label for deployment"
}

# ---- Infrastructure --------------------------------------------

resource "google_storage_bucket" "bucket" {
  name     = var.name
  location = var.location

  force_destroy = true
  storage_class = var.storage_class

  labels = { project = lower(var.project) }
}


output "url" {
  value = google_storage_bucket.bucket.url
}

output "name" {
  value = google_storage_bucket.bucket.name
}
